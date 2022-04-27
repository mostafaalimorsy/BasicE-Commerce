import 'package:flutter/material.dart';
import 'package:iiii/view/widget/login_widget.dart';

class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(child: SingleChildScrollView(child: loginWidget(context))),
    );
  }
}
