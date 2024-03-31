import 'dart:convert';

import 'package:blockto_app/utils/constants/api_constants.dart';
import 'package:http/http.dart' as http;

class CoinMarketApi {
  Future<List<dynamic>> getCoinMarketData() async {
    final response = await http.get(
      Uri.parse("${BApi.baseUrl}coins/markets?vs_currency=usd&sparkline=true"),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'x-cg-api-key': 'CG-uBiMnw2Ceu3tsBZXp6XHcCZi',
      },
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print("Something went wrong");
    }

    return [];
  }
}
