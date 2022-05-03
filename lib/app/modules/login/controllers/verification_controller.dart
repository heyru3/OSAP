import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';

class VerificationController extends GetxController {
 GlobalKey<FormState> formKey = GlobalKey<FormState>();
   RxBool pinSuccess = false.obs;
  OtpFieldController otpFieldController = OtpFieldController();
}
