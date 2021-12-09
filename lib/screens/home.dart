import 'package:flutter/material.dart';
import 'package:frazex_getx/controllers/home_controller.dart';
import 'package:frazex_getx/models/image_model.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: NestedScrollView(
        headerSliverBuilder: (context, isSliver) {
          return [
            SliverAppBar(
              backgroundColor: Colors.white,
              actions: [],
              centerTitle: true,
              titleSpacing: 0,
              //toolbarHeight: 0,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              )),
              snap: true,
              floating: true,
              title: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: IntrinsicHeight(
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey[200],
                          ),
                          child: TextField(
                            controller: homeController.searchQueryController,
                            textInputAction: TextInputAction.search,
                            textAlign: TextAlign.start,
                            textAlignVertical: TextAlignVertical.center,
                            style: GoogleFonts.encodeSans(
                              color: Colors.black,
                            ),
                            onSubmitted: (_) {
                              homeController.getData();
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "findphoto".tr, //"Şəkil axtar",
                              hintStyle: GoogleFonts.encodeSans(
                                color: Colors.black54,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 5,
                              ),
                              prefixIcon: const Icon(Icons.search),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  homeController.clearText();
                                },
                                child: const Icon(Icons.close),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          color: Colors.grey[900],
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Material(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(100),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(100),
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              homeController.getData();
                            },
                            child: const Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ];
        },
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: GetBuilder<HomeController>(
            id: "getphotos",
            builder: (controller) {
              if (controller.status == 2) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (controller.status == 0) {
                return Center(
                  child: Text("forfindwrite".tr),
                );
              } else if (controller.status == -1) {
                return Center(
                  child: Text("error".tr),
                );
              } else if (controller.status == -2) {
                return Center(
                  child: Text("textempty".tr),
                );
              } else if (controller.status == -3) {
                return Center(
                  child: Text("noresult".tr),
                );
              } else {
                return successState(controller.photos);
              }
            },
          ),
        ),
      ),
    );
  }

  Widget successState(List<ImageModel> photos) {
    return RefreshIndicator(
      onRefresh: () async {
        await homeController.getData();
      },
      child: GridView.builder(
        itemCount: photos.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 2,
          crossAxisSpacing: 2,
        ),
        itemBuilder: (context, index) {
          return Image.network(
            photos[index].imageUrl,
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }
}
