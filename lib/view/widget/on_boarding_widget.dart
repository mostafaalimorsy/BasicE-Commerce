import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iiii/model/boarding_model.dart';

Widget onBoarding (BoardingModel model) {

  return Center(
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // image
      Expanded(child: Image(image:AssetImage('${model.image}') )),
      //title of boarding
      Text(
        "${model.title}",
        style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold
        ),
      ),
      SizedBox(height: 15),
      //body of boarding
      Text(
        "${model.body}",
        style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.grey
        ),
      ),
    ],
),
  );
}
