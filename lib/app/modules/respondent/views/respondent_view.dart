import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:osap/app/modules/respondent/bindings/respondent_binding.dart';
import 'package:osap/app/modules/respondent/views/reshome_view.dart';
import 'package:osap/app/modules/respondent/views/respondent_notification_view.dart';
import 'package:osap/app/modules/respondent/views/respondent_wallet_view.dart';

import '../controllers/respondent_controller.dart';
import 'package:osap/app/modules/respondent/views/profile_view.dart';

// ignore: must_be_immutable
class RespondentView extends GetView<RespondentController> {
  
  //int currentIndex = 0;
  List<Widget> pages = [
    ReshomeView(),
    RespondentWalletView(),
    ProfileView(),
    // ProfileView()
  ];

  @override
  Widget build(BuildContext context) {
    controller.token.value = Get.arguments[1];

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            //Todo:generate person name
            'Online Survey & Analyzer Platform',
            style: TextStyle(
              fontFamily: 'openSans',
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          elevation: 0.5,
          iconTheme: IconThemeData(color: Colors.white),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[
                  Theme.of(context).primaryColor,
                  Theme.of(context).colorScheme.secondary,
                ])),
          ),
          actions: [
            Container(
              margin: EdgeInsets.only(
                top: 16,
                right: 16,
              ),
              child: Stack(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      //Todo:The notification container must be dynamic
                      Get.to(RespondentNotificationView(),
                          binding: RespondentBinding());
                    },
                    child: Icon(Icons.notifications),
                  ),
                  Positioned(
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      constraints: BoxConstraints(
                        minWidth: 12,
                        minHeight: 12,
                      ),
                      child: Text(
                        '5',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
              currentIndex: controller.currentIndex.value,
              selectedItemColor: Color.fromARGB(255, 215, 22, 179),
              onTap: (index) {
                controller.currentIndex.value = index;
                print(controller.currentIndex.value);
              },
              items: [
                BottomNavigationBarItem(
                    backgroundColor: Colors.red,
                    icon: controller.currentIndex.value == 0
                        ? Icon(Icons.home)
                        : Icon(Icons.home_outlined),
                    label: "Home"),
                BottomNavigationBarItem(
                    icon: controller.currentIndex.value == 1
                        ? Icon(Icons.wallet_giftcard)
                        : Icon(Icons.wallet_giftcard_outlined),
                    label: "Wallet"),
                // BottomNavigationBarItem(
                //     icon: controller.currentIndex.value == 2
                //         ? Icon(Icons.notification_add)
                //         : Icon(Icons.notification_add_outlined),
                //     label: "Notification"),
                BottomNavigationBarItem(
                    icon: controller.currentIndex.value == 2
                        ? Icon(Icons.person)
                        : Icon(Icons.person_outline),
                    label: "My Account")
              ]),
        ),
        body: Obx(() => pages[controller.currentIndex.value]));
  }
}
