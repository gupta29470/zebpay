import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/currency.dart';

class CurrencyAPIService {
  static CurrencyAPIService currencyAPIServiceInstance = CurrencyAPIService();

  Future<List<Currency>> getCurrencies() async {
    final url =
        "https://api.coingecko.com/api/v3/coins/markets?vs_currency=inr&order=market_cap_desc&per_page=100&page=1&sparkline=false";

    final currencies = await http.get(
      Uri.parse(url),
    );
    final List responseBody = json.decode(currencies.body);
    return responseBody
        .map(
          (data) => Currency.fromJSON(data),
        )
        .toList();
  }
}
