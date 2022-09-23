import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SignInLayout extends StatelessWidget {
  const SignInLayout({super.key});

  @override
  Widget build(BuildContext context) {
    Widget texts = Column(
      children: [
        const Text(
          'medinow',
          style: TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 4.0),
        ),

        const Text(
          'Meditate With Us!',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),

        Container(
          margin: EdgeInsets.fromLTRB(24, 40, 24, 6),
          alignment: Alignment.center,
          width: double.maxFinite,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35),
            color: Colors.white,
          ),
          child: const Text(
            'Sign in with Apple',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18
            ),
          ),
        ),

        Container(
          margin: EdgeInsets.fromLTRB(24, 6, 24, 20),
          alignment: Alignment.center,
          width: double.maxFinite,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35),
            color: Colors.tealAccent,
          ),
          child: const Text(
            'Continue with Email or Phone',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18
            ),
          ),
        ),

        const Text(
          'Continue With Google',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ],
    );

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            texts,
            Image.asset('assets/images/man_meditating.png'),
          ],
        ),
      ),
    );
  }
}
