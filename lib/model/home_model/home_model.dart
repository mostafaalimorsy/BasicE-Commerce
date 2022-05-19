class HomeModel
{
  bool? status;
  HomeDataModel? data;

  HomeModel.fromjson(Map<String,dynamic> json)
  {
    status = json['status'];
    data = HomeDataModel.fromjson(json['data']);


  }
}


class HomeDataModel
{
  List<BannerModel>? banners = [];
  List<BannerModel>? product= [];


  HomeDataModel.fromjson(Map<String,dynamic> json)
  {
    banners= json['banners'];
    product = json['product'];
  }
}


class BannerModel
{
  int? id;
  String? image;
  BannerModel.fromjson(Map<String,dynamic> json)
  {
    id = json['id'];
    image = json['image'];


  }
}

class ProductModel
{
  int? id;
  dynamic price;
  dynamic oldPrice;
  dynamic discount;
  String? image;
  String? name;
  bool? in_fav;
  bool? in_cart;

  ProductModel.fromjson(Map<String,dynamic> json)
  {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    in_fav = json['in_favorites'];
    in_cart = json['in_cart'];


  }
}