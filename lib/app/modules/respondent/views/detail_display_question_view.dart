import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:osap/app/modules/respondent/controllers/reshome_controller.dart';
import 'package:osap/app/modules/respondent/controllers/detail_display_question_controller.dart';

class DetailDisplayQuestionView extends GetView<ReshomeController> {
  @override
  Widget build(BuildContext context) {
    //print(Get.arguments);
    return Scaffold(
        appBar: AppBar(
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
          title: Text('DetailDisplayQuestionView'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Container(
              //   height: 150,
              //   child: HeaderWidget(150, false, Icons.house_rounded),
              // ),

              // Container(
              //   margin: EdgeInsets.fromLTRB(5, 0, 10, 0),
              //   padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              //   child: SafeArea(
              //       child: Container(
              //     width: MediaQuery.of(context).size.width,
              //     decoration:
              //         BoxDecoration(color: Color.fromARGB(255, 147, 61, 164)),
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Text(
              //             "title:"
              //             '${Get.arguments['data']['title']}',
              //             style: TextStyle(fontSize: 30, color: Colors.white),
              //             textAlign: TextAlign.center),
              //         Text(
              //           "description:"
              //           '${Get.arguments['data']['description']}',
              //           style: TextStyle(fontSize: 20),
              //         ),
              //       ],
              //     ),
              //   )),
              // ),
              // Divider(
              //   height: 20,
              //   color: Colors.red,
              // ),
              // Container(
              //   height: MediaQuery.of(context).size.height,
              //   child: ListView.builder(
              //       itemCount: Get.arguments['data']['sections'].length,
              //       itemBuilder: (context, index) {
              //         return Column(
              //           children: [
              //             Container(
              //               width: MediaQuery.of(context).size.width,

              //               child: Text("Section"
              //                   '${[index + 1].toString()}'
              //                   ":"
              //                   '${Get.arguments['data']['sections'][index]['description'].toString()}'),
              //             ),
              //             Text(Get.arguments['data']['sections'][index]['title']
              //                 .toString()),
              //             Container(
              //                 height: MediaQuery.of(context).size.height,
              //                 child: ListView.builder(
              //                     itemCount: Get
              //                         .arguments['data']['sections'][index]
              //                             ['questionnaires']
              //                         .length,
              //                     itemBuilder: (context, index2) {

              //                       String typenName = Get.arguments['data']
              //                               ['sections'][index]['questionnaires']
              //                               [index2]['questionnaire_type']
              //                               ['type_name']
              //                           .toString();

              //                       if (typenName == 'Multiple choice') {
              //                         return Column(
              //                           children: [
              //                             Text(Get.arguments['data']['sections']
              //                                     [index]['questionnaires']
              //                                     [index2]['title']
              //                                 .toString()),
              //                             Container(
              //                               height: 100,

              //                               child: Center(
              //                                   child: ListView.builder(
              //                                       itemCount: Get
              //                                           .arguments['data']
              //                                               ['sections'][index]
              //                                               ['questionnaires']
              //                                               [index2]['choices']
              //                                           .length,
              //                                       itemBuilder:
              //                                           (context, index3) {
              //                                         return GestureDetector(

              //                                           child:Container(
              //                                              margin: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
              //                               padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
              //                               width: double.infinity,
              //                                                                         decoration: BoxDecoration(color: Colors.white,borderRadius:BorderRadius.circular(100) , border: Border.all(color:Colors.red,width: 4.0),),

              //                                          child: Text("Multiple choice")));
              //                                       })),
              //                             ),
              //                           ],
              //                         );
              //                       } else if (typenName == 'Drop down') {
              //                         return Center(
              //                             child: Text("Drop down"));
              //                       } else if (typenName == 'Check box') {
              //                         return Center(
              //                             child: Column(
              //                           children: [
              //                             Text(Get.arguments['data']['sections']
              //                                 [index]['questionnaires'][index2]),
              //                             Text("Check box"),
              //                           ],
              //                         ));
              //                       } else if (typenName == 'Integer') {
              //                         return Center(child: Text("Integer"));
              //                       } else if (typenName == 'Decimal') {
              //                         return Center(child: Text("Decimal"));
              //                       } else if (typenName == 'Date') {
              //                         return Center(child: Text("Date"));
              //                       } else if (typenName == 'Time') {
              //                         return Center(child: Text("Time"));
              //                       } else if (typenName == 'Short answer') {
              //                         return Center(child: Text("Short answer"));
              //                       } else if (typenName == 'Paragraph') {
              //                         return Center(child: Text("Paragraph"));
              //                       }

              //                       return Container(
              //                         child: Text("data"),
              //                       );

              //                     }))
              //           ],
              //         );
              //       }),
              // ),

              // Container(
              //   margin: EdgeInsets.fromLTRB(5, 0, 10, 0),
              //   padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              //   width: MediaQuery.of(context).size.width,
              //   height: 200,
              //   decoration:
              //       BoxDecoration(color: Color.fromARGB(255, 147, 61, 164)),
              //   child: SingleChildScrollView(
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Text(
              //             "title:"
              //             '${Get.arguments['data']['title']}',
              //             style: TextStyle(fontSize: 30, color: Colors.white),
              //             textAlign: TextAlign.center),
              //         Text(
              //           "description:"
              //           '${Get.arguments['data']['description']}',
              //           style: TextStyle(fontSize: 20),

              //         ),
              //       ],
              //     ),
              //   ),
              // ),

              ListView.builder(
                  shrinkWrap: true,
                  itemCount: Get.arguments['data']['sections'].length,
                  itemBuilder: (context, index) {
                    return Column(children: [
                      Card(
                        color: Color.fromARGB(255, 209, 12, 196),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Text(
                                  "Section"
                                  '${[index + 1].toString()}',
                                  style: TextStyle(
                                      fontSize: 30, color: Colors.white),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Text(
                                  '${Get.arguments['data']['sections'][index]['title'].toString()}'
                                  "hhhhhhhhh",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color:
                                          Color.fromARGB(255, 235, 228, 228)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Text(Get.arguments['data']['sections']
                                        [index]['description']
                                    .toString()),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                          color: Colors.white,
                          child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: Get
                                            .arguments['data']['sections']
                                                [index]['questionnaires']
                                            .length,
                                        itemBuilder: (context, index2) {
                                          String typenName = Get
                                              .arguments['data']['sections']
                                                  [index]['questionnaires']
                                                  [index2]['questionnaire_type']
                                                  ['type_name']
                                              .toString();
                                          String question =
                                              '${index2 + 1}) ${Get.arguments['data']['sections'][index]['questionnaires'][index2]['title'].toString()}';
                                          if (typenName == 'Multiple choice') {
                                            return Column(children: [
                                              Card(
                                                  color: Colors.white,
                                                  child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        15.0),
                                                                child: Text(
                                                                    question)),
                                                            ListView.builder(
                                                                shrinkWrap:
                                                                    true,
                                                                itemCount: Get
                                                                    .arguments[
                                                                        'data'][
                                                                        'sections']
                                                                        [index][
                                                                        'questionnaires']
                                                                        [index2]
                                                                        [
                                                                        'choices']
                                                                    .length,
                                                                itemBuilder:
                                                                    (context,
                                                                        index3) {
                                                                  return GestureDetector(
                                                                      child: Container(
                                                                          margin: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
                                                                          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
                                                                          width: double.infinity,
                                                                          decoration: BoxDecoration(
                                                                            color:
                                                                                Colors.white,
                                                                            borderRadius:
                                                                                BorderRadius.circular(50),
                                                                            border:
                                                                                Border.all(color: Color.fromARGB(255, 156, 121, 119), width: 2.0),
                                                                          ),
                                                                          child: Text(Get.arguments['data']['sections'][index]['questionnaires'][index2]['choices'][index3]['name'].toString())));
                                                                })
                                                          ])))
                                            ]);
                                          } else if (typenName == 'Drop down') {
                                            return Column(children: [
                                              Card(
                                                  color: Colors.white,
                                                  child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .all(
                                                                      15.0),
                                                              child: Text(
                                                                  question),
                                                            ),
                                                            ListView.builder(
                                                                shrinkWrap:
                                                                    true,
                                                                itemCount: 1,
                                                                itemBuilder:
                                                                    (context,
                                                                        index3) {
                                                                  // controller.value.value=Get
                                                                  // .arguments['data']
                                                                  //     ['sections']
                                                                  //     [index]
                                                                  //     ['questionnaires']
                                                                  //     [index2]
                                                                  //     ['choices'][index3]['name'];
                                                                  return DropdownButton<
                                                                          String>(
                                                                      isExpanded:
                                                                          true,
                                                                      value: Get.arguments['data']['sections'][index]['questionnaires'][index2]['choices']
                                                                              [index3]
                                                                          [
                                                                          'name'],
                                                                      items: Get
                                                                          .arguments['data']
                                                                              ['sections']
                                                                              [index]
                                                                              ['questionnaires']
                                                                              [index2]
                                                                              ['choices']
                                                                          .map<DropdownMenuItem<String>>((value) {
                                                                        return DropdownMenuItem<
                                                                            String>(
                                                                          child:
                                                                              Text(value['name']),
                                                                          value:
                                                                              value['name'],
                                                                        );
                                                                      }).toList(),
                                                                      onChanged: (value) {
                                                                        controller
                                                                            .value
                                                                            .value = value!;
                                                                        print(
                                                                            value);
                                                                      });
                                                                  //
                                                                  // DropDownMultiSelect(
                                                                  //   whenEmpty: "Select State Management Library",
                                                                  //   onChanged:
                                                                  //       (Value) {
                                                                  //     controller
                                                                  //         .selectedoptionList
                                                                  //         .value = Value;
                                                                  //     controller
                                                                  //         .selectedOption
                                                                  //         .value = "";
                                                                  //   },
                                                                  //   selectedValues: [],
                                                                  //   options: ['astu','aastu'],

                                                                  // );
                                                                })
                                                          ])))
                                            ]);
                                          } else if (typenName == 'Check box') {
                                            return Column(children: [
                                              Card(
                                                  color: Colors.white,
                                                  child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .all(
                                                                      15.0),
                                                              child: Text(
                                                                  question),
                                                            )
                                                          ])))
                                            ]);
                                          } else if (typenName == 'Integer') {
                                            return Column(children: [
                                              Card(
                                                  color: Colors.white,
                                                  child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        15.0),
                                                                child: Text(
                                                                    question)),
                                                            Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        15.0),
                                                                child: Form(
                                                                  key: controller
                                                                      .integerKey,
                                                                  child:
                                                                      TextFormField(
                                                                    autovalidateMode:
                                                                        AutovalidateMode
                                                                            .onUserInteraction,
                                                                    controller:
                                                                        controller
                                                                            .integerController,
                                                                    decoration:
                                                                        InputDecoration(
                                                                            border:
                                                                                OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(10),
                                                                            ),
                                                                            labelText:
                                                                                "write integer number"),
                                                                    onSaved:
                                                                        (value) {
                                                                      controller
                                                                              .shortAnswer =
                                                                          value!;
                                                                    },
                                                                    validator:
                                                                        (value) {
                                                                      return controller
                                                                          .validateInteger(
                                                                              value!);
                                                                    },
                                                                    keyboardType:
                                                                        TextInputType
                                                                            .emailAddress,
                                                                  ),
                                                                )),
                                                          ])))
                                            ]);
                                          } else if (typenName == 'Decimal') {
                                            return Column(children: [
                                              Card(
                                                  color: Colors.white,
                                                  child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .all(
                                                                      15.0),
                                                              child: Text(
                                                                  question),
                                                            ),
                                                            Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        15.0),
                                                                child: Form(
                                                                  key: controller
                                                                      .decimalKey,
                                                                  child:
                                                                      TextFormField(
                                                                    autovalidateMode:
                                                                        AutovalidateMode
                                                                            .onUserInteraction,
                                                                    controller:
                                                                        controller
                                                                            .decimalController,
                                                                    decoration:
                                                                        InputDecoration(
                                                                            border:
                                                                                OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(10),
                                                                            ),
                                                                            labelText:
                                                                                "write  decimal  number"),
                                                                    onSaved:
                                                                        (value) {
                                                                      controller
                                                                              .shortAnswer =
                                                                          value!;
                                                                    },
                                                                    validator:
                                                                        (value) {
                                                                      return controller
                                                                          .validatedDecimal(
                                                                              value!);
                                                                    },
                                                                    keyboardType:
                                                                        TextInputType
                                                                            .emailAddress,
                                                                  ),
                                                                )),
                                                          ])))
                                            ]);
                                          } else if (typenName == 'Date') {
                                            return Column(children: [
                                              Card(
                                                  color: Colors.white,
                                                  child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .all(
                                                                      15.0),
                                                              child: Text(
                                                                  question),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .all(
                                                                      15.0),
                                                              child: Container(
                                                                padding:
                                                                    EdgeInsets
                                                                        .fromLTRB(
                                                                            10,
                                                                            10,
                                                                            20,
                                                                            10),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  border: Border
                                                                      .all(
                                                                    color: Colors
                                                                        .grey,
                                                                  ),
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                        color: Colors
                                                                            .black26,
                                                                        offset: Offset(
                                                                            0,
                                                                            4),
                                                                        blurRadius:
                                                                            5.0)
                                                                  ],
                                                                  gradient:
                                                                      LinearGradient(
                                                                    begin: Alignment
                                                                        .topLeft,
                                                                    end: Alignment
                                                                        .bottomRight,
                                                                    stops: [
                                                                      0.0,
                                                                      1.0
                                                                    ],
                                                                    colors: [
                                                                      Colors
                                                                          .white,
                                                                      Colors
                                                                          .white
                                                                    ],
                                                                  ),
                                                                  color: Colors
                                                                      .deepPurple
                                                                      .shade300,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              30),
                                                                ),
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Row(
                                                                      children: [
                                                                        Icon(
                                                                          Icons
                                                                              .bedroom_baby_outlined,
                                                                          color:
                                                                              Colors.grey,
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              10,
                                                                        ),
                                                                        Text(
                                                                          ' Date',
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                Colors.grey,
                                                                            fontFamily:
                                                                                'openSans',
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    GestureDetector(
                                                                      onTap:
                                                                          () async {
                                                                        controller
                                                                            .birthDate
                                                                            .value = await controller.chooseDateRangePicerforform();
                                                                        print(controller
                                                                            .birthDate
                                                                            .value);
                                                                      },
                                                                      child:
                                                                          Icon(
                                                                        FontAwesomeIcons
                                                                            .calendar,
                                                                        color: Colors
                                                                            .grey,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ])))
                                            ]);
                                          } else if (typenName == 'Time') {
                                            return Column(children: [
                                              Card(
                                                  color: Colors.white,
                                                  child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .all(
                                                                      15.0),
                                                              child: Text(
                                                                  question),
                                                            ),
                                                            Obx(() => Text(
                                                                '${controller.selectedTime.value.hour} : ${controller.selectedTime.value.minute}')),
                                                            ElevatedButton(
                                                                onPressed: () {
                                                                  controller
                                                                      .chooseTime();
                                                                },
                                                                child:Icon(Icons.watch)
                                                                
                                                                //  Text(
                                                                //     "select time")
                                                                )
                                                          ])))
                                            ]);
                                          } else if (typenName ==
                                              'Short answer') {
                                            return Column(children: [
                                              Card(
                                                  color: Colors.white,
                                                  child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .all(
                                                                      15.0),
                                                              child: Text(
                                                                  question),
                                                            ),
                                                            Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        15.0),
                                                                child: Form(
                                                                  key: controller
                                                                      .shortandlong,
                                                                  child:
                                                                      TextFormField(
                                                                    autovalidateMode:
                                                                        AutovalidateMode
                                                                            .onUserInteraction,
                                                                    controller:
                                                                        controller
                                                                            .shortAnswerController,
                                                                    decoration:
                                                                        InputDecoration(
                                                                            border:
                                                                                OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(10),
                                                                            ),
                                                                            labelText:
                                                                                "write your answer"),
                                                                    onSaved:
                                                                        (value) {
                                                                      controller
                                                                              .shortAnswer =
                                                                          value!;
                                                                    },
                                                                    validator:
                                                                        (value) {
                                                                      return controller
                                                                          .validateShortAnswer(
                                                                              value!);
                                                                    },
                                                                    keyboardType:
                                                                        TextInputType
                                                                            .emailAddress,
                                                                  ),
                                                                )),
                                                          ])))
                                            ]);
                                          } else if (typenName == 'Paragraph') {
                                            return Column(children: [
                                              Card(
                                                  color: Colors.white,
                                                  child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .all(
                                                                      15.0),
                                                              child: Text(
                                                                  question),
                                                            ),
                                                            Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        15.0),
                                                                child:
                                                                    TextFormField(
                                                                  maxLines: 5,
                                                                  decoration:
                                                                      InputDecoration(
                                                                          border:
                                                                              OutlineInputBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(10),
                                                                          ),
                                                                          labelText:
                                                                              "write your answer"),
                                                                )),
                                                          ])))
                                            ]);
                                          }

                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20.0),
                                            child: Text(
                                              "Section",
                                              style: TextStyle(),
                                            ),
                                          );
                                        })
                                  ])))
                    ]);
                  }),

              Container(
                child: Text(
                  "expired_date"
                  '${Get.arguments['data']['expired_date']}',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Divider(
                height: 20,
                color: Colors.red,
              ),
            ],
          ),
        ));
  }
}
