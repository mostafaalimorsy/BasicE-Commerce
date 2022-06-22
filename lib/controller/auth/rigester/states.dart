
import 'package:iiii/model/auth/login_model.dart';

abstract class ShopAppRigesterStates {}

class IntialShopAppRigesterStates extends ShopAppRigesterStates {}
class ShopAppLoadingRigesterStates extends ShopAppRigesterStates {}
class ShopAppScuccessRigesterStates extends ShopAppRigesterStates {
  final ShopLoginModel getLogin;
  ShopAppScuccessRigesterStates(this.getLogin);
}
class ShopAppErrorRigesterStates extends ShopAppRigesterStates {
  final String error ;
  ShopAppErrorRigesterStates(this.error);


}

class ShopChangPasswordVisabilityRigesterStates extends ShopAppRigesterStates {}
