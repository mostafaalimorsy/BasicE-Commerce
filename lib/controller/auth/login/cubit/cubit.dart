import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iiii/controller/auth/login/cubit/states.dart';
import 'package:iiii/controller/auth/login/service/dio_hellper.dart';

import 'package:iiii/model/end_point.dart';

class ShopLoginCubit extends Cubit<ShopAppLoginStates> {
  ShopLoginCubit() : super(IntialShopAppLoginStates ());

  static ShopLoginCubit get(context) => BlocProvider.of(context);

  List<dynamic> get_login = [];
  List<dynamic> post_login = [];
  IconData suffix = Icons.visibility_outlined ;
  bool password = true;

  void getLogin({required String? email, required String? password}) async {
    emit(ShopAppLoadingStates());
    DioHelper?.getDataAPI(
      url: Login,
      query: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      emit(ShopAppScuccessStates());
      get_login.add(value);
      print(get_login);
    }).catchError((error){
      emit(ShopAppErrorStates(error.toString()));
    });

  }

  void postLogin({required String email , required String password })  {
    emit(ShopAppLoadingStates());
    DioHelper?.postDataAPI(
      url: Login,
      data: {
        'email': email,
        'password': password,
      },
    ).then((value){
      emit(ShopAppScuccessStates());
      post_login.add(value);
      print(post_login);
    }).catchError((error){
      emit(ShopAppErrorStates(error.toString()));
    });

  }

  void changPasswordVisiability( ){
    password = !password;
    suffix = password ?  Icons.visibility_outlined : Icons.visibility_off_outlined   ;
    emit(ShopChangPasswordVisabilityStates());


  }
}



class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    print('onCreate -- ${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('onChange -- ${bloc.runtimeType}, $change');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('onError -- ${bloc.runtimeType}, $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    print('onClose -- ${bloc.runtimeType}');
  }
}