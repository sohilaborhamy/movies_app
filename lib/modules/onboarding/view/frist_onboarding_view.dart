import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/constants/assets_app.dart';


import '../../../core/services/custom_button_widget.dart';
import '../../../core/theme/colors_app.dart';

import 'onboarding_scroll_view.dart';

class FristOnboardingView extends StatelessWidget {
  const FristOnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AssetsApp.moviesPosters,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Find Your Next Favorite Movie Here",
                      style: GoogleFonts.inter(
                          fontSize: 36,
                          fontWeight: FontWeight.w500,
                          color: ColorsApp.white),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "Get access to a huge library of movies to suit all tastes. You will surely like it.",
                      style: GoogleFonts.inter(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: ColorsApp.white.withOpacity(0.5)),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: CustomButtonWidget(
                        buttonText: "Explore Now",
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const OnboardingScrollView(),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
