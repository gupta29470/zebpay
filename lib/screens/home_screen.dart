import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/currencies_provider.dart';
import '../models/currency.dart';
import '../widgets/currency_details_widget.dart';
import '../widgets/currency_card_widget.dart';
import 'search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List currencyList = [];
  bool ascending = true;
  var currencyProvider;

  void refresh(BuildContext context) {
    currencyProvider = Provider.of<CurrenciesProvider>(context);
    currencyList = currencyProvider.currencyList;
  }

  void sortList() {
    if (ascending) {
      setState(() {
        currencyList.sort(
          (a, b) => b.name.toString().toLowerCase().compareTo(
                a.name.toString().toLowerCase(),
              ),
        );
        ascending = false;
      });
    } else {
      setState(() {
        currencyList.sort(
          (a, b) => a.name.toString().toLowerCase().compareTo(
                b.name.toString().toLowerCase(),
              ),
        );
        ascending = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    currencyProvider = Provider.of<CurrenciesProvider>(context);
    currencyList = currencyProvider.currencyList;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => SearchScreen(
                  currencyList: currencyList,
                ),
              ),
            );
          },
        ),
        title: Image.asset(
          "assets/images/zebpay_logo.png",
          height: 50,
          width: 50,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () => refresh(context),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          _sortButtonWidget(),
          _currenciesListWidget(currencyList, context),
        ],
      ),
    );
  }

  Widget _currenciesListWidget(List currencyList, BuildContext context) {
    return Flexible(
      child: ListView.builder(
        itemCount: currencyList.length,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          Currency currency = currencyList[index];
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
      ),
    );
  }

  Widget _sortButtonWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8, right: 30, left: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.sort_by_alpha,
              size: 50,
            ),
            onPressed: () {
              sortList();
            },
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
