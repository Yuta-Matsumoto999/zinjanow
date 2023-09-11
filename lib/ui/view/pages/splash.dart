import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:zinjanow_app/ui/view/pages/home.dart';
import 'package:zinjanow_app/ui/view/pages/welcome.dart';

class Splash extends ConsumerStatefulWidget {
  const Splash({super.key});

  @override
  SplashState createState() => SplashState();
}

class SplashState extends ConsumerState<Splash> {
  final supabase = Supabase.instance.client;

  @override
  void initState() {
    super.initState();
    _redirect();
  }

  Future<void> _redirect() async {
    await Future.delayed(Duration.zero);
    
    final session = supabase.auth.currentSession;

    if(session == null) {
      // ignore: use_build_context_synchronously
      Navigator.pushAndRemoveUntil(
        context, 
        MaterialPageRoute(builder: (context) => const Welcome()), 
        (route) => false
      );
    } else {
      // ignore: use_build_context_synchronously
      Navigator.pushAndRemoveUntil(
        context, 
        MaterialPageRoute(builder: (context) => const Home()), 
        (route) => false
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(color: Colors.black)
      )
    );
  }
}