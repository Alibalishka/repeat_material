import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:repeat/src/common/models/tokens_model.dart';

part 'log_in_event.dart';
part 'log_in_state.dart';

class LogInBloc extends Bloc<LogInEvent, LogInState> {
  LogInBloc(): super(LogInInitial()){
    on<LogInPressed>(_authUser);
  }
  Dio dio = Dio();
  Box tokensBox = Hive.box('tokens');

  void _authUser(event, Emitter<LogInState> emit) async{
    emit(LogInLoading());
    try{
      Response response = await dio.post(
        'http://188.225.83.80:6719/api/v1/auth/login',
        data: {
          'email': event.email,
          'password': event.password
        },
      );

      TokensModel tokensModel = TokensModel.fromJson(
        response.data['tokens']
      );

      tokensBox.put('accessToken', tokensModel.access);
      tokensBox.put('refreshToken', tokensModel.refresh);
      
      emit(LogInLoaded());
    }catch(e){
      emit(LogInFailed(message: 'Неправильный логин или пароль'));
      rethrow;
    }
  }
}