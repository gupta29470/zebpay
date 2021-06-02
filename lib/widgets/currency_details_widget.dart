import 'package:flutter/material.dart';

import '../models/currency.dart';

class CurrencyDetailsWidget extends StatelessWidget {
  final Currency currency;

  CurrencyDetailsWidget({this.currency});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(currency.image),
          ),
          title: Text(
            currency.name,
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          subtitle: Text(currency.symbol),
          trailing: Column(
            children: <Widget>[
              Text(
                "${currency.current_price} INR",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              Text(
                "Vol ${currency.total_volume}",
                style: TextStyle(
                  color: Colors.grey,
                ),
              )
            ],
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        _currencyDetailListTile(
          context,
          "24hr High",
          currency.high_24h.toString(),
          "24hr Change",
          currency.price_change_24h.toString(),
          Colors.green,
        ),
        _currencyDetailListTile(
          context,
          "24hr low",
          currency.low_24h.toString(),
          "",
          "",
          Colors.red,
        ),
      ],
    );
  }

  ListTile _currencyDetailListTile(
    BuildContext context,
    String leadingText1,
    String leadingText2,
    String trailingText1,
    String trailingText2,
    Color color,
  ) {
    return ListTile(
      leading: Column(
        children: <Widget>[
          Text(
            leadingText1,
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          Text(
            leadingText2,
            style: TextStyle(
              fontSize: 25,
              color: color,
            ),
          ),
        ],
      ),
      trailing: Column(
        children: <Widget>[
          Text(
            trailingText1,
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          Text(
            trailingText2,
            style: TextStyle(
              fontSize: 25,
              color: color,
            ),
          ),
        ],
      ),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }
}
