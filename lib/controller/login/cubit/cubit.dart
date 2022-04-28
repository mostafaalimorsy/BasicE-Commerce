import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iiii/controller/login/cubit/states.dart';
import 'package:iiii/controller/login/service/dio_hellper.dart';
import 'package:iiii/model/end_point.dart';

class ShopLoginCubit extends Cubit<ShopAppLoginStates> {
  ShopLoginCubit() : super(IntialShopAppLoginStates ());

  static ShopLoginCubit get(context) => BlocProvider.of(context);

  List<dynamic> get_login = [];
  List<dynamic> post_login = [];

  void getLogin({required String? email, required String? password}) async {
    emit(ShopAppLoadingStates());

    DioHelper?.getDataAPI(
      url: Login,
      query: {
        'email': email,
        'password': password,
      },
    ).then((value) => get_login = value.data);

    print("testtttttttt1");
    print(post_login);
    emit(ShopAppScuccessStates());
    print("testtttttttt2");
    print(post_login);
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
      print("testtttttttt1");
      print(value.data);
      emit(ShopAppScuccessStates());

    }).catchError((error){
      print(error);


      emit(ShopAppErrorStates(error.toString()));
    });

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