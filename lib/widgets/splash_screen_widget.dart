import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreenWidget extends StatelessWidget {
  final double deviceHeight, deviceWidth;

  SplashScreenWidget({
    this.deviceHeight,
    this.deviceWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _logoNameWidget(),
            SizedBox(height: deviceHeight * 0.05),
            _welcomeMessageWidget(),
            SizedBox(height: deviceHeight * 0.10),
            _loadingIndicatorWidget(),
          ],
        ),
      ),
    );
  }

  SpinKitWave _loadingIndicatorWidget() {
    return SpinKitWave(
            color: Colors.blue,
            size: 30,
          );
  }

  Text _welcomeMessageWidget() {
    return Text(
            "Welcome to Zebpay",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          );
  }

  Widget _logoNameWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _logoWidget(),
        _nameWidget()
      ],
    );
  }

  Text _nameWidget() {
    return Text(
        "Zebpay",
        style: TextStyle(
          color: Colors.blue,
          fontSize: 30,
        ),
      );
  }

  Container _logoWidget() {
    return Container(
        height: deviceHeight * 0.10,
        width: deviceWidth * 0.20,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(1000),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              "assets/images/zebpay_logo.png",
            ),
          ),
        ),
      );
  }
}
