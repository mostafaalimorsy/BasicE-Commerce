
import 'package:flutter/material.dart';
import 'package:iiii/controller/service/componans.dart';
import 'package:iiii/controller/service/cash_helper.dart';
import 'package:iiii/view/screen/login/login_screen.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:    //sign out button
      TextButton(onPressed: () {
        CachHelper.clearData(key: 'token').then((value) => navigatReplace(context,LoginScreen()));
      },
        child: Text("sign out"),),
    );
  }
}
