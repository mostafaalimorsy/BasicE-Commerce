import 'package:iiii/model/auth/login_model.dart';

abstract class ShopAppLoginStates {}



class IntialShopAppLoginStates extends ShopAppLoginStates {}
class ShopAppLoadingStates extends ShopAppLoginStates {}
class ShopAppScuccessStates extends ShopAppLoginStates {
  final ShopLoginModel PostLogin;


  ShopAppScuccessStates(this.PostLogin);





}
class ShopAppErrorStates extends ShopAppLoginStates {
  final String error ;
  ShopAppErrorStates(this.error);


}

class ShopChangPasswordVisabilityStates extends ShopAppLoginStates {}



class ShopAppLoadingRigesterStates extends ShopAppLoginStates {}
class ShopAppScuccessRigesterStates extends ShopAppLoginStates {
  final ShopLoginModel getLogin;


  ShopAppScuccessRigesterStates(this.getLogin);





}
class ShopAppErrorRigesterStates extends ShopAppLoginStates {
  final String error ;
  ShopAppErrorRigesterStates(this.error);


}

class ShopChangPasswordVisabilityRigesterStates extends ShopAppLoginStates {}



