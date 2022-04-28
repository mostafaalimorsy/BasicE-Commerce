import 'package:dio/dio.dart';

class  DioHelper
{

  static Dio? dio;

  static init() {
    dio = Dio(
        BaseOptions(
          baseUrl: 'https://student.valuxapps.com/api/',
          receiveDataWhenStatusError: true,
          headers: {
            'Content-Type':'application/json',
            'lang':'en',
          }
        )
    );

  }

  static Future <Response> getDataAPI({
    required String url,
    required Map <String , dynamic>? query,
    String lang ="ar",
    String? auth ,
  }) async {
    dio!.options.headers =
    {
      'Content-Type':'application/json',
      'lang':lang,
      'Authorization':auth ,
    };

    return await dio!.get(url, queryParameters: query);

  }


  static Future <Response> postDataAPI({
    required String url,
    required Map <String , dynamic> data,
    Map <String , dynamic>? query,
    String lang ="ar",
    String? auth ,

  }) async {
    dio!.options.headers =
         {
          'Content-Type':'application/json',
          'lang':lang,
          'Authorization':auth ,
        };


    return await dio!.post(url, queryParameters: query,data: data);

  }



}