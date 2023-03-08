// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'finance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Finance _$$_FinanceFromJson(Map<String, dynamic> json) => _$_Finance(
      id: json['id'] as int?,
      financeName: json['financeName'] as String?,
      financeDesc: json['financeDesc'] as String?,
      financeCategory: json['financeCategory'] as String?,
      financeDate: json['financeDate'] as String?,
      financeSum: json['financeSum'] as String?,
    );

Map<String, dynamic> _$$_FinanceToJson(_$_Finance instance) =>
    <String, dynamic>{
      'id': instance.id,
      'financeName': instance.financeName,
      'financeDesc': instance.financeDesc,
      'financeCategory': instance.financeCategory,
      'financeDate': instance.financeDate,
      'financeSum': instance.financeSum,
    };
