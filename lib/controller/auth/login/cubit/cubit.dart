import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iiii/controller/auth/login/cubit/states.dart';
import 'package:iiii/controller/service/dio_hellper.dart';
import 'package:iiii/model/auth/login_model.dart';

import 'package:iiii/model/end_point.dart';

class ShopLoginCubit extends Cubit<ShopAppLoginStates> {
  ShopLoginCubit() : super(IntialShopAppLoginStates ());

  static ShopLoginCubit get(context) => BlocProvider.of(context);

  ShopLoginModel? PostLogin ;
  IconData suffix = Icons.visibility_outlined ;
  bool password = true;


  //// Auth data TO API
  void getLogin({required String? email, required String? password,required String? name, required String? phone}) async {
    emit(ShopAppLoadingStates());
    DioHelper?.getDataAPI(
      url: Login,
      query: {
        'email':  email,
        'password': password,
        'name':name,
        'phone':phone,
      },
    ).then((value) {
       emit(ShopAppScuccessStates(PostLogin!));
      var get_login = ShopLoginModel.fromjson(value.data);
      print(get_login.data?.image.toString());
    }).catchError((error){
      emit(ShopAppErrorStates(error.toString()));
    });

  }
  // Auth data from API
  void postLogin({required String email , required String password })  {
    emit(ShopAppLoadingStates());
    DioHelper?.postDataAPI(
      url: Login,
      data: {
        'email': email,
        'password': password,
      },
    ).then((value){
      emit(ShopAppScuccessStates(ShopLoginModel.fromjson(value.data)));
      PostLogin = ShopLoginModel.fromjson(value.data);
      print(PostLogin?.message);
    }).catchError((error){
      emit(ShopAppErrorStates(error.toString()));
      print(error.toString());
    });

  }

  //To change Password Visiability
  void changPasswordVisiability( ){
    password = !password;
    suffix = password ?  Icons.visibility_outlined : Icons.visibility_off_outlined   ;
    emit(ShopChangPasswordVisabilityStates());


  }
}


