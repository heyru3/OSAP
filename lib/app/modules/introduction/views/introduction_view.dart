import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:osap/app/modules/login/bindings/login_binding.dart';
import 'package:osap/app/modules/login/views/login_view.dart';
import 'package:osap/app/routes/app_pages.dart';


class IntroductionView extends GetView {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 18.0),
        child: Center(
          child: IntroductionScreen(
            pages: listPagesViewModel,
            done: const Text('Done',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'openSans',
                )),
            onDone: () {
              Get.offAllNamed(Routes.HOME);
            },
            skip: Text('Skip',
                style: TextStyle(
                  fontFamily: 'openSans',
                )),
            showSkipButton: true,
            onSkip: () {
              Get.offAll(LoginView(), binding: LoginBinding());
            },
            next: Text('Next',
                style: TextStyle(
                  fontFamily: 'openSans',
                )),
            showNextButton: true,
          ),
        ),
      ),
    );
  }

  final List<PageViewModel> listPagesViewModel = [
    PageViewModel(
      title: 'OSAP',
      bodyWidget: Text(
        'Welcome to OSAP Application',
        style: TextStyle(
            fontWeight: FontWeight.w400,
            letterSpacing: 2,
            fontFamily: 'openSans'),
      ),
      image: Center(child: Lottie.asset('assets/lottie/27637-welcome.json')),
    ),
    PageViewModel(
      title: "OSAP",
      bodyWidget: Text('Make Your research with us...',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            letterSpacing: 2,
            fontFamily: 'openSans',
          )),
      image: Center(child: Lottie.asset('assets/lottie/researcher.json')),
    ),
    PageViewModel(
      title: "OSAP",
      bodyWidget: Text('To reach your customer easily...',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            letterSpacing: 2,
            fontFamily: 'openSans',
          )),
      image: Center(child: Lottie.asset('assets/lottie/reach_customer.json')),
    ),
    PageViewModel(
      title: "OSAP",
      bodyWidget: Text('Save your money...',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            letterSpacing: 2,
            fontFamily: 'openSans',
          )),
      image: Center(child: Lottie.asset('assets/lottie/save_money.json')),
    ),
    PageViewModel(
      title: "OSAP",
      bodyWidget: Text('Fill survey',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            letterSpacing: 2,
            fontFamily: 'openSans',
          )),
      image: Center(child: Lottie.asset('assets/lottie/fill_survey.json')),
    ),
  ];
}
