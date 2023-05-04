import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// import 'package:google_fonts/google_fonts.dart';

class Alert {
  showAlertDialog(BuildContext context, String title, String message) {
    showDialog(
        context: context,
        builder: (alertcontext) {
          if (title == '') {
            return CupertinoAlertDialog(
              content: Text(
                message,
              ),
              actions: <Widget>[
                CupertinoButton(
                  onPressed: () {
                    Navigator.of(alertcontext).pop();
                  },
                  child: const Text(
                    'OK',

                    ///style: ,
                  ),
                )
              ],
            );
          } else {
            return CupertinoAlertDialog(
              title: Text(
                title,
              ),
              content: Text(
                message,
              ),
              actions: <Widget>[
                CupertinoButton(
                  onPressed: () {
                    Navigator.of(alertcontext).pop();
                  },
                  child: const Text(
                    'OK',
                  ),
                )
              ],
            );
          }
        });
  }

  showAlertDialogWithBackNavigation(
      BuildContext context, String title, String message) {
    showDialog(
        context: context,
        builder: (alertcontext) {
          if (title == '') {
            return CupertinoAlertDialog(
              content: Text(
                message,
              ),
              actions: <Widget>[
                CupertinoButton(
                  onPressed: () {
                    // Navigator.of(context).pushAndRemoveUntil(
                    //     CupertinoPageRoute(
                    //         builder: (context) => InputMobileNumber("", false)),
                    //     (route) => false);
                  },
                  child: const Text(
                    'OK',
                  ),
                )
              ],
            );
          } else {
            return CupertinoAlertDialog(
              title: Text(
                title,
              ),
              content: Text(
                message,
              ),
              actions: <Widget>[
                CupertinoButton(
                  onPressed: () {
                    // Navigator.of(context).pushAndRemoveUntil(
                    //     CupertinoPageRoute(
                    //         builder: (context) => InputMobileNumber("", false)),
                    //     (route) => false);
                  },
                  child: const Text(
                    'OK',
                  ),
                )
              ],
            );
          }
        });
  }

}
