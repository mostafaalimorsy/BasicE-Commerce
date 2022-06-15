import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:iiii/model/categories/categories_model.dart';
import 'package:iiii/model/home_model/home_model.dart';
import 'package:iiii/view/widget/home/gride_view_widget.dart';
import 'package:iiii/view/widget/home/item_builder_widget.dart';

Widget productsBuilderWidget(HomeModel? model, CategoriesModel? CatModel) => SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Categories",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
                ),
                Container(
                  height: 100,
                  child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => ItemBuilderWidget(CatModel,index),
                      separatorBuilder: (context, index) => SizedBox(
                            width: 10,
                          ),
                      itemCount: CatModel!.data.data.length),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "New Product",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.grey[300],
            child: GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              childAspectRatio: 1 / 1.58,
              physics: NeverScrollableScrollPhysics(),
              children: List.generate(model.data.product.length,
                  (index) => gridViewWidget(model, index)),
            ),
          )
        ],
      ),
    );
