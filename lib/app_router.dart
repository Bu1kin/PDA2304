import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/auth_pages/signInPage.dart';
import 'package:flutter_application_1/presentation/auth_pages/signUpPage.dart';
import 'package:flutter_application_1/presentation/user_pages/adminPage.dart';
import 'package:flutter_application_1/presentation/user_pages/userPage.dart';

const String signInPage = 'signInPage';
const String signUpPage = 'signUpPage';
const String adminPage = 'adminPage';
const String userPage = 'userPage';

class AppRouter{
  Route<dynamic>? generateRouter(RouteSettings settings){
    switch(settings.name){
      case signInPage :{
        return MaterialPageRoute(builder: (builder) => SignIn());
      }
      case signUpPage :{
        return MaterialPageRoute(builder: (builder) => SignUp());
      }
      case adminPage :{
        return MaterialPageRoute(builder: (builder) => AdminPage());
      }
      case userPage :{
        return MaterialPageRoute(builder: (builder) => UserPage());
      }
    }
  }
}