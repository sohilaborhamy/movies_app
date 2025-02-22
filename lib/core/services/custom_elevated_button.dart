

import 'package:flutter/material.dart';

import '../theme/colors_app.dart';

class CustomElevatedButton extends StatelessWidget {
  final String title;
  final Function()? onTab;
  final Color bgColor;
  final double borderRadius;
  final Color titleColor;

  const CustomElevatedButton({
    super.key,
    required this.title,
    this.onTab,
    this.bgColor = ColorsApp.secondColor,
    this.titleColor = ColorsApp.greyColor,
    this.borderRadius = 16,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        padding: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      onPressed: onTab,
      child: Text(
        title,
        style: TextStyle(
          color: titleColor,
          fontSize: 16,
        ),
      ),
    );
  }
}
