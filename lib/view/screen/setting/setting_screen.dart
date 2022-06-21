
import 'package:flutter/material.dart';


import '../../widget/setting_widget_update_user_data/user_data.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UserData(context);
  }
}


