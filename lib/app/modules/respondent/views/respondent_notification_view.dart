import 'package:flutter/material.dart';

import 'package:get/get.dart';

class RespondentNotificationView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RespondentNotificationView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'RespondentNotificationView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
