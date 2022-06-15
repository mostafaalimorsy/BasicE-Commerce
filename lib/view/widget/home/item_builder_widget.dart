import 'package:flutter/material.dart';
import 'package:iiii/model/categories/categories_model.dart';

Widget ItemBuilderWidget (CategoriesModel? model,index)
{
  return Container(
    height: 100,
    width: 100,
    child: Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Image.network(
          "${model!.data.data[index].image}",
          height: 100,
          width: 100,
          fit: BoxFit.cover,
        ),
        Container(
          width: double.infinity,
          color: Colors.black.withOpacity(0.8),
          child: Text(
            "${model.data.data[index].name}",
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    ),
  );
}