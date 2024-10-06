import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class CoinMarketApi {
  final String baseURL = dotenv.env['BASE_URL'] ?? "";

  Future<List<dynamic>> getCoinMarketData() async {
    final response = await http.get(
      Uri.parse("${baseURL}coins/markets?vs_currency=usd&sparkline=true"),
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
