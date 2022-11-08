import 'package:flutter/foundation.dart';
import '../../domain/entity/brand_entity.dart';

class Brand extends BrandEntity{
  late int id;
  final String name_brand;

  Brand({
    required this.name_brand,
  }) : super(name_brand: name_brand);

  Map<String, dynamic> toMap(){
    return {'name_brand' : name_brand};
  }

  factory Brand.toFromMap(Map<String, dynamic> json){
    return Brand(name_brand: json['name_brand']);
  }
}