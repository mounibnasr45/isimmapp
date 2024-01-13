import 'package:flutter/material.dart';
import 'package:isimm_app2/domain/module.dart';
import 'package:isimm_app2/presentation/home/view/HomeView.dart';
import 'package:isimm_app2/presentation/login/widgets/view/loginView.dart';
import 'package:isimm_app2/presentation/profile/view/profile.dart';
import 'package:isimm_app2/presentation/schedule/view/schedule.dart';
import 'package:isimm_app2/presentation/schedule/widgets/schedule.dart';
import 'package:isimm_app2/presentation/signup/view/signup_view.dart';
import 'package:isimm_app2/presentation/studentlife/StudentLife.dart';
import 'package:isimm_app2/presentation/teacher/ClassAbsent.dart';
import 'package:isimm_app2/presentation/teacher/schedule.dart';

import '../../app/app.dart';
import '../teacher/news/news.dart';
import '../teacher/teacherview.dart';
import '../chaptre/view/chaptreview.dart';

class Routes {
  static const String signup = "/signup";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String HomeRoute = "/home";
  static const String chapterRoute = "/chaptre";
  static const String scheduleRoute = "/schedule";
  static const String classRoute = "/class";
  static const String student = "/student";
  static const String schedule_teach = "/schedule_teach";
  static const String teachView = "/teachView";
  static const String profile = "/profile";
  static const String classAbsent = "/classAbsent";
  static const String teachernews = "/teachernews";
  /*static const String forgotPasswordRoute = "/forgotPassword";
  static const String onBoardingRoute = "/onBoarding";
  static const String mainRoute = "/main";
  static const String storeDetailsRoute = "/storeDetails";*/
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const Loginview());
      case Routes.teachernews:
        return MaterialPageRoute(builder: (_) =>  News("yourTeacherIdHere"));
      case Routes.classAbsent:
        return MaterialPageRoute(builder: (_) => const ClassAbsent());
      case Routes.profile:
        return MaterialPageRoute(builder: (_) =>  Profile());
      case Routes.teachView:
        return MaterialPageRoute(builder: (_) =>  TeacherView());
      case Routes.student:
        return MaterialPageRoute(builder: (_) => const StudentLife());
      // case Routes.chapterRoute:
      //   return MaterialPageRoute(builder: (_) => Chapter(id: 'algo',));

      case Routes.scheduleRoute:
        return MaterialPageRoute(builder: (_) => ScheduleView());
      case Routes.schedule_teach:
        return MaterialPageRoute(builder: (_) => Cell());
      case Routes.chapterRoute:
        return MaterialPageRoute(
            builder: (_) => Chapter(
                  type: true, // Replace with your boolean value
                  id: 'some_id', // Replace with your string value
                ));
      case Routes.signup:
        return MaterialPageRoute(builder: (_) => const SignUpView());
      case Routes.HomeRoute:
        return MaterialPageRoute(builder: (_) => HomeView());
      // case Routes.classRoute:
      //   return MaterialPageRoute(builder: (_) => const ClassAbsent());
      /*case Routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordView());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => const MainView());
      */
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text("fiq ala wadheaak"),
              ),
              body: const Center(child: Text("noRouteFound")),
            ));
  }
}
