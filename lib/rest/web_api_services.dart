import 'dart:convert';
import 'dart:io';

import 'package:scaleupally/model/categories_model.dart';
import 'package:http/http.dart' as http;
import 'package:scaleupally/model/register_model.dart';

class WebServices {
  static Future<CategoriesModel> fetchCategoryapi() async {
    final response =
        await http.get(Uri.parse("https://anaajapp.com/api/categories"));
    var _data = jsonDecode(response.body.toString());
    print(_data.toString());
    if (response.statusCode == 200) {
      print("200");
      return CategoriesModel.fromJson(_data);
    } else {
      return CategoriesModel.fromJson(_data);
    }
  }

  static Future<RegirsterModel> submitDetail(
      {required File file,
      required String name,
      required String email,
      required String password,
      required String date,
      required String gender,
      required String status}) async {
    var request = http.MultipartRequest(
        "POST", Uri.parse("https://anaajapp.com/api/user/submit_details"));

    request.fields["email"] = email;
    request.fields["password"] = password;
    request.fields["name"] = name;
    request.fields["dob"] = date;
    request.fields["gender"] = status;
    request.fields["user_status"] = gender;
    var pic = await http.MultipartFile.fromPath("image", file.path);
    request.files.add(pic);
    var response = await request.send();
    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    print(responseString);
    print("Data Send..");
    return RegirsterModel.fromJson(jsonDecode(responseString));
  }
}
