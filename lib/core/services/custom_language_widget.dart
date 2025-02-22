
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/app_language_provider.dart';
import '../constants/assets_app.dart';
import '../theme/colors_app.dart';



class CustomLanguageWidget extends StatelessWidget {
  const CustomLanguageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    final languageProvider = Provider.of<AppLanguageProvider>(context); 

    return Container(
      width: width * 0.2,
      height: 35,
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorsApp.secondColor,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // English Icon
          GestureDetector(
            onTap: () {
              languageProvider.changeLanguage("en");
            },
            child: Container(
              decoration: BoxDecoration(
                border: languageProvider.appLanguage == "en"
                    ? Border.all(
                        color: ColorsApp.secondColor,
                        width: 2,
                      )
                    : null, 
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.all(2), 
              child: Image.asset(
                AssetsApp.lrIcon,
                width: 20,
                height: 20,
              ),
            ),
          ),
          const SizedBox(width: 18),
          // Arabic Icon
          GestureDetector(
            onTap: () {
              languageProvider.changeLanguage("ar");
            },
            child: Container(
              decoration: BoxDecoration(
                border: languageProvider.appLanguage == "ar"
                    ? Border.all(
                        color: ColorsApp.secondColor,
                        width: 2,
                      )
                    : null, 
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.all(2), 
              child: Image.asset(
                AssetsApp.egIcon,
                width: 20,
                height: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}