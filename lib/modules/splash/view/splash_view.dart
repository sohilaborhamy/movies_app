import 'package:animate_do/animate_do.dart';

import 'package:flutter/material.dart';

import '../../../core/constants/assets_app.dart';
import '../../../core/routes/screens_route_name.dart';
import '../../../core/services/local_storage_key.dart';
import '../../../core/services/local_storage_service.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    Future.delayed(
      const Duration(seconds: 3),
      () {
         var isFristTime = LocalStorageService.getBool(LocalStorageKeys.isFristTimeRun)?? true;
        Navigator.pushReplacementNamed(context, isFristTime?  ScreenRouteName.fristOnboardingView :
       ScreenRouteName.loginView);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            ZoomIn(
              duration: const Duration(seconds: 1),
              child: Image.asset(
                AssetsApp.logoSplash,
                width: 200,
                height: size.size.height * 0.8,
              ),
            ),
            const Spacer(),
            SlideInUp(
              duration: const Duration(seconds: 1),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Image.asset(
                  AssetsApp.routeLogo,
                  width: 214,
                  height: 86,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
