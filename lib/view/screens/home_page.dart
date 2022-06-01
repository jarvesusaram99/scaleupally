import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scaleupally/utility/colors_data.dart';
import 'package:scaleupally/view/widgets/custom_appbar.dart';
import 'package:scaleupally/view/widgets/custom_navbar.dart';
import 'package:scaleupally/view/widgets/rated_card.dart';
import 'package:scaleupally/view/widgets/services_card.dart';
import 'package:scaleupally/view/widgets/submit_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Navigation(),
        appBar: CustomAppBar(
          height: 103,
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Text(
                      "Hightest Rated",
                      style: TextStyle(
                          color: colorPrimary,
                          fontSize: 22,
                          fontWeight: FontWeight.w500),
                    ),
                    Spacer(),
                    Text(
                      "View All",
                      style: TextStyle(color: colorPrimary),
                    )
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                RatedCard(),
                const SizedBox(
                  height: 13,
                ),
                Row(
                  children: const [
                    Text(
                      "Services",
                      style: TextStyle(
                          color: colorPrimary,
                          fontSize: 22,
                          fontWeight: FontWeight.w500),
                    ),
                    Spacer(),
                    Text(
                      "View All",
                      style: TextStyle(color: colorPrimary),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                ServicesCard(),
                const SizedBox(
                  height: 24,
                ),
                const Divider(
                  thickness: 1.2,
                ),
                const SizedBox(
                  height: 24,
                ),
                const SubmitWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
