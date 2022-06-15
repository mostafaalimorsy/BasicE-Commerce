import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iiii/controller/service/constant.dart';
import 'package:iiii/controller/shop/cubit/cubit.dart';
import 'package:iiii/controller/shop/cubit/states.dart';
import 'package:iiii/model/home_model/home_model.dart';

Widget gridViewWidget(HomeModel? model, index ) {
  return BlocConsumer<ShopCubit , ShopStates>(
    listener: (BuildContext context, state) {},
    builder: (BuildContext context, ShopStates state) {
       int? id =model!.data.product[index].id ;
      ShopCubit getData = ShopCubit.get(context);
      return Container(
        color: Colors.white,
        child: Column(
          children: [
            // image of products
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Image.network(
                  "${model.data.product[index].image}",
                  width: double.infinity,
                  height: 200,
                ),
                if (model.data.product[index].discount != 0)
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    color: Colors.red,
                    child: Text(
                      'DISCOUNT',
                      style: TextStyle(
                        fontSize: 8,
                        color: Colors.white,
                      ),
                    ),
                  ),
              ],
            ),
            //name and price ,old price of products
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //name of product
                  Text(
                    "${model.data.product[index].name}",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      height: 1.3,
                    ),
                  ),
                  //price of product
                  Row(
                    children: [
                      // price of products
                      Text(
                        "${model.data.product[index].price.round()}",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: defaultColor,
                          fontSize: 12,
                          height: 1.3,
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      // old price od products
                      if (model.data.product[index].discount != 0)
                        Text(
                          "${model.data.product[index].oldPrice.round()}",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            height: 1.3,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      Spacer(),
                      CircleAvatar(
                        backgroundColor: getData.fav[model.data.product[index].id] == true? Colors.red : defaultColor,
                        child: IconButton(
                          onPressed: () {
                            getData.ChangeFavIcon(id!);
                          },
                          icon: Icon(
                            Icons.favorite_border,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },

  );
}
