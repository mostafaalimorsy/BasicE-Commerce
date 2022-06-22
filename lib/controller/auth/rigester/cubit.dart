import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iiii/controller/auth/rigester/states.dart';
import 'package:iiii/controller/service/dio_hellper.dart';
import 'package:iiii/model/auth/login_model.dart';
import 'package:iiii/model/end_point.dart';

class ShopRigesterCubit extends Cubit<ShopAppRigesterStates> {
  ShopRigesterCubit() : super(IntialShopAppRigesterStates ());

  static ShopRigesterCubit get(context) => BlocProvider.of(context);

  ShopLoginModel? GetLogin ;
  IconData suffix = Icons.visibility_outlined ;
  bool password = true;


  //// Auth data TO API
  void getLogin({required String? email, required String? password,required String? name, required String? phone}) async {
    emit(ShopAppLoadingRigesterStates());
    DioHelper?.postDataAPI(
      url: REGISTER,
      data: {
        'email':  email,
        'password': password,
        'name':name,
        'phone':phone,
      },
    ).then((value) {
      print("2");
      GetLogin= ShopLoginModel.fromjson(value.data);
      print("3");
      emit(ShopAppScuccessRigesterStates(GetLogin!));
      print(GetLogin!.data!.token);
      print("4");
    });

  }


  //To change Password Visiability
  void changPasswordVisiability( ){
    password = !password;
    suffix = password ?  Icons.visibility_outlined : Icons.visibility_off_outlined   ;
    emit(ShopChangPasswordVisabilityRigesterStates());


  }



}