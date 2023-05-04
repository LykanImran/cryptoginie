import 'dart:convert';

import 'package:cryptoginie/config/network_config.dart';
import 'package:cryptoginie/models/bit_data_model.dart';
import 'package:cryptoginie/services/ApiManager.dart';
import 'package:flutter/material.dart';

class DatabaseServices {
  Future<BitDataModel> getBtcDateFromApi(BuildContext context) async {
    var webLink = NetworkConfig.api;
    BitDataModel bit = BitDataModel();
    debugPrint(' =========================');
    debugPrint(' Fetching Bitcoin Data  ');
    debugPrint(' =========================');

    try {
      var data = await ApiManager().callGetApi(context, webLink, false, '');
      debugPrint('===========================');
      debugPrint('Data from api =====>  $data ');
      debugPrint('===========================');

      ///Success
      return BitDataModel.fromJson(jsonDecode(data));
    } catch (e) {
      debugPrint('Er>>> $e');
      return bit;
    }
  }
}
