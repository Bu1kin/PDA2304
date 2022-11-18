import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/domain/entity/user_entity.dart';
import 'package:flutter_application_1/domain/entity/role_entity.dart';
import 'package:flutter_application_1/core/crypto/crypto.dart';

class User extends UserEntity{

  User({
    super.id = 0,
    required super.login, 
    required super.password,
    required super.FIO,
    required super.id_role});

  Map<String, dynamic> toMap() {
    return {
      'login': login,
      'password': Crypto.encoding(password),
      'FIO': FIO,
      'id_role': id_role.id,
    };
  }

  factory User.toFromMap(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      login: json['login'],
      password: json['password'],
      FIO: json['FIO'],
      id_role: RoleEnum.values.firstWhere(
        (element) => element.id == (json['id_role'] as int),
      ),
    );
  }
}
