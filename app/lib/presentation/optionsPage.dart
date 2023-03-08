import 'package:app/presentation/app_router.dart';
import 'package:flutter/material.dart';

class OptionsPage extends StatefulWidget {
  const OptionsPage({super.key});

  @override
  State<OptionsPage> createState() => _OptionsPageState();
}

class _OptionsPageState extends State<OptionsPage> {
  @override
  Widget build(BuildContext context) {
    double custom_width = MediaQuery.of(context).size.width * 0.5;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: custom_width,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, urprofile);
                    },
                    child: Text('Профиль', style: TextStyle(fontSize: 38))),
              ),
              const SizedBox(height: 8),
              Container(
                width: custom_width,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, financesPage);
                    },
                    child: Text('Финансы', style: TextStyle(fontSize: 38))),
              ),
              const SizedBox(height: 8),
              Container(
                width: custom_width,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, signInPage);
                    },
                    child: Text('Выйти', style: TextStyle(fontSize: 38))),
              ),
            ],
          ),
          //const Spacer(),
          ),
        )
      ),
    );
  }
}