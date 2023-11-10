import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:re_pr2_aryan_1336/helper/api_helper.dart';

class ApiProvider extends ChangeNotifier {
  List alldata = [];
  Map<String, dynamic>? current;

  ApiProvider() {
    getApiData();
  }

  getApiData() async {
    current = await ApiHelper.apiHelper.getData();
    log("$alldata");
    alldata = current!['products'];
    notifyListeners();
  }
}
