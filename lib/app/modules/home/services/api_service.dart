import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiServie {
  static String url = "https://dog.ceo/api/breeds/image/random";

  static Future<String> getUrl() async {
    try {
      final http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        Map data = jsonDecode(response.body);
        return data['message'];
      } else {
        return '';
      }
    } catch (e) {
      return '';
    }
  }
}
