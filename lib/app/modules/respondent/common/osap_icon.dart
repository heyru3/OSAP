import 'package:flutter/material.dart';

class OsapIcon extends StatelessWidget {
  const OsapIcon({Key? key, required this.assetname}) : super(key: key);
  final String assetname;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/image/$assetname",
      height: 25,
      width: 25,
    );
  }
}
