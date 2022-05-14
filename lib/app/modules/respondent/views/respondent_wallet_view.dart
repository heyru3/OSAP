import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:osap/app/data/widget/header.dart';

class RespondentWalletView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
      Container(
        height: 150,
        child: HeaderWidget(150, false, Icons.house_rounded),
      ),
      SafeArea(
          child: Container(
              // margin: EdgeInsets.fromLTRB(25, 10, 25, 10),
              //padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              ))
    ])));
  }
}
