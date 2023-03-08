import 'package:app/common/app_env.dart';
import 'package:app/getmodel.dart';
import 'package:app/model/finance.dart';
import 'package:app/state/cubit/data_state.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

class DataCubit extends Cubit<DataState> {
  DataCubit(this.dio) : super(InitialState());

  final Dio dio;

  Future<List<Finance>> getAll() async {
    try {
      var result = await dio.get(AppEnv.finance);
      List<Finance> finances = <Finance>[];
      for(var el in result.data) {
        var data = Finance.fromJson(el);
        finances.add(data);
      }
      emit(SuccessState(finances));
      return finances;
    } on DioError catch (e) {
      emit(ErrorState(e.response!.data['message']));
      return List.empty();
    }
  }

  Future<void> addFinance(Finance finance) async {
    try {
      var result = await dio.post(AppEnv.finance, data: finance);
      emit(SuccessState(List.empty()));
    } on DioError catch (e) {
      emit(ErrorState(e.response!.data['message']));
    }
  }

  Future<void> updateFinance(Finance finance) async {
    try {
      var result = await dio.put(AppEnv.finance, data: finance);
      emit(SuccessState(List.empty()));
    } on DioError catch (e) {
      emit(ErrorState(e.response!.data['message']));
      print(e);
    }
  }

  Future<void> deleteFinance(int id, int active) async {
    try {
      var result = await dio.delete(AppEnv.finance, queryParameters: <String, dynamic>{"id": id, "active": active});
      emit(SuccessState(List.empty()));
    } on DioError catch (e) {
      emit(ErrorState(e.response!.data['message']));
    }
  }
}
