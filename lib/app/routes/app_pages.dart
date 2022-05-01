import 'package:get/get.dart';
import 'package:osap/app/modules/home/bindings/home_binding.dart';
import 'package:osap/app/modules/home/views/home_view.dart';
import 'package:osap/app/modules/introduction/bindings/introduction_binding.dart';
import 'package:osap/app/modules/introduction/views/introduction_view.dart';
import 'package:osap/app/modules/login/bindings/login_binding.dart';
import 'package:osap/app/modules/login/views/login_view.dart';
import 'package:osap/app/modules/researcher/bindings/researcher_binding.dart';
import 'package:osap/app/modules/researcher/views/researcher_view.dart';
import 'package:osap/app/modules/sign_up/bindings/sign_up_binding.dart';
import 'package:osap/app/modules/sign_up/views/sign_up_view.dart';
import 'package:osap/app/modules/splash_screen/bindings/splash_screen_binding.dart';
import 'package:osap/app/modules/splash_screen/views/splash_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.INTRODUCTION;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.INTRODUCTION,
      page: () => IntroductionView(),
      binding: IntroductionBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.RESEARCHER,
      page: () => ResearcherView(),
      binding: ResearcherBinding(),
    ),
  ];
}
