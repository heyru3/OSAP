import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:osap/app/modules/researcher/controllers/questionery_controller.dart';
import 'package:tap_canvas/tap_canvas.dart';

class QuestioneryView extends GetView<QuestioneryController> {
  @override
  Widget build(BuildContext context) {
    if (controller.devHeight.value <
        MediaQuery.of(context).size.height * 2.3 / 4) {
      controller.containerHeight(context);
    }
    return TapCanvas(
      child: Scaffold(
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
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(height: 15),
              Container(
                width: MediaQuery.of(context).size.width * 2.8 / 3,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  border: Border.all(color: Colors.grey),
                ),
                child: Column(children: [
                  TextField(
                    controller: controller.bigTitleTextController,
                    cursorColor: Colors.grey,
                    decoration: InputDecoration(
                      hintText: 'Title of Survey',
                      hintStyle: TextStyle(
                          fontFamily: 'openSans',
                          fontSize: 12,
                          letterSpacing: 2,
                          fontWeight: FontWeight.w600),
                      focusColor: Colors.grey,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                  TextField(
                    controller: controller.bigDescriptionTextController,
                    cursorColor: Colors.grey,
                    decoration: InputDecoration(
                        focusColor: Colors.grey,
                        focusedBorder: InputBorder.none,
                        border: InputBorder.none,
                        hintText: 'Description of Survey',
                        hintStyle: TextStyle(
                            fontFamily: 'openSans',
                            fontSize: 12,
                            letterSpacing: 2,
                            fontWeight: FontWeight.w600)),
                  ),
                ]),
              ),
              SizedBox(height: 15),
              Obx(
                () => Container(
                  width: MediaQuery.of(context).size.width * 2.8 / 3,
                  height: controller.devHeight.value,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Obx(
                    () => ListView.builder(
                        itemCount: controller.questioneryAmount.value,
                        itemBuilder: (context, int index) {
                          return _questioneryContainer();
                        }),
                  ),
                ),
              ),
              SizedBox(height: 10),
              FloatingActionButton(
                onPressed: () {
                  controller.devHeight.value += 300;
                  controller.questioneryAmount.value++;
                },
                child: Icon(Icons.add),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _questioneryContainer() {
    return TapOutsideDetectorWidget(
      onTappedOutside: () {
        controller.bigBoxVisibility.value = false;
      },
      child: Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.only(top: 10),
        height: 300,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              blurRadius: 6,
              offset: Offset(0, 2),
              color: Colors.black12,
            )
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Container(
                    margin: EdgeInsets.only(left: 5),
                    height: 50,
                    child: TextField(
                      key: controller.eachBoxKey,
                      controller: controller.eachBoxTextController,
                      onTap: () {
                        controller.bigBoxVisibility.value = true;
                      },
                      showCursor: true,
                      cursorColor: Colors.grey,
                      cursorHeight: 25,
                      cursorWidth: 1,
                      maxLines: null,
                      decoration: InputDecoration(
                        hintText: 'Question',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'openSans',
                          letterSpacing: 2,
                        ),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 2),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Obx(() => Visibility(
                          visible: controller.bigBoxVisibility.value,
                          child: IconButton(
                              onPressed: () {},
                              iconSize: 45,
                              icon: Icon(Icons.image_outlined)),
                        ))),
                Expanded(
                  flex: 2,
                  child: Obx(() => Visibility(
                        visible: controller.bigBoxVisibility.value,
                        child: Container(
                          margin: EdgeInsets.only(right: 5),
                          color: Colors.green,
                          height: 50,
                        ),
                      )),
                ),
              ],
            ),
            /*Column(
              children: [],
            ),
            Row(
              children: [],
            ),*/
          ],
        ),
      ),
    );
  }
}
