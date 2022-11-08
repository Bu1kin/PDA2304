import 'package:flutter/foundation.dart';
import '../../domain/entity/country_entity.dart';

class Country extends CountryEntity{
  late int id;
  final String name_country;

  Country({
    required this.name_country,
  }) : super(name_country: name_country);

  Map<String, dynamic> toMap(){
    return {'name_country' : name_country};
  }

  factory Country.toFromMap(Map<String, dynamic> json){
    return Country(name_country: json['name_country']);
  }
}