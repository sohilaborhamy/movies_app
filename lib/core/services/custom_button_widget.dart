import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/colors_app.dart';

class CustomButtonWidget extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color sideColor;
  final Color textColor; 

  const CustomButtonWidget({
    super.key,
    required this.buttonText,
    required this.onPressed,
    this.backgroundColor = ColorsApp.secondColor, 
    this.sideColor = Colors.transparent, 
    this.textColor = ColorsApp.greyColor, 
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          width: size.width,
          height: 50,
          decoration: BoxDecoration(
            color: backgroundColor, 
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: sideColor, 
              width: 2, 
            ),
          ),
          child: Center(
            child: Text(
              buttonText,
              style: GoogleFonts.inter(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: textColor, 
              ),
            ),
          ),
        ),
      ),
    );
  }
}