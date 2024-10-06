import 'dart:convert';
import 'package:http/http.dart' as http;

 /// This function fetches news data related to "crypto coin" from the NewsData API.
  /// 
  /// Steps to get the API key:
  /// 1. Visit [newsdata.io](https://newsdata.io).
  /// 2. Sign up or log in to your account.
  /// 3. Navigate to the API section and generate your API key.
  /// 4. Replace the API key (`pub_51984f7ea58c2be3b9153e876284ef1803a451`) in the URL with your own API key.
  /// 
  /// The API request fetches news articles in English related to "crypto coin."

class NewsApi {
  Future<List<dynamic>> getNewsData() async {
    final response = await http.get(
      Uri.parse(
          "https://newsdata.io/api/1/news?apikey=Put_your_API_key_here&q=crypto%20coin&language=en"),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['results'] as List<dynamic>;
    } else {
      print("Something went wrong");
    }

    return [];
  }
}
