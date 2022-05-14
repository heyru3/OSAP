import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:osap/app/modules/respondent/bindings/respondent_binding.dart';
import 'package:osap/app/modules/respondent/views/reshome_view.dart';
import 'package:osap/app/modules/respondent/views/respondent_notification_view.dart';
import 'package:osap/app/modules/respondent/views/respondent_wallet_view.dart';

import '../controllers/respondent_controller.dart';
import 'package:osap/app/modules/respondent/views/profile_view.dart';

//import '../controllers/researcher_controller.dart';
//import 'feedback_view.dart';

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
    controller.token.value = Get.arguments;

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

        ///////////////////////////////////////////////////////////////////////////
        // drawer: Drawer(
        //   child: Container(
        //     decoration: BoxDecoration(
        //         gradient: LinearGradient(
        //             begin: Alignment.topLeft,
        //             end: Alignment.bottomRight,
        //             stops: [
        //           0.0,
        //           1.0
        //         ],
        //             colors: [
        //           Theme.of(context).primaryColor.withOpacity(0.2),
        //           Theme.of(context).colorScheme.secondary.withOpacity(0.3),
        //         ])),
        // child: ListView(
        //   children: [
        //     DrawerHeader(
        //       decoration: BoxDecoration(
        //         color: Theme.of(context).primaryColor,
        //         gradient: LinearGradient(
        //           begin: Alignment.topLeft,
        //           end: Alignment.bottomRight,
        //           stops: [0.0, 1.0],
        //           colors: [
        //             Theme.of(context).primaryColor,
        //             Theme.of(context).colorScheme.secondary,
        //           ],
        //         ),
        //       ),
        //       child: CircleAvatar(
        //         backgroundColor: Colors.white,
        //         minRadius: 15,
        //         maxRadius: 30,
        //         child: Icon(
        //           Icons.person,
        //           size: 80,
        //           color: Colors.grey.shade300,
        //         ),
        //       ),
        //     ),
        //     ListTile(
        //       leading: Icon(
        //         Icons.description_outlined,
        //         size: _drawerIconSize,
        //         color: Theme.of(context).colorScheme.secondary,
        //       ),
        //       title: Text(
        //         'Create questioners',
        //         style: TextStyle(
        //             fontSize: 17,
        //             fontFamily: 'openSans',
        //             color: Theme.of(context).colorScheme.secondary),
        //       ),
        //       onTap: () {
        //         Get.to(QuestioneryView(), binding: ResearcherBinding());
        //       },
        //     ),
        //     Divider(
        //       color: Theme.of(context).primaryColor,
        //       height: 1,
        //     ),
        //         ListTile(
        //           leading: Icon(Icons.person_outline_sharp,
        //               size: _drawerIconSize,
        //               color: Theme.of(context).colorScheme.secondary),
        //           title: Text(
        //             'Profile',
        //             style: TextStyle(
        //                 fontFamily: 'openSans',
        //                 fontSize: _drawerFontSize,
        //                 color: Theme.of(context).colorScheme.secondary),
        //           ),
        //           onTap: () {
        //             Get.to(ProfileView(), binding: ResearcherBinding());
        //           },
        //         ),
        //         Divider(
        //           color: Theme.of(context).primaryColor,
        //           height: 1,
        //         ),
        //         ListTile(
        //           leading: Icon(Icons.feedback_outlined,
        //               size: _drawerIconSize,
        //               color: Theme.of(context).colorScheme.secondary),
        //           title: Text(
        //             'Feedback',
        //             style: TextStyle(
        //                 fontFamily: 'openSans',
        //                 fontSize: _drawerFontSize,
        //                 color: Theme.of(context).colorScheme.secondary),
        //           ),
        //
        //         ),
        //         Divider(
        //           color: Theme.of(context).primaryColor,
        //           height: 1,
        //         ),
        //         ListTile(
        //           leading: Icon(
        //             Icons.slideshow_outlined,
        //             size: _drawerIconSize,
        //             color: Theme.of(context).colorScheme.secondary,
        //           ),
        //           title: Text(
        //             'Result',
        //             style: TextStyle(
        //                 fontFamily: 'openSans',
        //                 fontSize: _drawerFontSize,
        //                 color: Theme.of(context).colorScheme.secondary),
        //           ),
        //           onTap: () {
        //             Get.to(ResultView(), binding: ResearcherBinding());
        //           },
        //         ),
        //         Divider(
        //           color: Theme.of(context).primaryColor,
        //           height: 1,
        //         ),
        //         ListTile(
        //           leading: Icon(
        //             Icons.logout_rounded,
        //             size: _drawerIconSize,
        //             color: Theme.of(context).colorScheme.secondary,
        //           ),
        //           title: Text(
        //             'Logout',
        //             style: TextStyle(
        //                 fontFamily: 'openSans',
        //                 fontSize: _drawerFontSize,
        //                 color: Theme.of(context).colorScheme.secondary),
        //           ),
        //           onTap: () {
        //             Get.offAllNamed(Routes.HOME);
        //           },
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
/////////////////////
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
