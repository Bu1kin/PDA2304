import 'package:dartz/dartz.dart';
import '../entity/role_entity.dart';

abstract class AuthRepositories{
  //Название таблицы
  String get table;
  //авторизация пользователя
  Future<Either<String,RoleEnum>> signIn(String login, String password);
  //Регистрация пользователя
  Future<Either<String,bool>> signUp(String login, String password, String FIO);
}