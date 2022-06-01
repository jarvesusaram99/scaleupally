import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:scaleupally/controller/home_controller.dart';

class ServicesCard extends StatefulWidget {
  const ServicesCard({Key? key}) : super(key: key);

  @override
  State<ServicesCard> createState() => _ServicesCardState();
}

class _ServicesCardState extends State<ServicesCard> {
  @override
  void initState() {
    // TODO: implement initState
    homeController.fetchCategory();
    super.initState();
  }

  HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      child: FutureBuilder(
          future: homeController.fetchCategory(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
                height: 20,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              return ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: homeController.categorylist.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                height: 120,
                                width: 120,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Color(homeController
                                          .categorylist[index]
                                          .bgcolor
                                          .hashCode),
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 70,
                                        width: 48,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.network(
                                            homeController
                                                .categorylist[index].icon,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        homeController
                                            .categorylist[index].name.en
                                            .toString(),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                )),
                          )
                        ]);
                  });
            }
          }),
    );
  }
}
