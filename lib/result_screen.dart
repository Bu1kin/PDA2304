import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pr5_final/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen(this.sharedPreferences, {super.key});
  final SharedPreferences? sharedPreferences;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  String? stringValue;

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            stringValue == null ? Text('Нет записей :(') : Text(stringValue!),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              child: Text('Назад'),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyApp(widget.sharedPreferences!),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}