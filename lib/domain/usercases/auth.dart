import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/usercases/auth_usercase.dart';
import 'package:flutter_application_1/domain/entity/role_entity.dart';
import 'package:flutter_application_1/domain/repositories/auth_repositories.dart';


class Auth implements AuthUserCase<String, AuthParams, LoginParams>{
  final AuthRepositories authRepositories;
  Auth(this.authRepositories);

  @override
  Future<Either<String, RoleEnum>> signIn(LoginParams params) {
    return authRepositories.signIn(params.login, params.password);
  }

  @override
  Future<Either<String, bool>> signUp(AuthParams params) {
    return authRepositories.signUp(params.login, params.password, params.FIO);
  }

}
class LoginParams{
  final String login;
  final String password;

  LoginParams({
    required this.login, 
    required this.password
  });
}

class AuthParams{
  final String login;
  final String password;
  final String FIO;

  AuthParams({
    required this.login, 
    required this.password,
    required this.FIO,
  });
}