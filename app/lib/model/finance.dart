import 'package:freezed_annotation/freezed_annotation.dart';
part 'finance.freezed.dart';
part 'finance.g.dart';

@freezed
class Finance with _$Finance {
  const factory Finance({
   
    int? id,
    String? financeName,
    String? financeDesc,
    String? financeCategory,
    String? financeDate,
    String? financeSum,
  }) = _Finance;

  factory Finance.fromJson(Map<String, dynamic> json) => _$FinanceFromJson(json);
}