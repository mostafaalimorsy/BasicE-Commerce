abstract class ShopAppLoginStates {}



class IntialShopAppLoginStates extends ShopAppLoginStates {}
class IntialShopAppLoadingStates extends ShopAppLoginStates {}
class IntialShopAppScuccessStates extends ShopAppLoginStates {}
class IntialShopAppErrorStates extends ShopAppLoginStates {
  final String error ;
  IntialShopAppErrorStates(this.error);
}