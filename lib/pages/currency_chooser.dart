import 'package:cryptoginie/models/bit_data_model.dart';
import 'package:cryptoginie/services/database_services.dart';
import 'package:cryptoginie/utils/number_helper.dart';
import 'package:flutter/material.dart';
import 'package:wheel_chooser/wheel_chooser.dart';

class CurrencyChooser extends StatefulWidget {
  const CurrencyChooser();
  @override
  State<CurrencyChooser> createState() => _CurrencyChooserState();
}

class _CurrencyChooserState extends State<CurrencyChooser> {
  late Future myFuture;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myFuture = fetchBTCData();
  }

  late BitDataModel bit;
  Future<BitDataModel> fetchBTCData() async {
    BitDataModel newItems = await DatabaseServices().getBtcDateFromApi(context);

    debugPrint(' | I - >  | ${newItems.chartName}');
    return newItems;
  }

  String selectedCurr = '';

  @override
  Widget build(BuildContext context) {
    debugPrint('Build ------ >');

    return FutureBuilder(
      builder: (ctx, snapshot) {
        debugPrint('===> Debug snap State  --- : ${snapshot.connectionState}');
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot == null) {
            return const Center(
                child: Text(
              ' No Data ',
            ));
          }
          // If we got an error
          if (snapshot.hasError) {
            return Center(
              child: Text(
                '${snapshot.error} occurred',
                style: const TextStyle(fontSize: 18),
              ),
            );

            // if we got our data
          } else if (snapshot.hasData) {
            // Extracting data from snapshot object
            bit = snapshot.data as BitDataModel;
            List<String> currList = [];
            currList.add(bit.bpi!.eUR!.code!);
            currList.add(bit.bpi!.gBP!.code!);
            currList.add(bit.bpi!.uSD!.code!);

            debugPrint("currList : $currList");

            return Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Price : ${getCurrencyRate()}",
                    style: const TextStyle(fontSize: 25),
                  ),
                  SizedBox(
                    width: 250,
                    height: 250,
                    child: WheelChooser(
                      unSelectTextStyle: const TextStyle(color: Colors.grey),
                      onValueChanged: (s) {
                        setState(() {
                          selectedCurr = s;
                        });
                      },
                      datas: currList,
                    ),
                  )
                ],
              ),
            );
          }
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
      future: myFuture,
    );
  }

  String getCurrencyRate() {
    double rate = 0;
    if (selectedCurr == '') {
      rate = bit.bpi!.eUR!.rateFloat!;
    }
    if (bit.bpi!.eUR!.code == selectedCurr) {
      rate = bit.bpi!.eUR!.rateFloat!;
    } else if (bit.bpi!.uSD!.code == selectedCurr) {
      rate = bit.bpi!.uSD!.rateFloat!;
    } else if (bit.bpi!.gBP!.code == selectedCurr) {
      rate = bit.bpi!.gBP!.rateFloat!;
    }

    String curRate = '';
    curRate = getShortDecimal(rate);
    debugPrint("rate called = > $curRate");
    return curRate;
  }
}
