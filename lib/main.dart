import 'package:flutter/material.dart';
import 'package:pr5_final/result_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
  final sharedPreferences = await SharedPreferences.getInstance();
  runApp(MyApp(sharedPreferences));
}

class MyApp extends StatelessWidget {
  const MyApp(this.sharedPreferences, {super.key});

  final SharedPreferences sharedPreferences;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(sharedPreferences, title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage(this.sharedPreferences, {super.key, required this.title});
  final SharedPreferences sharedPreferences;
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final stringController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: stringController,
              decoration: InputDecoration(
                hintText: 'Введите строку',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: Text('Сохранить'),
              onPressed: (){
                widget.sharedPreferences.setString('str', stringController.text);
                Navigator.push(
                  context, MaterialPageRoute(
                    builder: (context) => ResultScreen(widget.sharedPreferences),
                  ),
                );
              },
            ),

            SizedBox(
              height: 10,
            ),

            ElevatedButton(
              child: Text('Посмотреть результаты'),
              onPressed: (){
                widget.sharedPreferences.getString('str');
                Navigator.push(
                  context, MaterialPageRoute(
                    builder: (context) => ResultScreen(widget.sharedPreferences),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
