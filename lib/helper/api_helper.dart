import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiHelper {
  ApiHelper._();

  static final ApiHelper apiHelper = ApiHelper._();

  getData() async {
    String url = "https://dummyjson.com/products?limit=100";
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var items = await data;
      return items;
    }
  }
}
