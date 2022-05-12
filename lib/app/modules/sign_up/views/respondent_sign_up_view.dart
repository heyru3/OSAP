import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lottie/lottie.dart';
import '../../../data/widget/header.dart';
import 'package:osap/app/modules/home/bindings/home_binding.dart';

import '../../../data/common/theme_helper.dart';
import '../../../routes/app_pages.dart';
import '../../home/views/home_view.dart';
import '../bindings/sign_up_binding.dart';
import '../controllers/respondent_sign_up_controller.dart';
import 'researcher_sign_up_view.dart';

class RespondentSignUpView extends GetView<RespondentSignUpController> {
  @override
  Widget build(BuildContext context) {
    print('from build');
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
                            Get.offAll(ResearcherSignUpView(),
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
                                  'To sign up as Researcher',
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
                        SizedBox(height: 30),
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
                            controller: controller.cityController,
                            obscureText: true,
                            decoration: ThemeHelper().textInputDecoration(
                              labelText: 'city',
                              hintText: 'Enter your city',
                              iconData: Icons.location_city_outlined,
                            ),
                            onSaved: (value) {
                              controller.city = value!;
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
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            controller: controller.phoneController,
                            obscureText: true,
                            decoration: ThemeHelper().textInputDecoration(
                              labelText: 'phone',
                              hintText: 'Enter your phone number',
                              iconData: Icons.phone_outlined,
                            ),
                            onSaved: (value) {
                              controller.city = value!;
                            },
                            validator: (value) {
                              return controller.validatePhone(value!);
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShadow(),
                        ),
                        SizedBox(height: 15.0),
                        Container(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                              ),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0, 4),
                                    blurRadius: 5.0)
                              ],
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                stops: [0.0, 1.0],
                                colors: [Colors.white, Colors.white],
                              ),
                              color: Colors.deepPurple.shade300,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.user,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'Gender',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontFamily: 'openSans'),
                                      ),
                                    ],
                                  ),
                                  Obx(() => DropdownButton(
                                        value: controller.gender.value,
                                        items: [
                                          DropdownMenuItem(
                                            child: Text('None'),
                                            value: 'N',
                                          ),
                                          DropdownMenuItem(
                                            child: Text('Male'),
                                            value: 'M',
                                          ),
                                          DropdownMenuItem(
                                            child: Text('Female'),
                                            value: 'F',
                                          ),
                                        ],
                                        onChanged: (value) {
                                          controller.gender.value =
                                              value.toString();
                                        },
                                        style: TextStyle(
                                          fontFamily: 'openSans',
                                          color: Colors.grey,
                                        ),
                                        iconSize: 34,
                                        icon: Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.grey,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                        alignment:
                                            AlignmentDirectional.centerStart,
                                      )),
                                ])),
                        SizedBox(height: 15.0),
                        Container(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                              ),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0, 4),
                                    blurRadius: 5.0)
                              ],
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                stops: [0.0, 1.0],
                                colors: [Colors.white, Colors.white],
                              ),
                              color: Colors.deepPurple.shade300,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.user,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'Region',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontFamily: 'openSans'),
                                      ),
                                    ],
                                  ),
                                  Obx(
                                    () => DropdownButton(
                                      value: controller.region.value,
                                      items: [
                                        DropdownMenuItem(
                                            child: Text('None'), value: 'None'),
                                        DropdownMenuItem(
                                            child: Text('Addis Ababa'),
                                            value: 'Addis Ababa'),
                                        DropdownMenuItem(
                                            child: Text('Afar'), value: 'Afar'),
                                        DropdownMenuItem(
                                            child: Text('Oromia'),
                                            value: 'Oromia'),
                                        DropdownMenuItem(
                                            child: Text('Dire Dawa'),
                                            value: 'Dire Dawa'),
                                        DropdownMenuItem(
                                            child: Text('Tigray'),
                                            value: 'Tigray'),
                                        DropdownMenuItem(
                                            child: Text('Amhara'),
                                            value: 'Amhara'),
                                        DropdownMenuItem(
                                            child: Text('Gambela'),
                                            value: 'Gambela'),
                                        DropdownMenuItem(
                                            child: Text('Somalia'),
                                            value: 'Somalia'),
                                        DropdownMenuItem(
                                            child: Text('Sidama'),
                                            value: 'Sidama'),
                                        DropdownMenuItem(
                                            child: Text('Harari'),
                                            value: 'Harari'),
                                        DropdownMenuItem(
                                          child: Text(
                                            'SWEP',
                                          ),
                                          value: 'South West Ethiopia Peoples',
                                        ),
                                        DropdownMenuItem(
                                            child: Text(
                                              'SNNP',
                                            ),
                                            value:
                                                'Southern Nations, Nationalities, and Peoples'),
                                      ],
                                      onChanged: (value) {
                                        controller.region.value =
                                            value.toString();
                                      },
                                      style: TextStyle(
                                        fontFamily: 'openSans',
                                        color: Colors.grey,
                                      ),
                                      iconSize: 34,
                                      icon: Icon(
                                        Icons.arrow_drop_down,
                                        color: Colors.grey,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                      alignment:
                                          AlignmentDirectional.centerStart,
                                    ),
                                  ),
                                ])),
                        SizedBox(height: 15.0),
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 20, 10),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0, 4),
                                  blurRadius: 5.0)
                            ],
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              stops: [0.0, 1.0],
                              colors: [Colors.white, Colors.white],
                            ),
                            color: Colors.deepPurple.shade300,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.bedroom_baby_outlined,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Birth Date',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: 'openSans',
                                    ),
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  controller.chooseDateRangePicer();
                                  print(controller.birthDate.value);
                                },
                                child: Icon(
                                  FontAwesomeIcons.calendar,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 15),
                        Container(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                              ),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0, 4),
                                    blurRadius: 5.0)
                              ],
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                stops: [0.0, 1.0],
                                colors: [Colors.white, Colors.white],
                              ),
                              color: Colors.deepPurple.shade300,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.school_outlined,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'Education Level',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontFamily: 'openSans'),
                                      ),
                                    ],
                                  ),
                                  Obx(
                                    () => DropdownButton(
                                      value:
                                          controller.education.value,
                                      items: [
                                        DropdownMenuItem(
                                            child: Text('None'), value: 'None'),
                                        DropdownMenuItem(
                                            child: Text('BSC'), value: 'BSC'),
                                        DropdownMenuItem(
                                            child: Text('MSC'), value: 'MSC'),
                                        DropdownMenuItem(
                                            child: Text('PHD'), value: 'PHD'),
                                        DropdownMenuItem(
                                            child: Text('Professer'),
                                            value: 'Professer'),
                                      ],
                                      onChanged: (value) {
                                        controller.education.value =
                                            value.toString();
                                      },
                                      style: TextStyle(
                                        fontFamily: 'openSans',
                                        color: Colors.grey,
                                      ),
                                      iconSize: 34,
                                      icon: Icon(
                                        Icons.arrow_drop_down,
                                        color: Colors.grey,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                      alignment: AlignmentDirectional.centerStart,
                                    ),
                                  ),
                                ])),
                        SizedBox(height: 15.0),
                        Container(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                              ),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0, 4),
                                    blurRadius: 5.0)
                              ],
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                stops: [0.0, 1.0],
                                colors: [Colors.white, Colors.white],
                              ),
                              color: Colors.deepPurple.shade300,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.school_outlined,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'Occupation',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontFamily: 'openSans'),
                                      ),
                                    ],
                                  ),
                                  Obx(
                                    () => DropdownButton(
                                      value:
                                          controller.occupation.value,
                                      items: [
                                        DropdownMenuItem(
                                            child: Text('None'), value: 'None'),
                                        DropdownMenuItem(
                                            child: Text('Teacher'), value: 'Teacher'),
                                        DropdownMenuItem(
                                            child: Text('Student'), value: 'Student'),
                                        DropdownMenuItem(
                                            child: Text('Carpenter'), value: 'Carpenter'),
                                        DropdownMenuItem(
                                            child: Text('Marchant'),
                                            value: 'Marchant'),
                                            DropdownMenuItem(
                                            child: Text('Other'),
                                            value: 'Other'),
                                      ],
                                      onChanged: (value) {
                                        controller.occupation.value =
                                            value.toString();
                                      },
                                      style: TextStyle(
                                        fontFamily: 'openSans',
                                        color: Colors.grey,
                                      ),
                                      iconSize: 34,
                                      icon: Icon(
                                        Icons.arrow_drop_down,
                                        color: Colors.grey,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                      alignment: AlignmentDirectional.centerStart,
                                    ),
                                  ),
                                ])),
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
                                'Sign In',
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

                                //Todo:implement Function to
                                Get.toNamed(Routes.RESEARCHER);
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
