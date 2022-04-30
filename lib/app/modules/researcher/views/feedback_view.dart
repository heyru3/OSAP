import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:osap/app/modules/researcher/controllers/researcher_controller.dart';

import '../../../data/widget/header.dart';

class FeedbackView extends GetView {
  @override
  ResearcherController controller = Get.put(ResearcherController());
  @override
  Widget build(BuildContext context) {
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
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 100,
              child: HeaderWidget(100, false, Icons.house_rounded),
            ),
            Container(
              margin: EdgeInsets.all(30),
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 8.0, bottom: 4.0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Give your feedback',
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                        fontSize: 24,
                        fontFamily: 'openSans',
                        letterSpacing: 2,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white54,
                            border: Border(
                              top: BorderSide(width: 1, color: Colors.grey),
                              left: BorderSide(width: 1, color: Colors.grey),
                              bottom: BorderSide(width: 1, color: Colors.grey),
                              right: BorderSide(width: 1, color: Colors.grey),
                            ),
                          ),
                          width: MediaQuery.of(context).size.width * 2.6 / 3,
                          height: 300,
                          child: TextField(
                            controller: controller.feedbackTextController,
                            maxLines: 10,
                            cursorHeight: 0.5,
                            cursorColor: Theme.of(context).primaryColor,
                            style: TextStyle(
                              color: Colors.black54,
                              fontFamily: 'openSans',
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.5,
                              height: 2,
                            ),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(8),
                              fillColor: Colors.white,
                              focusColor: Colors.white,
                              hoverColor: Colors.white,
                              border: InputBorder.none,
                              hintText:
                                  'Please give detail description of feedback',
                            ),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Theme.of(context).primaryColor),
                          ),
                          onPressed: () {
                            //Todo:submit to database
                          },
                          child: Text(
                            'Submit',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: 'openSans'),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
