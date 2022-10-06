
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.I;

initGetIt(){
  getIt.registerLazySingleton(() => Dio(BaseOptions(baseUrl: 'http://188.225.83.80:6719/api/v1/')));
}