import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/researcher_controller.dart';

class ResultView extends GetView<ResearcherController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ResultView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ResultView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
