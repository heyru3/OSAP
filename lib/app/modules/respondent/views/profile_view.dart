import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:osap/app/data/widget/header.dart';
import 'package:osap/app/modules/respondent/controllers/profile_controller.dart';
import 'package:osap/app/modules/respondent/controllers/respondent_controller.dart';
import 'package:osap/app/routes/app_pages.dart';

// ignore: must_be_immutable
class ProfileView extends GetView<RespondentController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('ProfileView'),
      //   centerTitle: true,
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 150,
              child: HeaderWidget(150, false, Icons.house_rounded),
            ),
            SafeArea(
              child: Container(
                // margin: EdgeInsets.fromLTRB(25, 10, 25, 10),
                //padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(
                      color: Color.fromARGB(255, 216, 13, 135),
                    ),
                    ListTile(
                        leading: Icon(
                          Icons.change_circle,
                          // size: _drawerIconSize,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        title: Text(
                          'change profile',
                          style: TextStyle(
                              fontSize: 17,
                              fontFamily: 'openSans',
                              color: Theme.of(context).colorScheme.secondary),
                        ),
                        trailing: GestureDetector(
                          onTap: () {
                            //Todo:edit file
                          },
                          child: Icon(Icons.arrow_forward_ios_outlined),
                        )),
                    Divider(
                      color: Color.fromARGB(255, 216, 13, 135),
                      height: 20,
                    ),
                    ListTile(
                        leading: Icon(
                          Icons.password_rounded,
                          // size: _drawerIconSize,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        title: Text(
                          'change Password',
                          style: TextStyle(
                              fontSize: 17,
                              fontFamily: 'openSans',
                              color: Theme.of(context).colorScheme.secondary),
                        ),
                        trailing: GestureDetector(
                          onTap: () {
                            //Todo:edit file
                          },
                          child: Icon(Icons.arrow_forward_ios_outlined),
                        )),
                    Divider(
                      color: Color.fromARGB(255, 216, 13, 135),
                    ),
                    ListTile(
                        leading: Icon(
                          Icons.feedback,
                          // size: _drawerIconSize,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        title: Text(
                          'Feedback',
                          style: TextStyle(
                              fontSize: 17,
                              fontFamily: 'openSans',
                              color: Theme.of(context).colorScheme.secondary),
                        ),
                        trailing: GestureDetector(
                          onTap: () {
                            //Todo:edit file
                          },
                          child: Icon(Icons.arrow_forward_ios_outlined),
                        )),
                    Divider(
                      color: Color.fromARGB(255, 216, 13, 135),
                      height: 20,
                    ),
                    ListTile(
                        leading: Icon(
                          Icons.call_outlined,
                          // size: _drawerIconSize,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        title: Text(
                          'Contact Us',
                          style: TextStyle(
                              fontSize: 17,
                              fontFamily: 'openSans',
                              color: Theme.of(context).colorScheme.secondary),
                        ),
                        trailing: GestureDetector(
                          onTap: () {
                            //Todo:edit file
                          },
                          child: Icon(Icons.arrow_forward_ios_outlined),
                        )),
                    Divider(
                      color: Color.fromARGB(255, 216, 13, 135),
                    ),
                    ListTile(
                        leading: Icon(
                          Icons.mark_chat_read_outlined,
                          // size: _drawerIconSize,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        title: Text(
                          'About',
                          style: TextStyle(
                              fontSize: 17,
                              fontFamily: 'openSans',
                              color: Theme.of(context).colorScheme.secondary),
                        ),
                        trailing: GestureDetector(
                          onTap: () {
                            //Todo:edit file
                          },
                          child: Icon(Icons.arrow_forward_ios_outlined),
                        )),
                    Divider(
                      color: Color.fromARGB(255, 216, 13, 135),
                      height: 20,
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.logout_rounded,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      title: Text(
                        'Logout',
                        style: TextStyle(
                            fontFamily: 'openSans',
                            color: Theme.of(context).colorScheme.secondary),
                      ),
                      onTap: () {
                        controller.logout();
                        Get.offAllNamed(Routes.HOME);
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
