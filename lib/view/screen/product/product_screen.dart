import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iiii/controller/shop/cubit/cubit.dart';
import 'package:iiii/controller/shop/cubit/states.dart';
import 'package:iiii/view/widget/home/product_widget.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit , ShopStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, ShopStates state) {
        ShopCubit getData = ShopCubit.get(context);

        return ConditionalBuilder(
            condition:  getData.homeModel !=null && getData.catModel !=null,
            builder: (context)=> productsBuilderWidget(getData.homeModel, getData.catModel),
            fallback: (context)=> Center(child:CircularProgressIndicator() ,)

        );
      },
    );
  }
}
