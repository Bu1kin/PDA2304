import 'package:flutter_application_1/domain/entity/role_entity.dart';

class UserEntity{
  late int id;
  final String login;
  final String password;
  final String FIO;
  late RoleEnum id_role;

  UserEntity({
    this.id = 0,
    required this.login,
    required this.password,
    required this.FIO,
    required this.id_role,
  });
}

//enum RoleEnum {а тут нужен enum???}