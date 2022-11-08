import 'package:flutter/foundation.dart';
import '../../domain/entity/kpp_entity.dart';

class KPP extends KPPEntity{
  late int id;
  final String name_kpp;

  KPP({
    required this.name_kpp,
  }) : super(name_kpp: name_kpp);

  Map<String, dynamic> toMap(){
    return {'name_kpp' : name_kpp};
  }

  factory KPP.toFromMap(Map<String, dynamic> json){
    return KPP(name_kpp: json['name_kpp']);
  }
}