import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SharedBillsModalDialog {
  static loadindModal(BuildContext context) {
    return showDialog(
      barrierDismissible: false,
        context: context,
        builder: (context) {
          return Center(
            child: Container(
              width: 250,
              height: 50,
              decoration:
                  BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
              child: CupertinoActivityIndicator(),
            ),
          );
        });
  }
}
