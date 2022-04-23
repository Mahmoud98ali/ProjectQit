import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qit_test/modules/cubit/states.dart';

import '../../shared/network/remote/dio_helper.dart';

class QitLoginCubit extends Cubit<QitLoginStates> {
  QitLoginCubit() : super(QitLoginInitialState());

  static QitLoginCubit get(context) => BlocProvider.of(context);

  void userLogin({
    required String email,
    required String password,
  }) {

    emit(QitLoginLoadingState());
    DioHelper.postLogin(data: {
      "email":email,
      "password": password,
    }).then((value) {
      emit(QitLoginSuccessState());
      print(value);
    }).catchError((error) {
      emit(QitLoginErrorState(error.toString()));
      print(error);
    });
  }




  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true ;
  void ChangePasswordVisibility(){
    isPassword=!isPassword;
    if(isPassword){
      suffix = Icons.visibility_outlined ;
    }else{
      suffix = Icons.visibility_off_outlined;
    }
    emit(QitChangePasswordVisibilityState());
  }



}
