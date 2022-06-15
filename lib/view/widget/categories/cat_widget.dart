import 'package:flutter/material.dart';
import 'package:iiii/model/categories/categories_model.dart';


Widget gridViewWidget(CategoriesModel? model,index) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Image.network("${model!.data.data[index].image}",fit: BoxFit.cover,width: 80,height: 80,),
        SizedBox(width: 20,),
        Text("${model.data.data[index].name}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        Spacer(),
        IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios)),
      ],
    ),
  );
}
