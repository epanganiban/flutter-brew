import 'dart:io' show Platform;
import 'package:bitcoin_ticker/services/exchange_rates.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:bitcoin_ticker/utils/coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String quote = 'USD';
  List<RateCard> cards = [];

  @override
  void initState() {
    super.initState();
    updateUI(quote);
  }

  void updateUI(String selectedCurrency) async {
    List<RateCard> buffer = await generateCards(selectedCurrency);
    setState(() {
      quote = selectedCurrency;
      cards = buffer;
    });
  }

  Future<List<RateCard>> generateCards(String selectedCurrency) async {
    List<RateCard> cards = [];
    for (String base in cryptoList) {
      var exchangeRateData = await ExchangeRate(
        base: base,
        quote: selectedCurrency,
      ).getExchangeRate();
      // var exchangeRateData;
      String rate;

      if (exchangeRateData != null) {
        double buffer = exchangeRateData['rate'];
        rate = buffer.toInt().toString();
      } else {
        rate = '?';
      }

      cards.add(RateCard(base: base, quote: selectedCurrency, rate: rate));
    }
    return cards;
  }

  DropdownButton androidDropdown() {
    List<DropdownMenuItem<String>> dropdownMenuItems = [];
    for (String currency in currenciesList) {
      dropdownMenuItems.add(
        DropdownMenuItem(
          child: Text(
            currency,
          ),
          value: currency,
        ),
      );
    }

    return DropdownButton(
      value: quote,
      items: dropdownMenuItems,
      onChanged: (value) {
        updateUI(value.toString());
      },
    );
  }

  CupertinoPicker iOSPicker() {
    List<Text> pickerItems = [];
    for (String currency in currenciesList) {
      pickerItems.add(
        Text(currency),
      );
    }

    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        updateUI(currenciesList[selectedIndex]);
      },
      children: pickerItems,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: cards,
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? iOSPicker() : androidDropdown(),
          ),
        ],
      ),
    );
  }
}

class RateCard extends StatelessWidget {
  RateCard({
    required this.base,
    required this.quote,
    required this.rate,
  });

  final String base;
  final String quote;
  final String rate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 $base = $rate $quote',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}