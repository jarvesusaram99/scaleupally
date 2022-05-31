import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scaleupally/utility/colors_data.dart';

List<String> imagesList = [
  "assets/images/michael-demoya-MUdB4YzDeKA-unsplash@2x.png",
  "assets/images/adam-winger-3nBzt3Jdeh4-unsplash@2x.png",
];
Widget RatedCard() {
  return Container(
      height: 225,
      child: ListView.builder(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: 2,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
                padding: EdgeInsets.only(right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        height: 220,
                        width: 250,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            // color: Colors.amber,
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(imagesList[index]),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              "Salon Name",
                              style: TextStyle(
                                  color: colorBlack,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              "Near location name",
                              style: TextStyle(
                                color: Colors.black26,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(2, 0, 0, 0),
                                      child: SvgPicture.asset(
                                        "assets/svg/Icon ionic-ios-star.svg",
                                        color: Color.fromRGBO(242, 154, 78, 1),
                                        height: 11,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(2, 0, 0, 0),
                                      child: SvgPicture.asset(
                                        "assets/svg/Icon ionic-ios-star.svg",
                                        color: Color.fromRGBO(242, 154, 78, 1),
                                        height: 11,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(2, 0, 0, 0),
                                      child: SvgPicture.asset(
                                        "assets/svg/Icon ionic-ios-star.svg",
                                        color: Color.fromRGBO(242, 154, 78, 1),
                                        height: 11,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(2, 0, 0, 0),
                                      child: SvgPicture.asset(
                                        "assets/svg/Icon ionic-ios-star.svg",
                                        color: Color.fromRGBO(242, 154, 78, 1),
                                        height: 11,
                                      ),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Row(
                                  children: const [
                                    Icon(
                                      Icons.location_on_outlined,
                                      size: 15,
                                      color: Colors.black26,
                                    ),
                                    Text(
                                      "2 Mile",
                                      style: TextStyle(
                                        color: Colors.black26,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ))
                  ],
                ));
          }));
}
