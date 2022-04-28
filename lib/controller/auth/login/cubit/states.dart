abstract class ShopAppLoginStates {}



class IntialShopAppLoginStates extends ShopAppLoginStates {}
class ShopAppLoadingStates extends ShopAppLoginStates {}
class ShopAppScuccessStates extends ShopAppLoginStates {}
class ShopAppErrorStates extends ShopAppLoginStates {
  final String error ;
  ShopAppErrorStates(this.error);

}

class ShopChangPasswordVisabilityStates extends ShopAppLoginStates {}

