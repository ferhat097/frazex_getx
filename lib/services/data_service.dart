import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:frazex_getx/models/image_model.dart';
import 'package:frazex_getx/services/config.dart';

class DataService {
  Future getInfo(String text) async {
    String baseUrl = Config.baseUrl;
    String key = Config.apiKey;
    String url = baseUrl + "search?query=$text";

    Dio dio = Dio();
    dio.options.headers["Authorization"] = "Bearer $key";
    var result = await dio.get(url);

    if (result.statusCode == 200) {
      var body = result.data;

      List photos = body["photos"] as List;
      return photos.map((json) => ImageModel.fromJson(json)).toList();
    } else {
      print("error ${result.statusMessage}");
      return false;
    }
  }
}
