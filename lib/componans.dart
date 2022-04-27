import 'package:flutter/material.dart';


  void navigatTo(context , widget) => Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => widget),
  );

void navigatReplace (context , widget) => Navigator.pushAndRemoveUntil(context,
    MaterialPageRoute(builder: (context) => widget), (route) => false);
