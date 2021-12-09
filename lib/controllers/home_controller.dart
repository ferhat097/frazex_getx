import 'package:flutter/widgets.dart';
import 'package:frazex_getx/models/image_model.dart';
import 'package:frazex_getx/services/data_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  TextEditingController searchQueryController = TextEditingController();
  List<ImageModel> photos = [];
  int status = 0;
  Future getData() async {
    status = 2;
    update(["getphotos"]);
    if (searchQueryController.text.isEmpty) {
      status = -2;
      update(["getphotos"]);
    } else {
      DataService dataService = DataService();
      try {
        photos = await dataService.getInfo(searchQueryController.text);
        status = 1;
        if (photos.isEmpty) {
          status = -3;
        } else {
          status = 1;
        }
        update(["getphotos"]);
      } catch (e) {
        status = -1;
        update(["getphotos"]);
      }
    }
  }

  void clearText() {
    searchQueryController.clear();
  }
}
