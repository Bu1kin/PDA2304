import 'package:app/common/app_env.dart';
import 'package:app/state/cubit/auth_cubit.dart';
import 'package:app/state/cubit/data_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // sl.registerLazySingleton(() => AuthCubit(sl()));
  // sl.registerLazySingleton(() => DataCubit(sl()));

  sl.registerLazySingleton(
    () => Dio(
      BaseOptions(
        sendTimeout: 1500,
        //connectTimeout: 1500,
        receiveTimeout: 1500,
        baseUrl: '${AppEnv.protocol}://${AppEnv.ip}',
      ),
    ),
  );
}