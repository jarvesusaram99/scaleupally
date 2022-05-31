import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget Servicescard() {
  return Container(
    height: 105,
    child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.only(right: 10),
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  offset: Offset(1, 1),
                  blurRadius: 2,
                  color: Color.fromRGBO(0, 0, 0, 0.09),
                )
              ], color: Colors.amber, borderRadius: BorderRadius.circular(8)),
              // child:  ,
            ),
          );
        }),
  );
}
