import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:iiii/model/home_model/home_model.dart';

Widget productsBuilderWidget(HomeModel? model) => Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        CarouselSlider(
            items: [
              Image.asset( 'assets/img/167531.png',),
            ],
            options: CarouselOptions(
              height: 250.0,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(seconds: 1),
              autoPlayCurve: Curves.fastOutSlowIn,
              scrollDirection: Axis.horizontal,
            ))],

    );
