import 'dart:io';

import 'package:get/get.dart';
import 'package:scaleupally/model/categories_model.dart';
import 'package:scaleupally/model/register_model.dart';
import 'package:scaleupally/rest/web_api_services.dart';

class HomeController extends GetxController {
  List<Datum> categorylist = <Datum>[].obs;

  RegirsterModel? regirsterModel;

  fetchCategory() async {
    var response = await WebServices.fetchCategoryapi();
    if (response != null) {
      categorylist = response.data;
      print(categorylist);
    }
  }

  getSubmitDetail(
      {required File file,
      required String name,
      required String email,
      required String password,
      required String date,
      required String gender,
      required String status}) async {
    var response = await WebServices.submitDetail(
        file: file,
        name: name,
        email: email,
        password: password,
        date: date,
        gender: gender,
        status: status);
    if (response != null) {
      regirsterModel = response;
      print(regirsterModel);
    }
  }
}
