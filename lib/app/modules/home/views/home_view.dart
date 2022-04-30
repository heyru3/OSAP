import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:osap/app/routes/app_pages.dart';

import '../../../data/widget/header.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final double _headerHeight = 200;
  late double _devWidth;
  late double _devHeight;
  @override
  Widget build(BuildContext context) {
    _devHeight = MediaQuery.of(context).size.height;
    _devWidth = MediaQuery.of(context).size.width;
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: _headerHeight,
              child: HeaderWidget(_headerHeight, true, Icons.login_rounded),
            ),
            SafeArea(
                child: Container(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
              margin: EdgeInsets.fromLTRB(20, 0, 20, 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: _devHeight / 3,
                    width: _devWidth * 2 / 3,
                    alignment: Alignment.topCenter,
                    child: Lottie.asset('assets/lottie/work_team.json'),
                  ),

                  Text('Connect to',
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 24,
                          letterSpacing: 1.2,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 5,
                  ),
                  Text('Customers,',
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 24,
                          letterSpacing: 1.2,
                          fontFamily: 'openSans',
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 5,
                  ),
                  Text('gather insights,',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 24,
                          letterSpacing: 1.2,
                          fontFamily: 'openSans',
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 5,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text:
                              'Recruit research participants, distribute surveys,fill survey,test your product, and analyse result ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            letterSpacing: 1.2,
                            fontWeight: FontWeight.w300,
                            fontFamily: 'openSans',
                          ),
                        ),
                        TextSpan(
                          text: 'all in one platform',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 16,
                              letterSpacing: 1.2,
                              fontFamily: 'openSans',
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ),
                  //Todo:implement another element if necessary
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.LOGIN);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2,
                                style: BorderStyle.solid,
                              ),
                            ),
                          ),
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'openSans',
                              fontWeight: FontWeight.w300,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        '|',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'openSans',
                          fontWeight: FontWeight.w300,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      SizedBox(width: 5),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.SIGN_UP);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                            color: Theme.of(context).primaryColor,
                            width: 2,
                            style: BorderStyle.solid,
                          ))),
                          child: Text(
                            'Sign up',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'openSans',
                              fontWeight: FontWeight.w300,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
