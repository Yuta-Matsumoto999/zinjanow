import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:zinjanow_app/infrastructure/datasource/auth/supabase_auth_datasource.dart';
import 'package:zinjanow_app/infrastructure/model/auth/auth_check_response_model.dart';

class SupabaseAuthDatasourceImpl implements SupabaseAuthDatasource {
  final supabase = Supabase.instance.client;

  @override
  Future<AuthCheckResponseModel> check() async {
    try {
      final res = supabase.auth.currentSession;

      if(res != null) {
        return AuthCheckResponseModel(isAuth: true, message: null);
      } else {
        return AuthCheckResponseModel(isAuth: false, message: null);
      }
    } catch(err) {
      throw Exception();
    }
  }

  @override
  Future<AuthCheckResponseModel> login(email, password) async {
    try {
      await supabase.auth.signInWithPassword(
        email: email,
        password: password
      );
      return AuthCheckResponseModel(isAuth: true, message: null);
    } on AuthException catch(err) {
      return AuthCheckResponseModel(isAuth: false, message: err.message);
    } catch (err) {
      // ここで通信エラーのハンドリング
      throw Exception();
    }
  }

  @override
  Future<AuthCheckResponseModel> signup(String name, String email, String password) async {
    try {
      await supabase.auth.signUp(
        email: email,
        password: password,
        data: {"full_name": name}
      );
      return AuthCheckResponseModel(isAuth: true, message: null);
    } on AuthException catch (err) {
      return AuthCheckResponseModel(isAuth: false, message: err.message);
    } catch(err) {
      throw Exception();
    }
  }

  @override
  Future<AuthCheckResponseModel> logout() async {
    try {
      await supabase.auth.signOut();
      return AuthCheckResponseModel(isAuth:false, message: null);
    } on AuthException catch (err) {
      return AuthCheckResponseModel(isAuth: true, message: err.message);
    } catch(err) {
      throw Exception();
    }
  }

  @override
  Future<AuthCheckResponseModel> googleSignUp() async {
    // 16文字のランダムな文字列を生成
    String generateRandomString() {
      final random = Random.secure();
      return base64Url.encode(List<int>.generate(16, (_) => random.nextInt(256)));
    }

    const appAuth = FlutterAppAuth();

    final rawNonce = generateRandomString();
    final hashedNonce = sha256.convert(utf8.encode(rawNonce)).toString();

    final clientId = Platform.isIOS ? dotenv.get("IOS_CLIENT_ID") : dotenv.get("ANDROID_CLIENT_ID");

    final redirectUrl = '${clientId.split('.').reversed.join('.')}:/';

    const discoveryUrl ='https://accounts.google.com/.well-known/openid-configuration';

    try {
      // authorize the user by opening the concent page
      final result = await appAuth.authorize(
        AuthorizationRequest(
          clientId,
          redirectUrl,
          discoveryUrl: discoveryUrl,
          nonce: hashedNonce,
          scopes: [
            'openid',
            'email',
            'profile',
          ],
        ),
      );

      if (result == null) {
        throw Exception();
      }

      // Request the access and id token to google
      final tokenResult = await appAuth.token(
        TokenRequest(
          clientId,
          redirectUrl,
          authorizationCode: result.authorizationCode,
          discoveryUrl: discoveryUrl,
          codeVerifier: result.codeVerifier,
          nonce: result.nonce,
          scopes: [
            'openid',
            'email',
          ],
        ),
      );

      final idToken = tokenResult?.idToken;

      if (idToken == null) {
        throw Exception();
      }

      await supabase.auth.signInWithIdToken(
        provider: Provider.google,
        idToken: idToken,
        nonce: rawNonce,
      );

      return AuthCheckResponseModel(isAuth: true, message: null);
    } catch(err) {
      return AuthCheckResponseModel(isAuth: false, message: "failed Google Authenticate");
    }
  }
}