import 'dart:convert';

import 'package:blockto_app/utils/constants/api_constants.dart';
import 'package:http/http.dart' as http;

class CoinChartApi {
  Future<List<dynamic>> getCoinChartData(String coinName) async {
    final response = await http.get(
      Uri.parse("${BApi.baseUrl}coins/bitcoin/ohlc?vs_currency=usd&days=1"),
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
