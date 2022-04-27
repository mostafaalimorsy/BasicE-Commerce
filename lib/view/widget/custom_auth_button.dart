import 'package:flutter/material.dart';
import 'package:iiii/constant.dart';

Widget authButton ({context, authButtonText})=>  Container(
    width: MediaQuery.of(context).size.height,
    color: defaultColor,
    child: TextButton(
      onPressed: () {
        //type here
      },
      child: Text("${authButtonText}",style: TextStyle(color: Colors.white),),
    ));