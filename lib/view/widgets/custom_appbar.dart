import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scaleupally/utility/colors_data.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  // final Widget child;
  final double height;

  CustomAppBar({
    // required this.child,
    this.height = kToolbarHeight,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color(0xffE45171),
          Color(0xffA861BD),
          Color(0xff1A3263),
        ])),
        // color: Colors.red,
        child: Container(
          child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/svg/appbar.svg",
                        color: Colors.white,
                        height: 11.27,
                        width: 36.1,
                      ),
                      Spacer(),
                      Icon(
                        Icons.notifications,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                      "Pikashi Jain",
                      style: TextStyle(color: colorPrimaryLight, fontSize: 14),
                    )),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15, right: 20),
                  child: Container(
                    // color: Colors.red,
                    child: Row(
                      children: const [
                        Icon(
                          Icons.location_on_outlined,
                          color: colorPrimaryLight,
                          size: 20,
                        ),
                        Text(
                          "Time Square Plaza, New York",
                          style:
                              TextStyle(color: colorPrimaryLight, fontSize: 12),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: colorPrimaryLight,
                          size: 20,
                        )
                      ],
                    ),
                  ),
                )
              ]),
        ));
  }
}
