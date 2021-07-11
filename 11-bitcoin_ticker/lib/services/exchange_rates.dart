import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:bitcoin_ticker/services/networking.dart';

class ExchangeRate {
  String? quote;
  String base;

  ExchangeRate({required this.quote, this.base = 'BTC'});

  Future<dynamic> getExchangeRate() async {
    String apiKey = dotenv.env['COIN_API_KEY'] ?? '';
    String coinApiUrl = 'https://rest.coinapi.io/v1/exchangerate';
    String url = '$coinApiUrl/$base/$quote';
    Map<String, String> header = {'X-CoinAPI-Key': '$apiKey'};

    NetworkHelper networkHelper = NetworkHelper(
      url: url,
      headers: header,
    );

    return await networkHelper.getData();
  }
}
