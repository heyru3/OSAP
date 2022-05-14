import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:osap/app/data/widget/header.dart';
import 'package:osap/app/modules/respondent/controllers/reshome_controller.dart';

class ReshomeView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
/////////////////////////////////
      ///import 'package:flutter/material.dart';
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
