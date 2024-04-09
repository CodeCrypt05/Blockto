import 'dart:convert';

import 'package:blockto_app/utils/constants/api_constants.dart';
import 'package:http/http.dart' as http;

class CoinChartApi {
  Future<List<dynamic>> getCoinChartData(String coinName, String day) async {
    print("data that clicked: ${coinName} , ${day}");
    final response = await http.get(
      Uri.parse(
          "${BApi.baseUrl}coins/$coinName/ohlc?vs_currency=usd&days=$day"),
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
