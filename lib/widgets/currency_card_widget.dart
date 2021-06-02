import 'package:flutter/material.dart';

import '../models/currency.dart';

class CurrencyCardWidget extends StatelessWidget {
  final Currency currency;

  const CurrencyCardWidget({this.currency});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(currency.image),
        ),
        title: Text(
          currency.name,
        ),
        subtitle: Text(
          currency.symbol,
        ),
        trailing: Text(
          "${currency.current_price.toString()} INR",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
