import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper {
  final String url;
  Map<String, String>? headers;

  NetworkHelper({required this.url, this.headers});

  Future getData() async {
    http.Response response = await http.get(
      Uri.parse(url),
      headers: headers,
    );
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      return decodedData;
    } else {
      print(response.statusCode);
    }
  }
}
