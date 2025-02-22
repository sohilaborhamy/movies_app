import 'package:flutter/material.dart';
import 'package:movies_app/modules/profile/view/profile_view.dart';

import '../../modules/forgetPassword/view/forget_password_view.dart';

import '../../modules/login/view/login_view.dart';
import '../../modules/onboarding/view/frist_onboarding_view.dart';
import '../../modules/onboarding/view/onboarding_scroll_view.dart';


import '../../modules/signUp/view/signup_view.dart';
import '../../modules/splash/view/splash_view.dart';
import 'screens_route_name.dart';

abstract class AppRoutes {
  static Route onGeneratedRoute(RouteSettings settings) {
    switch (settings.name) {
      case ScreenRouteName.initial:
        return MaterialPageRoute(
            builder: (context) => const SplashView(), settings: settings);
      case ScreenRouteName.fristOnboardingView:
        return MaterialPageRoute(
            builder: (context) => const FristOnboardingView(),
            settings: settings);

      case ScreenRouteName.onboardingScrollView:
        return MaterialPageRoute(
            builder: (context) => const OnboardingScrollView(),
            settings: settings);
      case ScreenRouteName.loginView:
        return MaterialPageRoute(
            builder: (context) => const LoginView(), settings: settings);
             case ScreenRouteName.signUpView:
        return MaterialPageRoute(
            builder: (context) => const SignUpView(), settings: settings);
      case ScreenRouteName.forgetPasswordView:
        return MaterialPageRoute(
            builder: (context) => const ForgetPasswordView(),
            settings: settings);
      case ScreenRouteName.profileView:
        return MaterialPageRoute(
            builder: (context) => const ProfileView(), settings: settings);
      default:
        return MaterialPageRoute(
            builder: (context) => const SplashView(), settings: settings);
    }
  }
}
