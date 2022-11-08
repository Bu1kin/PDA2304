import 'package:flutter/foundation.dart';
import '../../domain/entity/color_entity.dart';

class Color extends ColorEntity{
  late int id;
  final String name_color;

  Color({
    required this.name_color,
  }) : super(name_color: name_color);

  Map<String, dynamic> toMap(){
    return {'name_color' : name_color};
  }

  factory Color.toFromMap(Map<String, dynamic> json){
    return Color(name_color: json['name_color']);
  }
}