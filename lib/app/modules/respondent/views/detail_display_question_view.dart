// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:osap/app/modules/respondent/bindings/respondent_binding.dart';
import 'package:osap/app/modules/respondent/controllers/reshome_controller.dart';
import 'package:osap/app/modules/respondent/function/survey.dart';
import 'package:osap/app/modules/respondent/views/reshome_view.dart';

import 'respondent_view.dart';

class DetailDisplayQuestionView extends GetView<ReshomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                controller.questionnairyCollection.clear();
                Get.back();
              }),
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
          title: Text('Detail Display Question'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: Get.arguments['data']['sections'].length,
                  itemBuilder: (context, index) {
                    controller.numberOfQuestionnairy.value = Get
                        .arguments['data']['sections'][index]['questionnaires']
                        .length as int;
                    controller.numberOfQuestionInSection[index + 1] =
                        controller.numberOfQuestionnairy.value;
                    return Column(children: [
                      // section appbar
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
                                  "Section "
                                  '${(index + 1).toString()}',
                                  style: TextStyle(
                                      fontSize: 30, color: Colors.white),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Text(
                                  '${Get.arguments['data']['sections'][index]['title'].toString()}'
                                  "",
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
                                    // Each question
                                    ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: Get
                                            .arguments['data']['sections']
                                                [index]['questionnaires']
                                            .length,
                                        itemBuilder: (context, index2) {
                                          int id = Get.arguments['data']
                                                  ['sections'][index]
                                              ['questionnaires'][index2]['id'];
                                          onQuestionnairyUpdate(
                                              index, id, index2);
                                          // question_type
                                          String typenName =
                                              getQuestionniryType(
                                                  index, index2);

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
                                                                  int questionId =
                                                                      Get.arguments['data']['sections']
                                                                              [
                                                                              index]['questionnaires'][index2]
                                                                          [
                                                                          'id'];

                                                                  return GestureDetector(
                                                                      child:
                                                                          Obx(
                                                                    () =>
                                                                        RadioListTile(
                                                                      selectedTileColor:
                                                                          Colors
                                                                              .green,
                                                                      value: Get
                                                                          .arguments[
                                                                              'data']
                                                                              [
                                                                              'sections']
                                                                              [
                                                                              index]
                                                                              [
                                                                              'questionnaires']
                                                                              [
                                                                              index2]
                                                                              [
                                                                              'choices']
                                                                              [
                                                                              index3]
                                                                              [
                                                                              'name']
                                                                          .toString(),
                                                                      groupValue:
                                                                          controller
                                                                              .choice[questionId],
                                                                      onChanged:
                                                                          (value) {
                                                                        controller.choice[questionId] =
                                                                            value.toString();

                                                                        var a = Get
                                                                            .arguments['data']['sections'][index]['questionnaires'][index2]['choices']
                                                                            .map((map) {
                                                                          if (map['name'] ==
                                                                              value.toString()) {
                                                                            return map['id'];
                                                                          }
                                                                        });
                                                                        for (var x
                                                                            in a) {
                                                                          if (x !=
                                                                              null) {
                                                                            controller.multipleChoiceId =
                                                                                x;
                                                                          }
                                                                        }

                                                                        onChoiceUpdate(
                                                                            controller.multipleChoiceId,
                                                                            questionId,
                                                                            value.toString());
                                                                      },
                                                                      title:
                                                                          Text(
                                                                        Get.arguments['data']['sections'][index]['questionnaires'][index2]['choices'][index3]['name']
                                                                            .toString(),
                                                                      ),
                                                                    ),
                                                                  ));
                                                                })
                                                        ,
 
                                                                        
                                                                        
                                                            Visibility(
                                                              visible: Get.arguments['data']['sections'][index]['questionnaires'][index2]
                                                                            [
                                                                            'is_required'],
                                                              child: Padding(
                                                                padding: const EdgeInsets.all(8.0),
                                                                child: Text("${controller.errorhandler}",style: TextStyle(color: Colors.red,fontSize: 12),),
                                                              ),
                                                            )
                                                        
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
                                                            Container(
                                                                child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Padding(
                                                                    padding: EdgeInsets
                                                                        .only(
                                                                            left:
                                                                                10),
                                                                    child: Text(
                                                                        "element")),
                                                                DropdownButton(
                                                                    value: Get.arguments['data']['sections'][index]['questionnaires'][index2]
                                                                            ['choices'][0]
                                                                        [
                                                                        'name'],
                                                                    items: Get
                                                                        .arguments['data']
                                                                            ['sections']
                                                                            [index]
                                                                            ['questionnaires']
                                                                            [index2]
                                                                            ['choices']
                                                                        .map<DropdownMenuItem<String>>((map) {
                                                                      controller
                                                                          .dropdownChoiceId
                                                                          .value = map['id'];
                                                                      return DropdownMenuItem<
                                                                          String>(
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              MediaQuery.of(context).size.width * 0.5,
                                                                          child:
                                                                              Text(
                                                                            map["name"],
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                          ),
                                                                        ),
                                                                        value: map[
                                                                            "name"],
                                                                      );
                                                                    }).toList(),
                                                                    onChanged: (value) {
                                                                      int questionId =
                                                                          Get.arguments['data']['sections'][index]['questionnaires'][index2]
                                                                              [
                                                                              'id'];
                                                                      onDropdownUpdate(
                                                                          controller
                                                                              .dropdownChoiceId
                                                                              .value,
                                                                          questionId,
                                                                          value);
                                                                    }),
                                                              ],
                                                            ))
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
                                                            ),
                                                            MultiSelectDialogField(
                                                              autovalidateMode:
                                                                  AutovalidateMode
                                                                      .always,
                                                              items: Get
                                                                  .arguments['data']
                                                                      ['sections']
                                                                      [index]
                                                                      ['questionnaires']
                                                                      [index2][
                                                                      'choices']
                                                                  .map<MultiSelectItem>(
                                                                      (map) =>
                                                                          MultiSelectItem(
                                                                              {
                                                                                "id": map["id"],
                                                                                "name": map["name"]
                                                                              },
                                                                              map["name"]))
                                                                  .toList(),
                                                              validator:
                                                                  (value) {
                                                                int max = Get.arguments['data']['sections']
                                                                            [
                                                                            index]
                                                                        [
                                                                        'questionnaires'][index2]
                                                                    [
                                                                    'maximum_choice'];

                                                                // ignore: unused_local_variable
                                                                bool required = Get.arguments['data']['sections']
                                                                            [
                                                                            index]
                                                                        [
                                                                        'questionnaires'][index2]
                                                                    [
                                                                    'is_required'];

                                                                // return  controller
                                                                //       .validateCheckBox(
                                                                //           max,
                                                                //           value!.length,
                                                                //           required);
                                                                var condition = value
                                                                    ?.isEmpty ?? true;
                                                                if (required =
                                                                    false) {
                                                                  if (max.isLowerThan(
                                                                      value?.length ??
                                                                          0)) {
                                                                    return 'chose at most $max';
                                                                  } else {
                                                                    return null;
                                                                  }
                                                                } else {
                                                                  if (max.isLowerThan(
                                                                      value?.length ??
                                                                          0)) {
                                                                    return 'chose at most $max';
                                                                  } else if (!max.isLowerThan(
                                                                          value?.length ??
                                                                              0) &&
                                                                      !condition) {
                                                                    return null;
                                                                  }
                                                                  return "required";
                                                                }
                                                              },
                                                              onConfirm:
                                                                  (value) {
                                                                controller
                                                                    .choiceList
                                                                    .value = value;
                                                                int questionId =
                                                                    Get.arguments['data']['sections'][index]
                                                                            [
                                                                            'questionnaires']
                                                                        [
                                                                        index2]['id'];
                                                                onCheackBoxUpdate(
                                                                    questionId,
                                                                    value);
                                                              },
                                                              buttonText: Text(
                                                                  "select your choicer"),
                                                              listType:
                                                                  MultiSelectListType
                                                                      .LIST,
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
                                                                child:
                                                                    TextFormField(
                                                                  autovalidateMode:
                                                                      AutovalidateMode
                                                                          .always,
                                                                  decoration:
                                                                      InputDecoration(
                                                                          border:
                                                                              OutlineInputBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(10),
                                                                          ),
                                                                          labelText:
                                                                              "write integer number"),
                                                                  onChanged:
                                                                      (value) {
                                                                    var min = Get.arguments['data']['sections'][index]['questionnaires']
                                                                            [
                                                                            index2]
                                                                        [
                                                                        'minimum_integer_value'];
                                                                    var max = Get.arguments['data']['sections'][index]['questionnaires']
                                                                            [
                                                                            index2]
                                                                        [
                                                                        'maximum_integer_value'];
                                                                    int questionId =
                                                                        Get.arguments['data']['sections'][index]['questionnaires'][index2]
                                                                            [
                                                                            'id'];
                                                                    onIntigerUpdate(
                                                                        questionId,
                                                                        value,
                                                                        min,
                                                                        max);
                                                                  },
                                                                  validator:
                                                                      (value) {
                                                                    var min = Get.arguments['data']['sections'][index]['questionnaires']
                                                                            [
                                                                            index2]
                                                                        [
                                                                        'minimum_integer_value'];
                                                                    var max = Get.arguments['data']['sections'][index]['questionnaires']
                                                                            [
                                                                            index2]
                                                                        [
                                                                        'maximum_integer_value'];

                                                                    bool
                                                                        required =
                                                                        Get.arguments['data']['sections'][index]['questionnaires'][index2]
                                                                            [
                                                                            'is_required'];

                                                                    return controller
                                                                        .validateInteger(
                                                                            min,
                                                                            max,
                                                                            value!,
                                                                            required);
                                                                  },
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .number,
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
                                                                child: TextFormField(
                                                                    autovalidateMode: AutovalidateMode.always,
                                                                    decoration: InputDecoration(
                                                                        border: OutlineInputBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(10),
                                                                        ),
                                                                        labelText: "write  decimal  number"),
                                                                    onChanged: (value) {
                                                                      var min = Get.arguments['data']['sections'][index]['questionnaires']
                                                                              [
                                                                              index2]
                                                                          [
                                                                          'minimum_decimal_value'];
                                                                      var max = Get.arguments['data']['sections'][index]['questionnaires']
                                                                              [
                                                                              index2]
                                                                          [
                                                                          'maximum_decimal_value'];
                                                                      int questionId =
                                                                          Get.arguments['data']['sections'][index]['questionnaires'][index2]
                                                                              [
                                                                              'id'];

                                                                      onDecimalUpdate(
                                                                          questionId,
                                                                          value,
                                                                          min,
                                                                          max);
                                                                    },
                                                                    validator: (value) {
                                                                      var min = Get.arguments['data']['sections'][index]['questionnaires']
                                                                              [
                                                                              index2]
                                                                          [
                                                                          'minimum_decimal_value'];
                                                                      var max = Get.arguments['data']['sections'][index]['questionnaires']
                                                                              [
                                                                              index2]
                                                                          [
                                                                          'maximum_decimal_value'];
                                                                      bool
                                                                          required =
                                                                          Get.arguments['data']['sections'][index]['questionnaires'][index2]
                                                                              [
                                                                              'is_required'];
                                                                      return controller.validatedDecimal(
                                                                          min,
                                                                          max,
                                                                          value!,
                                                                          required);
                                                                    },
                                                                    keyboardType: TextInputType.number)),
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
                                                                        SizedBox(
                                                                          width:
                                                                              10,
                                                                        ),
                                                                        Obx(() {
                                                                          int questionId =
                                                                              Get.arguments['data']['sections'][index]['questionnaires'][index2]['id'];
                                                                          return controller.selectedDate[questionId] == null
                                                                              ? Text('Date', style: TextStyle(color: Colors.grey, fontSize: 7))
                                                                              : Text(controller.dateFormat.format(controller.selectedDate[questionId]));
                                                                        })
                                                                      ],
                                                                    ),
                                                                    GestureDetector(
                                                                      onTap:
                                                                          () async {
                                                                        int questionId =
                                                                            Get.arguments['data']['sections'][index]['questionnaires'][index2]['id'];
                                                                        await controller
                                                                            .chooseDateRangePicerforform(questionId);
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
                                                            Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        15.0),
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    //'${controller.selectedTime[id].hour} : ${controller.selectedTime[id].minute}'
                                                                    Column(
                                                                      children: [
                                                                        Obx(() {
                                                                          int questionId =
                                                                              Get.arguments['data']['sections'][index]['questionnaires'][index2]['id'];
                                                                          return controller.selectedTime[questionId] == null
                                                                              ? Text('Time', style: TextStyle(color: Colors.grey, fontSize: 7))
                                                                              : Text('${controller.selectedTime[questionId]}');
                                                                        })
                                                                      ],
                                                                    ),

                                                                    IconButton(
                                                                        onPressed:
                                                                            () {
                                                                          var id =
                                                                              Get.arguments['data']['sections'][index]['questionnaires'][index2]['id'];
                                                                          controller
                                                                              .chooseTime(id);
                                                                        },
                                                                        icon: Icon(
                                                                            Icons.watch))
                                                                  ],

                                                                  //  Text(
                                                                  //     "select time")
                                                                ))
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
                                                                child:
                                                                    TextFormField(
                                                                  autovalidateMode:
                                                                      AutovalidateMode
                                                                          .always,
                                                                  decoration:
                                                                      InputDecoration(
                                                                          border:
                                                                              OutlineInputBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(10),
                                                                          ),
                                                                          labelText:
                                                                              "write your answer"),
                                                                  onChanged:
                                                                      (value) {
                                                                    onShortUpdate(
                                                                        Get.arguments['data']['sections'][index]['questionnaires'][index2]
                                                                            [
                                                                            'id'],
                                                                        value);

                                                                    controller
                                                                            .shortAnswer =
                                                                        value;
                                                                  },
                                                                  validator:
                                                                      (value) {
                                                                    bool
                                                                        required =
                                                                        Get.arguments['data']['sections'][index]['questionnaires'][index2]
                                                                            [
                                                                            'is_required'];
                                                                    return controller
                                                                        .validatedShortAnswer(
                                                                            value!,
                                                                            required);
                                                                  },
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .emailAddress,
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
                                                                  autovalidateMode:
                                                                      AutovalidateMode
                                                                          .always,
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
                                                                  onChanged:
                                                                      (value) {
                                                                    onShortUpdate(
                                                                        Get.arguments['data']['sections'][index]['questionnaires'][index2]
                                                                            [
                                                                            'id'],
                                                                        value);
                                                                  },
                                                                  validator:
                                                                      (value) {
                                                                    bool
                                                                        required =
                                                                        Get.arguments['data']['sections'][index]['questionnaires'][index2]
                                                                            [
                                                                            'is_required'];
                                                                    return controller
                                                                        .validatedLongAnswer(
                                                                            value!,
                                                                            required);
                                                                  },
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
              ElevatedButton(
                  onPressed: () async {
                    var surveyId = Get.arguments['data']['id'];
                    var sectionCount = Get.arguments['data']['sections'].length;
                    var a = getSurvey(surveyId, sectionCount);
                    await controller
                        .postFill(Get.arguments['token'], a)
                        .then((value) {
                      if (value == "success") {
                        Get.offAll(RespondentView(),
                            binding: RespondentBinding(),
                            arguments: [true, Get.arguments['token']]);
                      } else if (value == "connectionError") {
                        Get.defaultDialog(
                          title: 'connection error',
                          titleStyle: TextStyle(
                            fontSize: 16,
                            fontFamily: 'openSans',
                            letterSpacing: 2,
                            color: Color.fromARGB(255, 233, 101, 91),
                          ),
                          content: Column(
                            children: [
                              Divider(
                                thickness: 1.5,
                                color: Colors.grey,
                              ),
                              Text(
                                'conn error',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'openSans',
                                  letterSpacing: 1.5,
                                  color: Color.fromARGB(255, 243, 96, 85),
                                ),
                              ),
                            ],
                          ),
                        );
                      } else {
                        Get.defaultDialog(
                          title: 'failed to submit',
                          titleStyle: TextStyle(
                            fontSize: 16,
                            fontFamily: 'openSans',
                            letterSpacing: 2,
                            color: Color.fromARGB(255, 233, 101, 91),
                          ),
                          content: Column(
                            children: [
                              Divider(
                                thickness: 1.5,
                                color: Colors.grey,
                              ),
                              Text(
                                'plese fill all required value or valid fill',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'openSans',
                                  letterSpacing: 1.5,
                                  color: Color.fromARGB(255, 243, 96, 85),
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                    });
                  },
                  child: Text("Submit", style: TextStyle(color: Colors.black)),
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.red),
                  )),
              Divider(
                height: 20,
                color: Colors.red,
              ),
            ],
          ),
        ));
  }

  onChoiceUpdate(int choiceId, int id, var value) {
    controller.choiceCollection[id] = {"id": choiceId, "name": value};
  }

  onDropdownUpdate(int choiceId, int id, var value) {
    controller.dropdownCollection[id] = {"id": choiceId, "name": value};
  }

  getQuestionniryType(int sectionId, int questionId) {
    return Get.arguments['data']['sections'][sectionId]['questionnaires']
            [questionId]['questionnaire_type']['type_name']
        .toString();
  }

  onShortUpdate(id, value) {
    int oldId = -1;
    for (var map in controller.shortAnswerCollection) {
      if (map.containsKey(id)) {
        oldId = id;
        break;
      }
    }
    if (-1 != oldId) {
      controller.shortAnswerCollection.removeWhere((element) {
        return element.containsKey(id);
      });
    }
    controller.shortAnswerCollection.add({id: value});
  }

  onIntigerUpdate(int id, String value, int min, int max) {
    int oldId = -1;
    for (var map in controller.intigerAnswerCollection) {
      if (map.containsKey(id)) {
        oldId = id;
        break;
      }
    }
    if (-1 != oldId) {
      controller.intigerAnswerCollection.removeWhere((element) {
        return element.containsKey(id);
      });
    }
    if (value.isNumericOnly) {
      if (int.parse(value).isLowerThan(max) &&
          int.parse(value).isGreaterThan(min)) {
        controller.intigerAnswerCollection.add({id: value});
      }
    }
  }

  onDecimalUpdate(id, String value, var min, var max) {
    int oldId = -1;
    for (var map in controller.decimalAnswerCollection) {
      if (map.containsKey(id)) {
        oldId = id;
        break;
      }
    }
    if (-1 != oldId) {
      controller.decimalAnswerCollection.removeWhere((element) {
        return element.containsKey(id);
      });
    }
    if (value.isNumericOnly) {
      if (num.parse(value).isLowerThan(max ?? num.parse(value) + 1) &&
          num.parse(value).isGreaterThan(min ?? num.parse(value) - 1)) {
        controller.decimalAnswerCollection.add({id: value});
      }
    }
  }

  onQuestionnairyUpdate(int index, int id, int index2) {
    //
    controller.questionnairyCollection.add({
      index + 1: {index2 + 1: id}
    }.obs);
  }

  onCheackBoxUpdate(int id, List value) {
    if (value.isEmpty && controller.selectedChoice.containsKey(id)) {
      controller.selectedChoice.removeWhere((key, value) => key == id);
    } else {
      controller.selectedChoice[id] = value;
    }
  }
}
