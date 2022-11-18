import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/db/data_base_helper.dart';
import 'package:flutter_application_1/data/repositories/auth_repositories_impl.dart';
import 'package:flutter_application_1/domain/entity/role_entity.dart';
import 'package:flutter_application_1/domain/usercases/auth.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import 'app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DataBaseHelper.instance.init();
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
