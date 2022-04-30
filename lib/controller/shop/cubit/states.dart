abstract class ShopStates {}


class ShopIntialState extends ShopStates {}
class BottomNavigationBarstate extends ShopStates{}


class ShopLoadingHomeDataStates extends ShopStates{}
class ShopSuccessHomeDataStates extends ShopStates{}
class ShopErrorHomeDataStates extends ShopStates{
  final String error;
  ShopErrorHomeDataStates(this.error);

}


