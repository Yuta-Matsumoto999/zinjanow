import 'package:flutter/material.dart';
import 'package:zinjanow_app/ui/components/background.dart';
import 'package:zinjanow_app/ui/components/roundedButton.dart';

class Welcome extends StatelessWidget {
  const Welcome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 100),
            child: const Center(
              child: Text("Zinjanow", style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                ),
              ),
            )
          ),
          SizedBox(
            height: size.height * 0.53,
          ),
          const RoundedButton(title: "login", color: 0xFFFFFFFF, marginTop: 0, marginBottom: 34),
          const RoundedButton(title: "Register", color: 0xFFFFFFFF, marginTop: 0, marginBottom: 0)
        ]
      )
    );
  }
}