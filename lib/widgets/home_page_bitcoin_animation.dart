import 'package:cryptoginie/utils/asset_data.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomePageBitcoinAnimation extends StatelessWidget {
  double height;

  HomePageBitcoinAnimation({this.height = 250});

  @override
  Widget build(BuildContext context) {
    debugPrint("Height : $height");
    return Lottie.asset(bitcoinLot,
        width: MediaQuery.of(context).size.width,
        height: height,
        //fit: BoxFit.cover,
        repeat: true);
  }
}
