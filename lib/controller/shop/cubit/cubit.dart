import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iiii/constant.dart';
import 'package:iiii/controller/service/dio_hellper.dart';
import 'package:iiii/controller/shop/cubit/states.dart';
import 'package:iiii/model/end_point.dart';
import 'package:iiii/model/home_model/home_model.dart';
import 'package:iiii/view/screen/cat_screen.dart';
import 'package:iiii/view/screen/fav_screen.dart';
import 'package:iiii/view/screen/product_screen.dart';
import 'package:iiii/view/screen/setting_screen.dart';

class ShopCubit extends Cubit<ShopStates>
{
  ShopCubit() : super (ShopIntialState());
  static ShopCubit get(context) => BlocProvider.of(context);


  int currentIndex = 0 ;
  List <Widget> bottomScreen = [
    ProductScreen(),
    CatScreen(),
    FavScreen(),
    SettingScreen()
  ];
  void changBottom (int index)
  {
    currentIndex=index;
    emit(BottomNavigationBarstate());
  }
  
   HomeModel? homeModel;
  void getHomeData(){
    emit(ShopLoadingHomeDataStates());

    DioHelper.getDataAPI(url: HOME, token: token).then((value) {


      homeModel = HomeModel.fromjson(value.data);
      print (homeModel);

      emit(ShopSuccessHomeDataStates());
    });

  }






}

