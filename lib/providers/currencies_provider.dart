import 'package:flutter/widgets.dart';

import '../services/currency_api_service.dart';
import '../models/currency.dart';

class CurrenciesProvider extends ChangeNotifier {
  List<Currency> currencyList = [];

  CurrenciesProvider() {
    fetchCurrencies();
  }

  Future<void> fetchCurrencies() async {
    try {
      final currenciesAPI =
          await CurrencyAPIService.currencyAPIServiceInstance.getCurrencies();
      currencyList = currenciesAPI;

      currencyList.sort(
        (a, b) => a.name.toString().toLowerCase().compareTo(
              b.name.toString().toLowerCase(),
            ),
      );
    } catch (error) {
      print(error.toString());
    }
    notifyListeners();
  }
}
