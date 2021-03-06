import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lottie/lottie.dart';
import 'package:osap/app/data/widget/header.dart';
import 'package:osap/app/modules/home/bindings/home_binding.dart';
import 'package:osap/app/modules/home/views/home_view.dart';
import 'package:osap/app/modules/login/bindings/login_binding.dart';
import 'package:osap/app/modules/login/views/login_view.dart';
import 'package:osap/app/modules/sign_up/bindings/sign_up_binding.dart';
import 'package:osap/app/modules/sign_up/views/respondent_sign_up_view.dart';

import '../../../data/common/theme_helper.dart';
import '../controllers/researcher_sign_up_controller.dart';

class ResearcherSignUpView extends GetView<ResearcherSignUpController> {
  @override
  Widget build(BuildContext context) {
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
        child: Stack(
          children: [
            Container(
              height: 150,
              child: HeaderWidget(150, false, Icons.person_add_alt_1_rounded),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(25, 50, 25, 10),
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Form(
                    key: controller.formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            //Todo:Upload or capture image
                          },
                          child: Stack(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border:
                                      Border.all(width: 5, color: Colors.white),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 20,
                                      offset: const Offset(5, 5),
                                    ),
                                  ],
                                ),
                                //Todo:the child must changeable
                                child: Icon(
                                  Icons.person,
                                  color: Colors.grey.shade300,
                                  size: 80.0,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(80, 80, 0, 0),
                                child: Icon(
                                  Icons.add_circle,
                                  color: Colors.grey.shade700,
                                  size: 25.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.offAll(RespondentSignUpView(),
                                binding: SignUpBinding());
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(children: [
                                Lottie.asset('assets/lottie/fast-forward.json',
                                    width: 5, height: 80, fit: BoxFit.cover),
                                SizedBox(
                                  width: 60,
                                ),
                                Text(
                                  'To sign up as respondent',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54,
                                    fontFamily: 'openSans',
                                  ),
                                )
                              ]),
                              TextButton(
                                  onPressed: () {
                                    Get.offAll(HomeView(),
                                        binding: HomeBinding());
                                  },
                                  child: Icon(
                                    FontAwesomeIcons.houseChimneyUser,
                                    size: 24,
                                    color: Theme.of(context).primaryColor,
                                  ))
                            ],
                          ),
                        ),
                        Container(
                          child: TextFormField(
                            controller: controller.firstNameController,
                            decoration: ThemeHelper().textInputDecoration(
                                labelText: 'First Name',
                                hintText: 'Enter your first name',
                                iconData: FontAwesomeIcons.user),
                            onSaved: (value) {
                              controller.firstName = value!;
                            },
                            validator: (value) {
                              return controller.validateName(
                                  value!, 'first name');
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShadow(),
                        ),
                        SizedBox(height: 30),
                        Container(
                          child: TextFormField(
                            controller: controller.lastNameController,
                            decoration: ThemeHelper().textInputDecoration(
                              labelText: 'Last Name',
                              hintText: 'Enter your last name',
                              iconData: FontAwesomeIcons.user,
                            ),
                            onSaved: (value) {
                              controller.lastName = value!;
                            },
                            validator: (value) {
                              return controller.validateName(
                                  value!, 'last name');
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShadow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                              controller: controller.emailNameController,
                              decoration: ThemeHelper().textInputDecoration(
                                labelText: 'E-mail address',
                                hintText: 'Enter your email',
                                iconData: Icons.email_outlined,
                              ),
                              onSaved: (value) {
                                controller.email = value!;
                              },
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                return controller.validateEmail(value!);
                              }),
                          decoration: ThemeHelper().inputBoxDecorationShadow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            controller: controller.usernameController,
                            decoration: ThemeHelper().textInputDecoration(
                              labelText: 'Username',
                              hintText: 'Enter your username',
                              iconData: FontAwesomeIcons.user,
                            ),
                            onSaved: (value) {
                              controller.username = value!;
                            },
                            keyboardType: TextInputType.phone,
                            validator: (value) {
                              return controller.validateName(
                                  value!, 'username');
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShadow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            controller: controller.passwordNameController,
                            obscureText: true,
                            decoration: ThemeHelper().textInputDecoration(
                              labelText: 'Password',
                              hintText: 'Enter your password',
                              iconData: Icons.lock_outlined,
                            ),
                            onSaved: (value) {
                              controller.password = value!;
                            },
                            validator: (value) {
                              return controller.validatePassword(value!);
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShadow(),
                        ),
                        SizedBox(height: 15.0),
                        FormField<bool>(
                          builder: (state) {
                            return Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Checkbox(
                                        value: controller.checkboxValue.value,
                                        onChanged: (value) {
                                          controller.checkboxValue.value =
                                              value!;
                                          state.didChange(value);
                                        }),
                                    Text(
                                      "I accept all terms and conditions.",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    state.errorText ?? '',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Theme.of(context).errorColor,
                                      fontSize: 12,
                                    ),
                                  ),
                                )
                              ],
                            );
                          },
                          validator: (value) {
                            if (!controller.checkboxValue.value) {
                              return 'You need to accept terms and conditions';
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          decoration:
                              ThemeHelper().buttonBoxDecoration(context),
                          child: ElevatedButton(
                            style: ThemeHelper().buttonStyle(),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(40, 10, 40, 10),
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            onPressed: () {
                              if (controller.formKey.currentState!.validate()) {
                                controller.formKey.currentState!.save();

                                controller
                                    .signUp(
                                  controller.firstNameController.text,
                                  controller.lastNameController.text,
                                  controller.usernameController.text,
                                  controller.emailNameController.text,
                                  controller.passwordNameController.text,
                                )
                                    .then((value) {
                                  if (value) {
                                    Get.to(LoginView(),
                                        binding: LoginBinding());
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
                          ),
                        ),
                        SizedBox(height: 30.0),
                        Text(
                          "Or create account using social media",
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(height: 25.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              child: FaIcon(
                                FontAwesomeIcons.googlePlus,
                                size: 35,
                                color: HexColor("#EC2D2F"),
                              ),
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return ThemeHelper().alertDialog(
                                        "Google Plus",
                                        "You tap on GooglePlus social icon.",
                                        context);
                                  },
                                );
                              },
                            ),
                            SizedBox(
                              width: 30.0,
                            ),
                            GestureDetector(
                              child: Container(
                                padding: EdgeInsets.all(0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(
                                      width: 5, color: HexColor("#40ABF0")),
                                  color: HexColor("#40ABF0"),
                                ),
                                child: FaIcon(
                                  FontAwesomeIcons.twitter,
                                  size: 23,
                                  color: HexColor("#FFFFFF"),
                                ),
                              ),
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return ThemeHelper().alertDialog(
                                        "Twitter",
                                        "You tap on Twitter social icon.",
                                        context);
                                  },
                                );
                              },
                            ),
                            SizedBox(
                              width: 30.0,
                            ),
                            GestureDetector(
                              child: FaIcon(
                                FontAwesomeIcons.facebook,
                                size: 35,
                                color: HexColor("#3E529C"),
                              ),
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return ThemeHelper().alertDialog(
                                          "Facebook",
                                          "You tap on Facebook social icon.",
                                          context);
                                    });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
