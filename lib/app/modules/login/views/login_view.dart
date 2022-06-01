import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:osap/app/data/common/theme_helper.dart';
import 'package:osap/app/data/widget/header.dart';
import 'package:osap/app/modules/login/bindings/login_binding.dart';
import 'package:osap/app/modules/login/views/forgot_password.dart';
import 'package:osap/app/modules/researcher/bindings/researcher_binding.dart';
import 'package:osap/app/modules/researcher/views/researcher_view.dart';
import 'package:osap/app/modules/respondent/bindings/respondent_binding.dart';
import 'package:osap/app/modules/respondent/views/respondent_view.dart';
import 'package:osap/app/modules/sign_up/bindings/sign_up_binding.dart';
import 'package:osap/app/modules/sign_up/views/researcher_sign_up_view.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final double _headerHeight = 150;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
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
              height: _headerHeight,
              child: HeaderWidget(_headerHeight, true, Icons.login_rounded),
            ),
            SafeArea(
                child: Container(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Column(children: [
                Text(
                  'Login',
                  style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'openSans'),
                ),
                Text(
                  'Sign in into your account',
                  style: TextStyle(color: Colors.grey, fontFamily: 'openSans'),
                ),
                SizedBox(
                  height: 30,
                ),
                Form(
                    key: controller.loginFormKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: controller.emailController,
                          decoration: ThemeHelper().textInputDecoration(
                              labelText: 'E-mail',
                              hintText: 'Enter your user name',
                              iconData: Icons.email_outlined),
                          onSaved: (value) {
                            controller.email = value!;
                          },
                          validator: (value) {
                            return controller.validateEmail(value!);
                          },
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: 30),
                        TextFormField(
                          controller: controller.passwordController,
                          obscureText: true,
                          decoration: ThemeHelper().textInputDecoration(
                              labelText: 'Password',
                              hintText: 'Enter your Password',
                              iconData: Icons.lock_outlined),
                          onSaved: (value) {
                            controller.password = value!;
                          },
                          validator: (value) {
                            return controller.validatePassword(value!);
                          },
                          keyboardType: TextInputType.visiblePassword,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 0, 10, 20),
                          alignment: Alignment.topRight,
                          child: GestureDetector(
                            onTap: () {
                              Get.to(ForgotPassword(), binding: LoginBinding());
                            },
                            child: Text(
                              'Forgot your password?',
                              style: TextStyle(
                                fontFamily: 'openSans',
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration:
                              ThemeHelper().buttonBoxDecoration(context),
                          child: ElevatedButton(
                              style: ThemeHelper().buttonStyle(),
                              onPressed: () {
                                if (controller.loginFormKey.currentState!
                                    .validate()) {
                                  controller.loginFormKey.currentState!.save();
                                  controller
                                      .login(
                                    controller.passwordController.text,
                                    controller.emailController.text,
                                  )
                                      .then((value) async {
                                    if (value) {
                                      controller
                                          .userInformation(
                                              controller.userToke.value)
                                          .then((value2) {
                                        if (value2['roll'] == 'Researcher') {
                                          Get.offAll(
                                            ResearcherView(),
                                            binding: ResearcherBinding(),
                                            arguments:
                                                controller.userToke.value,
                                          );
                                        } else if (value2['roll'] ==
                                            'Respondent') {
                                          Get.offAll(
                                            RespondentView(),
                                            binding: RespondentBinding(),
                                            arguments:
                                                controller.userToke.value,
                                          );
                                        } else {
                                          Get.defaultDialog(
                                            title: 'Error',
                                            titleStyle: TextStyle(
                                              fontSize: 16,
                                              fontFamily: 'openSans',
                                              letterSpacing: 2,
                                              color: Color.fromARGB(
                                                  255, 233, 101, 91),
                                            ),
                                            content: Column(
                                              children: [
                                                Divider(
                                                  thickness: 1.5,
                                                  color: Colors.grey,
                                                ),
                                                Text(
                                                  "invalid user",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontFamily: 'openSans',
                                                    letterSpacing: 1.5,
                                                    color: Color.fromARGB(
                                                        255, 243, 96, 85),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        }
                                      });
                                    } else {
                                      Get.defaultDialog(
                                        title: 'Error',
                                        titleStyle: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'openSans',
                                          letterSpacing: 2,
                                          color:
                                              Color.fromARGB(255, 233, 101, 91),
                                        ),
                                        content: Column(
                                          children: [
                                            Divider(
                                              thickness: 1.5,
                                              color: Colors.grey,
                                            ),
                                            Text(
                                              'Either password or email is incorrect',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontFamily: 'openSans',
                                                letterSpacing: 1.5,
                                                color: Color.fromARGB(
                                                    255, 243, 96, 85),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }
                                  });
                                }
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(40, 10, 40, 10),
                                child: Text(
                                  'SIGN IN',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'openSans',
                                      color: Colors.white),
                                ),
                              )),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                    style: TextStyle(fontFamily: 'openSans'),
                                    text: 'Don\'t have an account? '),
                                TextSpan(
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      decoration: TextDecoration.underline,
                                      color: Theme.of(context).primaryColor,
                                      fontFamily: 'openSans'),
                                  text: 'Create',
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Get.to(ResearcherSignUpView(),
                                          binding: SignUpBinding());
                                    },
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ))
              ]),
            ))
          ],
        ),
      ),
    );
  }
}
