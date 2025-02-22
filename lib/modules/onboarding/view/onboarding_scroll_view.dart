

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../../core/routes/screens_route_name.dart';
import '../../../core/services/custom_button_widget.dart';
import '../../../core/theme/colors_app.dart';
import '../../../data/models/onboarding_model.dart';

class OnboardingScrollView extends StatefulWidget {
  const OnboardingScrollView({super.key});

  @override
  _OnboardingScrollViewState createState() => _OnboardingScrollViewState();
}

class _OnboardingScrollViewState extends State<OnboardingScrollView> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  void _nextPage() {
    if (_currentPage < OnboardingModel.onboardingList.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _finishOnboarding() {
    Navigator.of(context).pushReplacementNamed(ScreenRouteName.loginView);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        onPageChanged: (int page) {
          setState(() {
            _currentPage = page;
          });
        },
        itemCount: OnboardingModel.onboardingList.length,
        itemBuilder: (context, index) {
          final onboardingData = OnboardingModel.onboardingList[index];
          return Stack(
            children: [
              Image.asset(
                onboardingData.image,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: ColorsApp.primaryColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(64.0),
                      topRight: Radius.circular(64.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 25),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          onboardingData.header,
                          style: GoogleFonts.inter(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: ColorsApp.white,
                          ),
                        ),
                        SizedBox(height: 20),
                        if (onboardingData.description != null)
                          Text(
                            onboardingData.description!,
                            style: GoogleFonts.inter(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: ColorsApp.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        const SizedBox(height: 20),
                        if (_currentPage <
                            OnboardingModel.onboardingList.length - 1)
                          CustomButtonWidget(
                            buttonText: "Next",
                            onPressed: _nextPage,
                          ),
                        if (_currentPage ==
                            OnboardingModel.onboardingList.length - 1)
                          CustomButtonWidget(
                            buttonText: "Finish",
                            onPressed: _finishOnboarding,
                          ),
                        if (_currentPage > 0)
                          CustomButtonWidget(

                              buttonText: "Back", onPressed: _previousPage,
                              backgroundColor: ColorsApp.primaryColor,
                              textColor: ColorsApp.secondColor,
                              sideColor: ColorsApp.secondColor,),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
