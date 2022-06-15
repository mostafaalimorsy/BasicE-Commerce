import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iiii/controller/shop/cubit/cubit.dart';
import 'package:iiii/controller/shop/cubit/states.dart';
import 'package:iiii/view/widget/categories/cat_widget.dart';

class CatScreen extends StatelessWidget {
  const CatScreen({Key? key}) : super(key: key);
//1234
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (BuildContext context, ShopStates) {},
      builder: (BuildContext context, ShopStates state) {
        ShopCubit getData = ShopCubit.get(context);
        return ConditionalBuilder(
            condition: getData.catModel != null,
            builder: (context) => ListView.separated(
                itemBuilder: (context, index) => gridViewWidget(getData.catModel, index),
                separatorBuilder: (context, index) => Divider(),
                itemCount: getData.catModel!.data.data.length),
            fallback: (context) => Center(
                  child: CircularProgressIndicator(),
                ));
      },
    );
  }
}
