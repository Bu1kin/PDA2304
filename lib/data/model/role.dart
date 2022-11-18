import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/domain/entity/role_entity.dart';

class Role extends RoleEntity{
  Role({required super.name_role});

  Map<String, dynamic> toMap(){
    return {'name_role' : name_role};
  }

  factory Role.toFromMap(Map<String, dynamic> json){
    return Role(name_role: json['name_role']);
  }
}