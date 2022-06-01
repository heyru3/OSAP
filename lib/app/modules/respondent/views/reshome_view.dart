import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:osap/app/data/widget/header.dart';
import 'package:osap/app/modules/respondent/bindings/respondent_binding.dart';
import 'package:osap/app/modules/respondent/controllers/reshome_controller.dart';
import 'package:osap/app/modules/respondent/views/detail_display_question_view.dart';

class ReshomeView extends GetView<ReshomeController> {
  @override
  Widget build(BuildContext context) {
    /// controller.token.value = Get.arguments;

    // controller.onInit;
    return Scaffold(
/////////////////////////////////
      ///import 'package:flutter/material.dart';
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 100,
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
                      'Surveys:',
                      style: TextStyle(
                        color: Colors.blue,
                        letterSpacing: 1.2,
                        fontSize: 30,
                        fontFamily: 'openSans',
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height,
                      child: FutureBuilder(
                        future: controller.getSurvey(Get.arguments),
                        builder: (context, AsyncSnapshot snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          } else if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return ListView.builder(
                                itemCount: snapshot.data.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    padding: EdgeInsets.all(8),
                                    margin: EdgeInsets.only(left: 10, top: 10),
                                    width: MediaQuery.of(context).size.width *
                                        2 /
                                        3,
                                    decoration: BoxDecoration(
                                        color: Colors.white54,
                                        border: Border(
                                            left: BorderSide(
                                                width: 2, color: Colors.blue))),
                                    child: Column(
                                      children: [
                                        Container(
                                          child: Text(
                                            "Title:"
                                            '${snapshot.data[index]['title']}',
                                            style: TextStyle(
                                              height: 1.8,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .secondary,
                                              fontSize: 30,
                                              fontFamily: 'openSans',
                                              letterSpacing: 1.2,
                                            ),
                                            textAlign: TextAlign.start,
                                          ),
                                        ),
                                        Divider(
                                          color:
                                              Color.fromARGB(255, 216, 13, 135),
                                          height: 20,
                                        ),
                                        Container(
                                          child: Text(
                                            "Description:"
                                            '${snapshot.data[index]['description']}',
                                            style: TextStyle(
                                              height: 1.8,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .secondary,
                                              fontSize: 12,
                                              fontFamily: 'openSans',
                                              letterSpacing: 1.2,
                                            ),
                                            textAlign: TextAlign.start,
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                            "Budget:"
                                            '${snapshot.data[index]['budget']}',
                                            style: TextStyle(
                                              height: 1.8,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                              fontSize: 20,
                                              fontFamily: 'openSans',
                                              letterSpacing: 1.2,
                                            ),
                                            textAlign: TextAlign.start,
                                          ),
                                        ),
                                        ElevatedButton(
                                            onPressed: () {
                                              Get.to(
                                                  DetailDisplayQuestionView(),
                                                  binding: RespondentBinding(),
                                                  arguments: {
                                                    'token':Get.arguments,
                                                    'data': snapshot.data[index]}
                                                  );
                                            
                                             
                                            },
                                            child: Text("Apply",
                                                style: TextStyle(
                                                    color: Colors.black)),
                                            style: ButtonStyle(
                                              foregroundColor:
                                                  MaterialStateProperty.all(
                                                      Colors.red),
                                            ))
                                      ],
                                    ),
                                  );
                                 
                                });
                          } else {
                            return Text('error found ');
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    
                    
                 
                   
                    SizedBox(
                      height: 10,
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
