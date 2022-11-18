import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/common/database_request.dart';
import 'package:flutter_application_1/core/db/data_base_helper.dart';
import 'package:flutter_application_1/data/model/user.dart';
import 'package:flutter_application_1/domain/entity/role_entity.dart';
import 'package:flutter_application_1/domain/repositories/auth_repositories.dart';
import 'package:flutter_application_1/core/crypto/crypto.dart';
import 'package:sqflite/sqflite.dart';

class AuthRepositoriesImpl implements AuthRepositories{
  final _db = DataBaseHelper.instance.dataBase;

  @override
  String get table => DataBaseRequest.tableUser;

  @override
  Future<Either<String, RoleEnum>> signIn(String login, String password) async {
    try{
      final user = (await _db.query(
        table, 
        columns: ['id','login', 'password', 'FIO', 'id_role'],
        where: 'login = ?',
        whereArgs: [login],
      )).map((e) => User.toFromMap(e));

      if(user.isEmpty){
        return Left('Такого пользователя нет в системе!');
      }

      if(user.first.password != Crypto.encoding(password)){
        return Left('Неверный пароль!');
      }
      
      return Right(user.first.id_role);

    } on DatabaseException catch(error){
      print(error.result);
      return Left('Увы.......................');
    }
  }

  @override
  Future<Either<String, bool>> signUp(String login, String password, String FIO) async {
    try{
      await _db.insert(
        table, 
        User(login: login, password: password, FIO: FIO, id_role: RoleEnum.user).toMap()
      );
      return const Right(true);
    } on DatabaseException catch(error){
      print(error.result);
      return const Left('');
    }
  }
}