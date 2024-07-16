import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpHelper {
  static const String baseUrl = 'https://abdalluh-essam.com/';

  static Future<Map<String, dynamic>?> getData(String endpoint, {Map<String, dynamic>? query}) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl$endpoint'));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw 'Failed to load data: ${response.statusCode}';
      }
    } catch (e) {
      throw 'Failed to fetch data: $e';
    }
  }

  static Future<Map<String, dynamic>?> postData(String endpoint, {Map<String, dynamic>? body}) async {
    try {
      final response = await http.post(Uri.parse('$baseUrl$endpoint'), body: jsonEncode(body));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw 'Failed to post data: ${response.statusCode}';
      }
    } catch (e) {
      throw 'Failed to send data: $e';
    }
  }
}
