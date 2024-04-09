import 'dart:convert';

import 'package:http/http.dart' as http;

class NewsApi {
  Future<List<dynamic>> getNewsData() async {
    final response = await http.get(
      Uri.parse(
          "https://newsdata.io/api/1/news?apikey=pub_415924aaf9892fcc9d52c341d7b2c1700f10c&q=crypto%20coin&language=en "),
    );
    if (response.statusCode == 200) {
      print(response.body);
      return jsonDecode(response.body)['results'] as List<dynamic>;
    } else {
      print("Something went wrong");
    }

    return [];
  }
}
