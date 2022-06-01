// import 'package:flutter/material.dart';

// class PasswordTextField extends StatefulWidget {
//   String hintext;
//   TextEditingController passwordcontroller;
//   final AutovalidateMode autovalidateMode;
//   TextInputAction textInputAction;
//   Function validator;
//   PasswordTextField(
//       {Key? key,
//       required this.hintext,
//      required this.validator,
//       required this.textInputAction,
//       required this.passwordcontroller,
//       required this.autovalidateMode})
//       : super(key: key);

//   @override
//   State<PasswordTextField> createState() => _PasswordTextFieldState();
// }

// class _PasswordTextFieldState extends State<PasswordTextField> {
//   bool isObsecure = false;
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//         obscureText: isObsecure,
//         textInputAction: widget.textInputAction,
//         controller: widget.passwordcontroller,
//         keyboardType: TextInputType.visiblePassword,
//         autovalidateMode: widget.autovalidateMode,
//         validator: (value) {
//           bool isUpperCase = RegExp("(?=.*[A-Z])").hasMatch(value!);
//           bool isSpecialCharacter =
//               RegExp("(?=.*[!@#\$%^&*(),.?:{}|<>].*)").hasMatch(value);

//           if (widget.hintext == "Confirm Password") {
//             if (value.isEmpty) {
//               return 'Please enter password';
//             } else if (value != widget.passwordcontroller) {
//               return "Not Match";
//             } else {
//               return null;
//             }
//           } else {
//             if (value.isEmpty) {
//               return 'Please enter password';
//             } else if (value.length <= 7) {
//               return "Password must be at least 8 character ";
//             } else if (!isUpperCase) {
//               return "Password must  1 uppercase letter ";
//             } else if (!isSpecialCharacter) {
//               return "Password must  1 special character letter ";
//             }
//             return null;
//           }
//         },
//         decoration: InputDecoration(
//           suffixIcon: IconButton(
//             icon: Icon(
//               isObsecure ? Icons.visibility : Icons.visibility_off,
//             ),

//             onPressed: () {
//               setState(() {
//                 isObsecure = !isObsecure;
//               });
//             },
//             // Icons.visibility,
//           ),
//           hintText: widget.hintext,
//           hintStyle: TextStyle(color: Colors.grey.shade500),
//           fillColor: Colors.white,
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8),
//             borderSide: BorderSide(
//               color: Colors.red.shade200,
//             ),
//           ),
//           // border: InputBorder.none,
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8),
//             borderSide: BorderSide(
//               color: Colors.grey.shade400,
//             ),
//           ),
//           border: const OutlineInputBorder(
//             borderRadius: BorderRadius.all(Radius.circular(4)),
//             borderSide: BorderSide(
//               width: 1,
//             ),
//           ),
//           errorBorder: OutlineInputBorder(
//               borderRadius: const BorderRadius.all(Radius.circular(4)),
//               borderSide: BorderSide(
//                 width: 1,
//                 color: Colors.red.shade200,
//               )),
//           focusedErrorBorder: OutlineInputBorder(
//               borderRadius: const BorderRadius.all(Radius.circular(4)),
//               borderSide: BorderSide(
//                 width: 1,
//                 color: Colors.red.shade200,
//               )),
//         ));
//   }
// }
