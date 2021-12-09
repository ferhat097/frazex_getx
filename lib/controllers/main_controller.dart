import 'package:flutter/material.dart';
import 'package:frazex_getx/screens/explore.dart';
import 'package:frazex_getx/screens/home.dart';
import 'package:frazex_getx/screens/profile.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  int page = 0;
  List<Widget> pages = const [
    Home(),
    Explore(),
    Profile(),
  ];

  void changePage(selectedPage) {
    page = selectedPage;
    update(["page"]);
  }
}
