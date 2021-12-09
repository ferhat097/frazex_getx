import 'package:flutter/material.dart';
import 'package:frazex_getx/controllers/main_controller.dart';
import 'package:get/get.dart';

import 'explore.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
        id: "page",
        init: MainController(),
        builder: (controller) {
          return Scaffold(
            bottomNavigationBar: BottomNavigationBar(
                onTap: (page) {
                  controller.changePage(page);
                },
                currentIndex: controller.page,
                items: [
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.photo),
                    label: "findpage".tr,
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.search),
                    label: "explorepage".tr,
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.person),
                    label: "profilepage".tr,
                  )
                ]),
            body: IndexedStack(
              index: controller.page,
              children: controller.pages,
            ),
          );
        });
  }
}
