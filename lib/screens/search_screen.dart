import 'package:flutter/material.dart';

import '../models/currency.dart';
import '../widgets/currency_card_widget.dart';
import '../widgets/currency_details_widget.dart';

class SearchScreen extends StatefulWidget {
  final List<Currency> currencyList;

  SearchScreen({this.currencyList});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchController = TextEditingController();
  List<Currency> searchedCurrencyList = [];

  @override
  void initState() {
    super.initState();
  }

  onItemChanged(String value) {
    searchedCurrencyList.clear();
    if (value.isEmpty) {
      setState(() {});
      return;
    }
    widget.currencyList.forEach((currency) {
      if (currency.name.toString().toLowerCase() == value.toLowerCase()) {
        searchedCurrencyList.add(currency);
      } else if (currency.name
          .toString()
          .toLowerCase()
          .startsWith(value.toLowerCase()[0])) {
        searchedCurrencyList.add(currency);
      }
      else if (currency.name
          .toString()
          .toLowerCase()
          .contains(value.toLowerCase())) {
        searchedCurrencyList.add(currency);
      }
    });
    setState(() {
      print(searchedCurrencyList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.only(top: 15, bottom: 15, right: 30, left: 30),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search Currency',
              ),
              onChanged: onItemChanged,
            ),
          ),
          Flexible(
            child: _searchController.text.isNotEmpty
                ? ListView.builder(
                    itemCount: searchedCurrencyList.length,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      Currency currency = searchedCurrencyList[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () => _currencyDetails(context, currency),
                          child: CurrencyCardWidget(
                            currency: currency,
                          ),
                        ),
                      );
                    },
                  )
                : ListView.builder(
                    itemCount: widget.currencyList.length,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      Currency currency = widget.currencyList[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          child: CurrencyCardWidget(
                            currency: currency,
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  void _currencyDetails(BuildContext context, Currency currency) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      context: context,
      builder: (context) {
        return CurrencyDetailsWidget(
          currency: currency,
        );
      },
    );
  }
}
