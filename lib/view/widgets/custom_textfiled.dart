import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomTextField extends StatefulWidget {
  String hintext;
  bool isemail;
  TextEditingController controllers;
  final AutovalidateMode autovalidateMode;
  TextInputAction textInputAction;

  CustomTextField(
      {Key? key,
      required this.hintext,
      required this.controllers,
      required this.isemail,
      required this.textInputAction,
      required this.autovalidateMode})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        validator: (value) {
          if (widget.isemail == false) {
            if (value!.isEmpty) {
              return 'Please enter full name';
            }
          } else if (widget.isemail == true) {
            bool emailValid = RegExp(
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                .hasMatch(value!);
            if (value == null || value.isEmpty) {
              return 'Please enter email address';
            } else if (!emailValid) {
              return "Enter correct email address";
            }
            return null;
          }
        },
        textInputAction: widget.textInputAction,
        controller: widget.controllers,
        autovalidateMode: widget.autovalidateMode,
        decoration: InputDecoration(
          hintText: widget.hintext,
          hintStyle: TextStyle(color: Colors.grey.shade500),
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Colors.red.shade200,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Colors.grey.shade400,
            ),
          ),
          errorBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(
                width: 1,
                color: Colors.red.shade200,
              )),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(
                width: 1,
                color: Colors.red.shade200,
              )),
        ));
  }
}
