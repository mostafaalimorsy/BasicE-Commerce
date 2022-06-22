import 'package:iiii/model/auth/login_model.dart';
import 'package:iiii/model/favorites/add_fav_model.dart';

abstract class ShopStates {}


class ShopIntialState extends ShopStates {}
class BottomNavigationBarstate extends ShopStates{}


class ShopLoadingHomeDataStates extends ShopStates{}
class ShopSuccessHomeDataStates extends ShopStates{}
class ShopErrorHomeDataStates extends ShopStates{
  final String error;
  ShopErrorHomeDataStates(this.error);

}



class ShopLoadingCategoriesDataStates extends ShopStates{}
class ShopSuccessCategoriesDataStates extends ShopStates{}
class ShopErrorCategoriesDataStates extends ShopStates{
  final String error;
  ShopErrorCategoriesDataStates(this.error);

}


class ShopLoadingFavDataStates extends ShopStates{}
class ShopSuccessFavDataStates extends ShopStates{}
class ShopErrorFavDataStates extends ShopStates{
  final String error;
  ShopErrorFavDataStates(this.error);

}



class ShopLoadingChangeFavDataStates extends ShopStates{}
class ShopSuccessChangeFavDataStates extends ShopStates{
  final FavModel model;

  ShopSuccessChangeFavDataStates(this.model);
}
class ShopErrorChangeFavDataStates extends ShopStates{
  final String error;
  ShopErrorChangeFavDataStates(this.error);

}


class ShopUserDataStates extends ShopStates{}
class ShopSuccessUserDataStates extends ShopStates{
  final ShopLoginModel model;

  ShopSuccessUserDataStates(this.model);
}
class ShopErrorUserDataStates extends ShopStates{
  final String error;
  ShopErrorUserDataStates(this.error);

}


class ShopUpdateUserDataLoadingStates extends ShopStates{}
class ShopSuccessUpdateUserDataStates extends ShopStates{
  final ShopLoginModel model;

  ShopSuccessUpdateUserDataStates(this.model);
}
class ShopErrorUpdateUserDataStates extends ShopStates{
  final String error;
  ShopErrorUpdateUserDataStates(this.error);

}




