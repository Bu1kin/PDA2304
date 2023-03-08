import 'package:app/presentation/app_router.dart';
import 'package:app/presentation/signInPage.dart';
import 'package:app/presentation/signUpPage.dart';
import 'package:app/state/cubit/auth_cubit.dart';
import 'package:app/user.dart';
import 'package:app/widget/locator_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(App());
}

 class App extends StatelessWidget {
    App({super.key});
    AppRouter router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: router.generateRouter,
      initialRoute: signInPage,
    );
  }
}