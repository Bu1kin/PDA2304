import 'package:flutter/foundation.dart';
import '../../domain/entity/model_entity.dart';

class Model extends ModelEntity{
  late int id;
  final String name_model;

  Model({
    required this.name_model,
  }) : super(name_model: name_model);

  Map<String, dynamic> toMap(){
    return {'name_model' : name_model};
  }

  factory Model.toFromMap(Map<String, dynamic> json){
    return Model(name_model: json['name_model']);
  }
}