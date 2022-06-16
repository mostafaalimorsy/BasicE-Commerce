import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iiii/controller/shop/cubit/cubit.dart';
import 'package:iiii/controller/shop/cubit/states.dart';
import 'package:iiii/view/widget/favourates/fav_widget.dart';

class FavScreen extends StatelessWidget {
  const FavScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit , ShopStates>(
        listener: (BuildContext context, ShopStates) {},
        builder: (BuildContext context, ShopStates state) {
          ShopCubit getData = ShopCubit.get(context);
          return  ConditionalBuilder(
              condition: getData.favoritesModel!= null,
              builder: (context) => ListView.separated(
                  physics:const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => BuildFavItem(getData.favoritesModel,index,context),
                  separatorBuilder:  (context, index) => Container(height: 1,width: double.infinity,),
                  itemCount: ShopCubit.get(context).favoritesModel!.data!.data2.length),
              fallback: (context) => Center(
                child: CircularProgressIndicator(),
              ));
        });
  }
}
