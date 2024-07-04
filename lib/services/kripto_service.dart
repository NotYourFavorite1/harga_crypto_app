import 'dart:convert';
import 'package:http/http.dart' as http;

class CryptoService {
  final String apiUrl = "https://api.coinlore.net/api/tickers/";

  Future<List<dynamic>> fetchCryptoPrices() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      return json.decode(response.body)['data'];
    } else {
      throw Exception('Failed to load crypto prices');
    }
  }
}
