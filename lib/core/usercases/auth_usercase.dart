import 'package:dartz/dartz.dart';
import '../../domain/entity/role_entity.dart';

abstract class AuthUserCase<String,Params, LoginParams>{
  Future<Either<String,RoleEnum>> signIn(LoginParams params);
  Future<Either<String,bool>> signUp(Params params);
}