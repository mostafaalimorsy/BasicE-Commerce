import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iiii/controller/service/bloc_observe.dart';
import 'package:iiii/controller/service/dio_hellper.dart';
import 'package:iiii/controller/shop/cubit/cubit.dart';
import 'package:iiii/controller/shop/cubit/states.dart';
import 'package:iiii/theme.dart';
import 'package:iiii/view/screen/home_screen.dart';
import 'package:iiii/view/screen/login_screen.dart';
import 'package:iiii/view/screen/on_boarding_screen.dart';
import 'controller/service/cash_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CachHelper.init();

  Widget widget;
  bool? isSkiped = CachHelper.getData(key: 'onBoarding');
  bool? token = CachHelper.getData(key: 'token');
  print(isSkiped);

  if (isSkiped != null) {
    if(token != null) {
      widget = const HomeScreen();
      print (token);
    } else {
      widget = LoginScreen();
    }
  }else{
    widget = OnBoardingScreen();
  }

  BlocOverrides.runZoned(
    () {
      runApp(MyApp(widget: widget));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
   Widget? widget;

  MyApp(
     {
    Key? key,  this.widget,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> ShopCubit()..getHomeData(),
      child: BlocConsumer <ShopCubit ,ShopStates> (
        listener: (BuildContext context, ShopStates state) {  },
        builder: (BuildContext context, ShopStates state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Shop App',
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: ThemeMode.light,
            home: widget,
          );
        },

      ),
    );
  }
}
