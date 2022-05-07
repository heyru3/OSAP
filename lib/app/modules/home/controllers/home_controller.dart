import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final double headerHeight = 150;
  double devWidth = 0;
  double devHeight = 0;

  void setDevWandH(context) {
    devWidth = MediaQuery.of(context).size.width;
    devHeight = MediaQuery.of(context).size.height;
  }

  double getDevWidth(context) {
    return devWidth;
  }

  double getDevHeight(context) {
    return devHeight;
  }
}
