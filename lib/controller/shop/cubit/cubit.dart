import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iiii/controller/service/constant.dart';
import 'package:iiii/controller/service/dio_hellper.dart';
import 'package:iiii/controller/shop/cubit/states.dart';
import 'package:iiii/model/auth/login_model.dart';
import 'package:iiii/model/categories/categories_model.dart';
import 'package:iiii/model/end_point.dart';
import 'package:iiii/model/favorites/add_fav_model.dart';
import 'package:iiii/model/favorites/fav_model.dart';
import 'package:iiii/model/home_model/home_model.dart';
import 'package:iiii/view/screen/categories/cat_screen.dart';
import 'package:iiii/view/screen/favoraites/fav_screen.dart';
import 'package:iiii/view/screen/product/product_screen.dart';
import 'package:iiii/view/screen/setting/setting_screen.dart';

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
  Map<int?,bool?> fav = {};
  void getHomeData(){
    emit(ShopLoadingHomeDataStates());

    DioHelper.getDataAPI(url: HOME, token: token).then((value) {


      homeModel = HomeModel.fromjson(value.data);
      homeModel!.data.product.forEach((element) {
        fav.addAll({
          element.id: element.in_fav
        });
      });

      print (fav.toString());

      emit(ShopSuccessHomeDataStates());
    });

  }


  CategoriesModel? catModel;
  void getCatData(){
    emit(ShopLoadingCategoriesDataStates());

    DioHelper.getDataAPI(url: GET_CATEGRIOES).then((value) {


      catModel = CategoriesModel.fromjson(value.data);
      print (catModel);

      emit(ShopSuccessCategoriesDataStates());
    });

  }

  FavModel? favModel;
  void ChangeFavIcon(int ProductId ){
    fav[ProductId] = !fav[ProductId]!;
    emit(ShopLoadingChangeFavDataStates());
    DioHelper.postDataAPI(
      url: Favorites,
      data: {
        'product_id':ProductId,
      },
      token: token,

    ).then((value) {
      favModel=FavModel.fromJson(value.data);
      print(value.data);
      if(!favModel!.status){
        fav[ProductId] = !fav[ProductId]!;
      }else{
        GetHomeFavorite();
      }
      emit(ShopSuccessChangeFavDataStates(favModel!));
    });
  }


  FavoritesModel? favoritesModel;
  void GetHomeFavorite(){
    emit(ShopLoadingFavDataStates ());

    DioHelper.getDataAPI(
        url: Favorites,
        token:  token
    ).then((value) {
      favoritesModel=FavoritesModel.Fromjson(value.data);
      print(favoritesModel!.data!.data2);

      emit(ShopSuccessFavDataStates());
    });
  }


  ShopLoginModel? UserModel;
  void GetUserData(){
    emit(ShopUserDataStates ());

    DioHelper.getDataAPI(
        url: PROFILE,
        token:  token
    ).then((value) {
      UserModel=ShopLoginModel.fromjson(value.data);
      print(UserModel!.data!.name);

      emit(ShopSuccessUserDataStates(UserModel!));
    });
  }





}

