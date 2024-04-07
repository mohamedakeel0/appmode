import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:appmode/core/utils/enums.dart';

void ShowToast({required String text, required Toaststates state}) =>
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: chooseToastColor(state),
        textColor: Colors.white,
        fontSize: 16.0);
Color chooseToastColor(Toaststates state) {
  Color color;
  switch (state) {
    case Toaststates.SUCCESS:
      color = Colors.green;
      break;
    case Toaststates.ERROR:
      color = Colors.red;
      break;
    case Toaststates.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
}