import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iiii/controller/login/cubit/states.dart';


class ShopLoginCubit extends Cubit <ShopAppLoginStates>
{
  ShopLoginCubit() : super(IntialShopAppLoginStates());
  static ShopLoginCubit get(context) =>BlocProvider.of(context);








}