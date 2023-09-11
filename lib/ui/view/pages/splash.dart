import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zinjanow_app/ui/notify/auth/auth_check_notifier.dart';
import 'package:zinjanow_app/ui/view/pages/home.dart';
import 'package:zinjanow_app/ui/view/pages/welcome.dart';

class Splash extends ConsumerStatefulWidget {
  const Splash({super.key});

  @override
  SplashState createState() => SplashState();
}

class SplashState extends ConsumerState<Splash> {
  @override
  Widget build(BuildContext context) {
    ref.listen(authStateCheckProvider, (previous, next) { 
      final authState = ref.watch(authStateCheckProvider);

      authState.when(
        data: (state) {
          if(state.isAuth == true) {
            // ignore: use_build_context_synchronously
            Navigator.pushAndRemoveUntil(
              context, 
              MaterialPageRoute(builder: (context) => const Home()), 
              (route) => false
            );
          } else {
            // ignore: use_build_context_synchronously
            Navigator.pushAndRemoveUntil(
              context, 
              MaterialPageRoute(builder: (context) => const Welcome()), 
              (route) => false
            );
          }
        }, 
        error: (error, _) {
          // 
        }, 
        loading: () {
          Future.delayed(Duration.zero);
        }
      );
    });

    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(color: Colors.black)
      )
    );
    
  }
}