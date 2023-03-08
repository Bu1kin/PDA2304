import 'package:app/presentation/crud_finances.dart';
import 'package:app/presentation/financesPage.dart';
import 'package:app/presentation/optionsPage.dart';
import 'package:app/presentation/signInPage.dart';
import 'package:app/presentation/signUpPage.dart';
import 'package:app/presentation/ur_profile.dart';
import 'package:flutter/material.dart';

const String signInPage = 'signInPage';
const String signUpPage = 'signUpPage';
const String urprofile = 'urprofile';
const String crud_finances = 'crud_finances';
const String financesPage = 'financesPage';
const String optionsPage = 'optionsPage';

class AppRouter{
  Route<dynamic>? generateRouter(RouteSettings settings){
    switch(settings.name){
      case signInPage :{
        return MaterialPageRoute(builder: (builder) => SignIn());
      }
      case signUpPage :{
        return MaterialPageRoute(builder: (builder) => SignUp());
      }
      case urprofile :{
        return MaterialPageRoute(builder: (builder) => UrProfile());
      }
      case crud_finances :{
        return MaterialPageRoute(builder: (builder) => CRUD_Finances());
      }
      // case financesPage :{
      //   return MaterialPageRoute(builder: (builder) => FinancesPage());
      // }
      case financesPage :{
        return MaterialPageRoute(builder: (builder) => TestLol());
      }
      case optionsPage :{
        return MaterialPageRoute(builder: (builder) => OptionsPage());
      }
    }
  }
}