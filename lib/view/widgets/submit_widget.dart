import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'dart:io';
import 'package:scaleupally/view/widgets/custom_textfiled.dart';
import 'package:scaleupally/view/widgets/password_textfiled.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class SubmitWidget extends StatefulWidget {
  const SubmitWidget({Key? key}) : super(key: key);

  @override
  State<SubmitWidget> createState() => _SubmitWidgetState();
}

class _SubmitWidgetState extends State<SubmitWidget> {
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
                    radius: Radius.circular(5),
                    dashPattern: [5, 5],
                    color: Colors.grey,
                    strokeWidth: 2,
                    child: Center(
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
                          Text("Upload")
                        ],
                      ),
                    )),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextField(hintext: "Full Name"),
            SizedBox(
              height: 20,
            ),
            CustomTextField(hintext: "Email Id"),
            SizedBox(
              height: 20,
            ),
            PasswordTextField(hintext: "Create Password"),
            SizedBox(
              height: 20,
            ),
            PasswordTextField(hintext: "Confirm Password"),
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
            SizedBox(
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
              onTap: () {
                if (formkey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
                // _asyncFileUpload(_imageFile!, name, email, password,
                //     formattedDate, gender, status!);
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Color(0xff1D2677),
                    borderRadius: BorderRadius.circular(8)),
                height: 48,
                width: MediaQuery.of(context).size.width,
                child: Text(
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
