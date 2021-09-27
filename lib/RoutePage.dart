import 'package:get/get.dart';
import 'package:retrofit_exam/screen/event/EventMainScreen.dart';
import 'package:retrofit_exam/screen/event/EventType_A.dart';
import 'package:retrofit_exam/screen/event/EventType_B.dart';
import 'package:retrofit_exam/screen/promotion/PromotionMain.dart';

import 'screen/NavigationScreen.dart';

class RoutePage {
  static int ROUTE_DURATION_TIME = 300;

  static movePage(String pageName) => Get.toNamed(pageName);

  static movePageWithArgument(String pageName, dynamic arguments) =>
      Get.toNamed(pageName, arguments: arguments);

  ///현재 page 지우고 다음 페이지로 이동
  static offAndToNamed(String pageName) => Get.offAndToNamed(pageName);

  ///기존에 쌓여있던 모든 stack 지우고 이동하려는 페이지만 stack이 남는다
  static moveOffAllNamed(String pageName) => Get.offAllNamed(pageName);


  static getBack() => Get.back();

  static goHome() =>
      Get.until((route) => Get.currentRoute == RoutePage.NAVIGATION_ROUTE);

  static offUntil(String routeName) =>
      Get.until((route) => Get.currentRoute == routeName);

  static const String NAVIGATION_ROUTE = "/navigation";
  static const String EVENT_MAIN = "/eventMain";
  static const String EVENT_A = "/event_A";
  static const String EVENT_B = "/event_B";
  static const String PROMOTION_MAIN = "/promotionMain";

  static final List<GetPage> getPageList = [

    GetPage(
      name: NAVIGATION_ROUTE,
      page: () => NavigationScreen(),
      transition: Transition.native,
    ),
    GetPage(
      name: EVENT_MAIN,
      page: () => EventMainScreen(),
      transition: Transition.native,
    ),
    GetPage(
      name: EVENT_A,
      page: () => EventType_A(),
      transition: Transition.native,
    ),
    GetPage(
      name: EVENT_B,
      page: () => EventType_B(),
      transition: Transition.native,
    ),
    GetPage(
      name: PROMOTION_MAIN,
      page: () => PromotionMain(),
      transition: Transition.native,
    ),
  ];
}
