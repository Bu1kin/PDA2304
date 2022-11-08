import 'dart:html';

class UserEntity{
  late int id;
  final String login;
  final String password;
  final String FIO;
  final Blob photo;
  late int id_role;

  UserEntity({
    required this.login,
    required this.password,
    required this.FIO,
    required this.photo,
    required this.id_role,
  });
}

//enum RoleEnum {а тут нужен enum???}