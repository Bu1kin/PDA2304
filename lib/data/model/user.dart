import 'dart:html';
import 'package:flutter/foundation.dart';
import '../../domain/entity/user_entity.dart';

class User extends UserEntity{
  late int id;
  final String login;
  final String password;
  final String FIO;
  final Blob photo;
  late int id_role;

  User({
    required this.login,
    required this.password,
    required this.FIO,
    required this.photo,
    required this.id_role,
  }) : super(
            login: login,
            password: password,
            FIO: FIO,
            photo: photo,
            id_role: id_role);

  Map<String, dynamic> toMap() {
    return {
      'login': login,
      'password': password,
      'FIO': FIO,
      'photo': photo,
      'id_role': id_role
    };
  }

  factory User.toFromMap(Map<String, dynamic> json) {
    return User(
      login: json['login'],
      password: json['password'],
      FIO: json['FIO'],
      photo: json['photo'],
      id_role: json['id_role'],
    );
  }
}
