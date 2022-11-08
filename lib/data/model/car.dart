import 'package:flutter/foundation.dart';
import '../../domain/entity/car_entity.dart';

class Car extends CarEntity{
  late int id;
  late int id_color;
  late int id_type;
  late int id_brand;
  late int id_model;
  late int id_kpp;
  late int id_country;
  late int id_user;
  late int weigth;
  late int mileage;
  late int capacity;

  Car({
    required this.id_color,
    required this.id_type,
    required this.id_brand,
    required this.id_model,
    required this.id_kpp,
    required this.id_country,
    required this.id_user,
    required this.weigth,
    required this.mileage,
    required this.capacity,
  }) : super(
            id_color: id_color,
            id_type: id_type,
            id_brand: id_brand,
            id_model: id_model,
            id_kpp: id_kpp,
            id_country: id_country,
            id_user: id_user,
            weigth: weigth,
            mileage: mileage,
            capacity: capacity);

  Map<String, dynamic> toMap(){
    return {
      'id_color' : id_color,
      'id_type' : id_type,
      'id_brand' : id_brand,
      'id_model' : id_model,
      'id_kpp' : id_kpp,
      'id_country' : id_country,
      'id_user' : id_user,
      'weigth' : weigth,
      'mileage' : mileage,
      'capacity' : capacity,
    };
  }

  factory Car.toFromMap(Map<String, dynamic> json){
    return Car(
      id_color: json['id_color'],
      id_type: json['id_type'],
      id_brand: json['id_brand'],
      id_model: json['id_model'],
      id_kpp: json['id_kpp'],
      id_country: json['id_country'],
      id_user: json['id_user'],
      weigth: json['weigth'],
      mileage: json['mileage'],
      capacity: json['capacity'],
    );
  }
}