import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:osap/app/data/widget/header.dart';
import 'package:osap/app/modules/researcher/bindings/researcher_binding.dart';
import 'package:osap/app/modules/researcher/views/profile_view.dart';
import 'package:osap/app/modules/researcher/views/questionery_view.dart';
import 'package:osap/app/modules/researcher/views/result_view.dart';
import 'package:osap/app/routes/app_pages.dart';

import '../controllers/researcher_controller.dart';
import 'feedback_view.dart';

class ResearcherView extends GetView<ResearcherController> {
  final double _drawerIconSize = 24;
  final double _drawerFontSize = 17;

  @override
  Widget build(BuildContext context) {
    controller.token.value = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          //Todo:generate person name
          'Person name',
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
                    Get.to(ProfileView(), binding: ResearcherBinding());
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
      drawer: Drawer(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [
                0.0,
                1.0
              ],
                  colors: [
                Theme.of(context).primaryColor.withOpacity(0.2),
                Theme.of(context).colorScheme.secondary.withOpacity(0.3),
              ])),
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.0, 1.0],
                    colors: [
                      Theme.of(context).primaryColor,
                      Theme.of(context).colorScheme.secondary,
                    ],
                  ),
                ),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  minRadius: 15,
                  maxRadius: 30,
                  child: Icon(
                    Icons.person,
                    size: 80,
                    color: Colors.grey.shade300,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.description_outlined,
                  size: _drawerIconSize,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                title: Text(
                  'Create questioners',
                  style: TextStyle(
                      fontSize: 17,
                      fontFamily: 'openSans',
                      color: Theme.of(context).colorScheme.secondary),
                ),
                onTap: () {
                  Get.to(QuestioneryView(), binding: ResearcherBinding());
                },
              ),
              Divider(
                color: Theme.of(context).primaryColor,
                height: 1,
              ),
              ListTile(
                leading: Icon(Icons.person_outline_sharp,
                    size: _drawerIconSize,
                    color: Theme.of(context).colorScheme.secondary),
                title: Text(
                  'Profile',
                  style: TextStyle(
                      fontFamily: 'openSans',
                      fontSize: _drawerFontSize,
                      color: Theme.of(context).colorScheme.secondary),
                ),
                onTap: () {
                  Get.to(ProfileView(), binding: ResearcherBinding());
                },
              ),
              Divider(
                color: Theme.of(context).primaryColor,
                height: 1,
              ),
              ListTile(
                leading: Icon(Icons.feedback_outlined,
                    size: _drawerIconSize,
                    color: Theme.of(context).colorScheme.secondary),
                title: Text(
                  'Feedback',
                  style: TextStyle(
                      fontFamily: 'openSans',
                      fontSize: _drawerFontSize,
                      color: Theme.of(context).colorScheme.secondary),
                ),
                onTap: () {
                  Get.to(FeedbackView(), binding: ResearcherBinding());
                },
              ),
              Divider(
                color: Theme.of(context).primaryColor,
                height: 1,
              ),
              ListTile(
                leading: Icon(
                  Icons.slideshow_outlined,
                  size: _drawerIconSize,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                title: Text(
                  'Result',
                  style: TextStyle(
                      fontFamily: 'openSans',
                      fontSize: _drawerFontSize,
                      color: Theme.of(context).colorScheme.secondary),
                ),
                onTap: () {
                  Get.to(ResultView(), binding: ResearcherBinding());
                },
              ),
              Divider(
                color: Theme.of(context).primaryColor,
                height: 1,
              ),
              ListTile(
                leading: Icon(
                  Icons.logout_rounded,
                  size: _drawerIconSize,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                title: Text(
                  'Logout',
                  style: TextStyle(
                      fontFamily: 'openSans',
                      fontSize: _drawerFontSize,
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
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 150,
              child: HeaderWidget(150, false, Icons.house_rounded),
            ),
            SafeArea(
              child: Container(
                margin: EdgeInsets.fromLTRB(25, 10, 25, 10),
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'With OSAP you can:',
                      style: TextStyle(
                        color: Colors.blue,
                        letterSpacing: 1.2,
                        fontSize: 30,
                        fontFamily: 'openSans',
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Recruit, manage, and interact with respondents',
                      style: TextStyle(
                        letterSpacing: 1.2,
                        color: Theme.of(context).primaryColor,
                        fontSize: 16,
                        fontFamily: 'openSans',
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.only(left: 10, top: 10),
                      width: MediaQuery.of(context).size.width * 2 / 3,
                      decoration: BoxDecoration(
                          color: Colors.white54,
                          border: Border(
                              left: BorderSide(width: 2, color: Colors.blue))),
                      child: Text(
                        ' Built-in invitation, scheduling, and chat features. Manage and interact with your participants using the announcement and discussion board features.',
                        style: TextStyle(
                          height: 1.8,
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 12,
                          fontFamily: 'openSans',
                          letterSpacing: 1.2,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Easily create and distribute surveys',
                      style: TextStyle(
                        letterSpacing: 1.2,
                        color: Theme.of(context).primaryColor,
                        fontSize: 16,
                        fontFamily: 'openSans',
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.only(left: 10, top: 10),
                      width: MediaQuery.of(context).size.width * 2 / 3,
                      decoration: BoxDecoration(
                          color: Colors.white54,
                          border: Border(
                              left: BorderSide(width: 2, color: Colors.blue))),
                      child: Text(
                        ' Design and distribute surveys with a few clicks - create from scratch, use a template, or upload an existing Excel file. Review and export survey data readily available as responses are collected.',
                        style: TextStyle(
                          height: 1.8,
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 12,
                          fontFamily: 'openSans',
                          letterSpacing: 1.2,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Easily create and distribute surveys',
                      style: TextStyle(
                        letterSpacing: 1.2,
                        color: Theme.of(context).primaryColor,
                        fontSize: 16,
                        fontFamily: 'openSans',
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.only(left: 10, top: 10),
                      width: MediaQuery.of(context).size.width * 2 / 3,
                      decoration: BoxDecoration(
                          color: Colors.white54,
                          border: Border(
                              left: BorderSide(width: 2, color: Colors.blue))),
                      child: Text(
                        ' Design and distribute surveys with a few clicks - create from scratch, use a template, or upload an existing Excel file. Review and export survey data readily available as responses are collected.',
                        style: TextStyle(
                          height: 1.8,
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 12,
                          fontFamily: 'openSans',
                          letterSpacing: 1.2,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    SizedBox(
                      height: 15,
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
