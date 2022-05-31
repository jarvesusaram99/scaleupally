import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class PasswordTextField extends StatefulWidget {
  String hintext;
  // final ValueChanged<String> onChanged;
  // final TextEditingController controller;

  PasswordTextField({
    Key? key,
    required this.hintext,
    // required this.controller,
    // required this.onChanged
  }) : super(key: key);

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool isObsecure = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        keyboardType: TextInputType.visiblePassword,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          bool isUpperCase = RegExp("(?=.*[A-Z])").hasMatch(value!);
          bool isSpecialCharacter =
              RegExp("(?=.*[!@#\$%^&*(),.?:{}|<>].*)").hasMatch(value);

          if (value!.isEmpty) {
            return 'Please enter password';
          } else if (value.length <= 7) {
            return "Password must be at least 8 character ";
          } else if (!isUpperCase) {
            return "Password must  1 uppercase letter ";
          } else if (!isSpecialCharacter) {
            return "Password must  1 sp``ecial character letter ";
          }
          return null;
        },
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(
              isObsecure ? Icons.visibility : Icons.visibility_off,
            ),

            onPressed: () {
              setState(() {
                isObsecure = !isObsecure;
              });
            },
            // Icons.visibility,
          ),
          hintText: widget.hintext,
          hintStyle: TextStyle(color: Colors.grey.shade500),
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Colors.red.shade200,
            ),
          ),
          // border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Colors.grey.shade400,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(
              width: 1,
            ),
          ),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(
                width: 1,
                color: Colors.red.shade200,
              )),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(
                width: 1,
                color: Colors.red.shade200,
              )),
        ));
  }
}
