import 'package:app/common/app_env.dart';
import 'package:app/state/cubit/auth_state.dart';
import 'package:app/user.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.dio) : super(InitialState());

  final Dio dio;

  Future<void> signUp(User user) async {
    try {
      var result = await dio.put(AppEnv.auth, data: user);

      var data = User.fromJson(result.data["data"]);
      if(result.statusCode == 200){
        if(data.token == null) {
          throw DioError(
            requestOptions: RequestOptions(path: ''), error: 'Нет токена!'
          );
        } else {
          dio.options.headers['Authorization'] = 'Bearer ${data.token}';
        }
      }
      emit(SuccessState());
    } on DioError catch (e) {
      emit(ErrorState(e.response!.data['message']));
    }
  }

  Future<void> signIn(User user) async {
    try {
      var result = await dio.post(AppEnv.auth, data: user);
      var data = User.fromJson(result.data["data"]);
      if (result.statusMessage == "OK") {
        if (data.token == null) {
          throw DioError(
              requestOptions: RequestOptions(path: ''),
              error: 'При запросе токен не был получен!');
        } else {
          dio.options.headers['Authorization'] = 'Bearer ${data.token}';
        }
      }
      emit(SuccessState());
    } on DioError catch (e) {
      emit(ErrorState(e.response!.data['message']));
    }
  }

  Future<void> updateProfile(User user) async {
    try {
      var result = await dio.post(AppEnv.user, data: user);
      if (result.statusCode == 200) {
        emit(SuccessState());
      }
    } on DioError catch (e) {
      emit(ErrorState(e.response!.data['message']));
    }
  }
}