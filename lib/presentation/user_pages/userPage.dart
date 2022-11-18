import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_router.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        //
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Container(
          alignment: Alignment.center,
          child: const Text(
          'Экран пользователя',
          style: TextStyle(
            fontSize: 24,
          ),
          textAlign: TextAlign.center,
        ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, signInPage);
          },
          child: Text('Выйти'),
        ),
      ]),
    ));
  }
}