import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scaleupally/view/widgets/custom_textfiled.dart';
import 'package:scaleupally/view/widgets/password_textfiled.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:http/http.dart' as http;

import '../../controller/home_controller.dart';

class SubmitWidget extends StatefulWidget {
  const SubmitWidget({Key? key}) : super(key: key);

  @override
  State<SubmitWidget> createState() => _SubmitWidgetState();
}

class _SubmitWidgetState extends State<SubmitWidget> {
  HomeController homeController = Get.put(HomeController());
  AutovalidateMode _autoValidate = AutovalidateMode.disabled;
  List<String> items = [
    'male',
    'female',
  ];
  String? status;
  int? _radioSelected;
  String gender = "";
  DateTime? pickDate;
  String formatDate = '';
  final formkey = GlobalKey<FormState>();
  TextEditingController _datekey = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _passsowrd = TextEditingController();
  TextEditingController _confirmPass = TextEditingController();
  TextEditingController _gender = TextEditingController();
  TextEditingController _state = TextEditingController();
  bool isObsecure = false;
  File? _imageFile;
  final picker = ImagePicker();
  String downloadImageUrl = '';

  Future pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
        print(_imageFile);
        print("image selected");
      } else {
        print("No image selected");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 120,
                width: 120,
                child: DottedBorder(
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(5),
                    dashPattern: [5, 5],
                    color: Colors.grey,
                    strokeWidth: 2,
                    child: Center(
                      child: InkWell(
                        onTap: pickImage,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "assets/svg/Group 2848.svg",
                              height: 30,
                              width: 30,
                              color: Colors.grey.shade400,
                            ),
                            const Text("Upload")
                          ],
                        ),
                      ),
                    )),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              textInputAction: TextInputAction.next,
              hintext: "Full Name",
              controllers: _name,
              autovalidateMode: _autoValidate,
              isemail: false,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              textInputAction: TextInputAction.next,
              hintext: "Email Id",
              controllers: _email,
              autovalidateMode: _autoValidate,
              isemail: true,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
                obscureText: isObsecure,
                textInputAction: TextInputAction.next,
                controller: _passsowrd,
                keyboardType: TextInputType.visiblePassword,
                autovalidateMode: _autoValidate,
                validator: (value) {
                  bool isUpperCase = RegExp("(?=.*[A-Z])").hasMatch(value!);
                  bool isSpecialCharacter =
                      RegExp("(?=.*[!@#\$%^&*(),.?:{}|<>].*)").hasMatch(value);

                  if (value.isEmpty) {
                    return 'Please enter password';
                  } else if (value.length <= 7) {
                    return "Password must be at least 8 character ";
                  } else if (!isUpperCase) {
                    return "Password must  1 uppercase letter ";
                  } else if (!isSpecialCharacter) {
                    return "Password must  1 special character letter ";
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
                  ),
                  hintText: "Enter Password",
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
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(
                      width: 1,
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
                )),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
                obscureText: isObsecure,
                textInputAction: TextInputAction.next,
                controller: _confirmPass,
                keyboardType: TextInputType.visiblePassword,
                autovalidateMode: _autoValidate,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter password';
                  } else if (value != _passsowrd.text) {
                    return "Password must be same ";
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
                  ),
                  hintText: "Enter Password",
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
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(
                      width: 1,
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
                )),
            const SizedBox(
              height: 20,
            ),
            DropdownButtonHideUnderline(
              child: DropdownButtonFormField2(
                decoration: InputDecoration(
                  hintText: "Select Gender",
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
                ),
                items: items
                    .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ))
                    .toList(),
                value: status,
                onChanged: (value) {
                  setState(() {
                    status = value as String;
                  });
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                suffixIcon: const Icon(
                  Icons.calendar_today,
                  color: Colors.black,
                ),
                hintText: "Date of Birth",
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
              ),

              controller: _datekey, //editing controller of this TextField

              readOnly: true,
              onTap: () async {
                pickDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101));

                if (pickDate != null) {
                  print(pickDate);
                  formatDate = DateFormat('dd/MM/yyyy').format(pickDate!);
                  print(formatDate);
                  setState(() {
                    _datekey.text = formatDate;
                  });
                } else {
                  print("Date is not selected");
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Radio(
                      value: 1,
                      groupValue: _radioSelected,
                      activeColor: Colors.pink,
                      onChanged: (value) {
                        setState(() {
                          _radioSelected = value as int;
                          gender = 'Active';
                          print(gender);
                        });
                      },
                    ),
                    const Text("Active"),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: 2,
                      groupValue: _radioSelected,
                      activeColor: Colors.red,
                      onChanged: (value) {
                        setState(() {
                          _radioSelected = value as int;
                          gender = 'Suspended';
                          print(gender);
                        });
                      },
                    ),
                    const Text("Suspended"),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () async {
                if (formkey.currentState!.validate()) {
                  if (_imageFile == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Plese select image')));
                  } else if (status == null) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Plese select status type')));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
                    homeController.getSubmitDetail(
                        file: _imageFile!,
                        name: _name.text.toString(),
                        email: _email.text.trim(),
                        password: _passsowrd.toString(),
                        date: formatDate,
                        gender: gender,
                        status: status!);
                  }

                  Future.delayed(Duration(seconds: 1), () {
                    if (homeController.regirsterModel!.message ==
                        "Register successfully") {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Register Sucessfull')));
                    }

                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(homeController.regirsterModel!.errorMsg
                            .toString())));

                    // Do something
                  });
                } else {
                  setState(() => _autoValidate = AutovalidateMode.always);
                }
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: const Color(0xff1D2677),
                    borderRadius: BorderRadius.circular(8)),
                height: 48,
                width: MediaQuery.of(context).size.width,
                child: const Text(
                  "Submit",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
