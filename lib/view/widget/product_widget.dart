import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:iiii/model/home_model/home_model.dart';

Widget productsBuilderWidget(HomeModel? model) => Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CarouselSlider(
            items: model!.data.banners
                .map(
                  (e) => Image.network("${e.image}"),
                )
                .toList(),
            options: CarouselOptions(
              viewportFraction: 1.0,
              height: 250.0,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(seconds: 1),
              autoPlayCurve: Curves.fastOutSlowIn,
              scrollDirection: Axis.horizontal,
            )),
        SizedBox(height: 20,),
        Expanded(
          child: GridView.count(crossAxisCount: 2,
          children: List.generate(model.data.banners.length, (index) => Image.network("${model.data.banners[index].image}")),
          ),
        )
      ],
    );
