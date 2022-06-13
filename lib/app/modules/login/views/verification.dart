// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:osap/app/modules/login/controllers/verification_controller.dart';
import 'package:osap/app/modules/researcher/bindings/researcher_binding.dart';
import 'package:osap/app/modules/researcher/views/researcher_view.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

import '../../../data/common/theme_helper.dart';
import '../../../data/widget/header.dart';

class Verification extends GetView<VerificationController> {
  @override
  Widget build(BuildContext context) {
    double _headerHeight = 300;

    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: _headerHeight,
                child: HeaderWidget(
                    _headerHeight, true, Icons.privacy_tip_outlined),
              ),
              SafeArea(
                child: Container(
                  margin: EdgeInsets.fromLTRB(25, 10, 25, 10),
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Verification',
                              style: TextStyle(
                                  fontSize: 35,
                                  fontFamily: 'openSans',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                              // textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Enter the verification code we just sent you on your email address.',
                              style: TextStyle(
                                  fontFamily: 'openSans',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54),
                              // textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 40.0),
                      Form(
                        key: controller.formKey,
                        child: Column(
                          children: <Widget>[
                            OTPTextField(
                              controller: controller.otpFieldController,
                              length: 4,
                              width: 300,
                              fieldWidth: 50,
                              style: TextStyle(fontSize: 30),
                              textFieldAlignment: MainAxisAlignment.spaceAround,
                              fieldStyle: FieldStyle.underline,
                              onChanged: (value) {},
                              onCompleted: (pin) {
                                controller.pinSuccess.value = true;
                                print(controller.pinSuccess);
                                //Todo:verification function will be sent
                              },
                            ),
                            SizedBox(height: 50.0),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: "If you didn't receive a code! ",
                                    style: TextStyle(
                                      color: Colors.black38,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Resend',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        controller.otpFieldController.clear;

                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return ThemeHelper().alertDialog(
                                                "Successful",
                                                "Verification code resend successful.",
                                                context);
                                          },
                                        );
                                      },
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.orange),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 40.0),
                            Container(
                              decoration: controller.pinSuccess.value
                                  ? ThemeHelper().buttonBoxDecoration(
                                      context, "#AAAAAA", "#757575")
                                  : ThemeHelper().buttonBoxDecoration(context),
                              child: ElevatedButton(
                                style: ThemeHelper().buttonStyle(),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(40, 10, 40, 10),
                                  child: Text(
                                    "Verify".toUpperCase(),
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                onPressed: controller.pinSuccess.value
                                    ? () {
                                        print(controller.pinSuccess);
                                      }
                                    : () {
                                        print(controller.pinSuccess);
                                        Get.to(ResearcherView(),
                                            binding: ResearcherBinding());
                                      },
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
