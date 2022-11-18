import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_router.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        alignment: Alignment.center,
        child: Column(
          //
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          const Text(
            'Экран админа',
            style: TextStyle(
              fontSize: 24,
            ),
            textAlign: TextAlign.center,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, signInPage);
            },
            child: Text('Выйти'),
          ),
        ]),
      ),
    ));
  }
}
