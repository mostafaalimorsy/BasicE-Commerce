import 'package:flutter/material.dart';
import 'package:iiii/constant.dart';

Widget authButton ({ required BuildContext context,  authButtonText ,VoidCallback? onpressed})=>  Container(
    width: MediaQuery.of(context).size.height,
    color: defaultColor,
    child: TextButton(
      onPressed: onpressed,
      child: Text("${authButtonText}",style: TextStyle(color: Colors.white),),
    ));