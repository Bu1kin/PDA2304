// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'finance.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Finance _$FinanceFromJson(Map<String, dynamic> json) {
  return _Finance.fromJson(json);
}

/// @nodoc
mixin _$Finance {
  int? get id => throw _privateConstructorUsedError;
  String? get financeName => throw _privateConstructorUsedError;
  String? get financeDesc => throw _privateConstructorUsedError;
  String? get financeCategory => throw _privateConstructorUsedError;
  String? get financeDate => throw _privateConstructorUsedError;
  String? get financeSum => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FinanceCopyWith<Finance> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FinanceCopyWith<$Res> {
  factory $FinanceCopyWith(Finance value, $Res Function(Finance) then) =
      _$FinanceCopyWithImpl<$Res, Finance>;
  @useResult
  $Res call(
      {int? id,
      String? financeName,
      String? financeDesc,
      String? financeCategory,
      String? financeDate,
      String? financeSum});
}

/// @nodoc
class _$FinanceCopyWithImpl<$Res, $Val extends Finance>
    implements $FinanceCopyWith<$Res> {
  _$FinanceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? financeName = freezed,
    Object? financeDesc = freezed,
    Object? financeCategory = freezed,
    Object? financeDate = freezed,
    Object? financeSum = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      financeName: freezed == financeName
          ? _value.financeName
          : financeName // ignore: cast_nullable_to_non_nullable
              as String?,
      financeDesc: freezed == financeDesc
          ? _value.financeDesc
          : financeDesc // ignore: cast_nullable_to_non_nullable
              as String?,
      financeCategory: freezed == financeCategory
          ? _value.financeCategory
          : financeCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      financeDate: freezed == financeDate
          ? _value.financeDate
          : financeDate // ignore: cast_nullable_to_non_nullable
              as String?,
      financeSum: freezed == financeSum
          ? _value.financeSum
          : financeSum // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FinanceCopyWith<$Res> implements $FinanceCopyWith<$Res> {
  factory _$$_FinanceCopyWith(
          _$_Finance value, $Res Function(_$_Finance) then) =
      __$$_FinanceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? financeName,
      String? financeDesc,
      String? financeCategory,
      String? financeDate,
      String? financeSum});
}

/// @nodoc
class __$$_FinanceCopyWithImpl<$Res>
    extends _$FinanceCopyWithImpl<$Res, _$_Finance>
    implements _$$_FinanceCopyWith<$Res> {
  __$$_FinanceCopyWithImpl(_$_Finance _value, $Res Function(_$_Finance) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? financeName = freezed,
    Object? financeDesc = freezed,
    Object? financeCategory = freezed,
    Object? financeDate = freezed,
    Object? financeSum = freezed,
  }) {
    return _then(_$_Finance(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      financeName: freezed == financeName
          ? _value.financeName
          : financeName // ignore: cast_nullable_to_non_nullable
              as String?,
      financeDesc: freezed == financeDesc
          ? _value.financeDesc
          : financeDesc // ignore: cast_nullable_to_non_nullable
              as String?,
      financeCategory: freezed == financeCategory
          ? _value.financeCategory
          : financeCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      financeDate: freezed == financeDate
          ? _value.financeDate
          : financeDate // ignore: cast_nullable_to_non_nullable
              as String?,
      financeSum: freezed == financeSum
          ? _value.financeSum
          : financeSum // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Finance implements _Finance {
  const _$_Finance(
      {this.id,
      this.financeName,
      this.financeDesc,
      this.financeCategory,
      this.financeDate,
      this.financeSum});

  factory _$_Finance.fromJson(Map<String, dynamic> json) =>
      _$$_FinanceFromJson(json);

  @override
  final int? id;
  @override
  final String? financeName;
  @override
  final String? financeDesc;
  @override
  final String? financeCategory;
  @override
  final String? financeDate;
  @override
  final String? financeSum;

  @override
  String toString() {
    return 'Finance(id: $id, financeName: $financeName, financeDesc: $financeDesc, financeCategory: $financeCategory, financeDate: $financeDate, financeSum: $financeSum)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Finance &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.financeName, financeName) ||
                other.financeName == financeName) &&
            (identical(other.financeDesc, financeDesc) ||
                other.financeDesc == financeDesc) &&
            (identical(other.financeCategory, financeCategory) ||
                other.financeCategory == financeCategory) &&
            (identical(other.financeDate, financeDate) ||
                other.financeDate == financeDate) &&
            (identical(other.financeSum, financeSum) ||
                other.financeSum == financeSum));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, financeName, financeDesc,
      financeCategory, financeDate, financeSum);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FinanceCopyWith<_$_Finance> get copyWith =>
      __$$_FinanceCopyWithImpl<_$_Finance>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FinanceToJson(
      this,
    );
  }
}

abstract class _Finance implements Finance {
  const factory _Finance(
      {final int? id,
      final String? financeName,
      final String? financeDesc,
      final String? financeCategory,
      final String? financeDate,
      final String? financeSum}) = _$_Finance;

  factory _Finance.fromJson(Map<String, dynamic> json) = _$_Finance.fromJson;

  @override
  int? get id;
  @override
  String? get financeName;
  @override
  String? get financeDesc;
  @override
  String? get financeCategory;
  @override
  String? get financeDate;
  @override
  String? get financeSum;
  @override
  @JsonKey(ignore: true)
  _$$_FinanceCopyWith<_$_Finance> get copyWith =>
      throw _privateConstructorUsedError;
}
