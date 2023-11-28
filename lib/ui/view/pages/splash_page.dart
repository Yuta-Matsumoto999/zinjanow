import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:zinjanow_app/ui/view/root/app_router.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashState();
}

class _SplashState extends State<SplashPage> {
  bool isAuth = false;

  @override
  void initState() {
    super.initState();
    _checkAuthentication();
  }

  void _checkAuthentication() async {
    final session = await Supabase.instance.client.auth.currentSession;

    if(session != null && !session.isExpired) {
      context.router.pushAndPopUntil(
        const RouterRoute(), 
        predicate: (route) => false
      );
    } else {
      context.router.pushAndPopUntil(
        const WelcomeRoute(), 
        predicate: (route) => false
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}