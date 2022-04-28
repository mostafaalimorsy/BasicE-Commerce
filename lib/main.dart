import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iiii/constant.dart';
import 'package:iiii/controller/login/cubit/cubit.dart';
import 'package:iiii/view/screen/on_boarding_screen.dart';


void main() {
  BlocOverrides.runZoned(() {
    runApp(MyApp());
  },
    blocObserver: MyBlocObserver(),

  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shop App',
      theme: ThemeData(
        fontFamily: "general_font",
        primarySwatch: defaultColor,
      ),
      darkTheme: ThemeData(
        primarySwatch: defaultColor,
        fontFamily: "general_fontC",
      ),
      home: OnBoardingScreen(),
    );

  }
}