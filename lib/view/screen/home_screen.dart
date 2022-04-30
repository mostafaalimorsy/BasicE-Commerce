import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iiii/componans.dart';
import 'package:iiii/controller/shop/cubit/states.dart';
import 'package:iiii/view/screen/search_screen.dart';
import '../../controller/shop/cubit/cubit.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
      listener: (BuildContext context, ShopStates state) {  },
      builder: (BuildContext context, ShopStates state) {
        ShopCubit getData = ShopCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('Cart'),
            actions: [
              IconButton(onPressed: (){
                navigatTo(context, SearchScreen());
              }, icon: Icon(Icons.search))
            ],
          ),
          body:getData.bottomScreen[getData.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index)
            {
              getData.changBottom(index);
            },
            currentIndex: getData.currentIndex,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.category_outlined),label: 'Category'),
              BottomNavigationBarItem(icon: Icon(Icons.favorite_border),label: 'favorite'),
              BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'settings'),
            ],
          ),

        );
      },

    );


  }
}
