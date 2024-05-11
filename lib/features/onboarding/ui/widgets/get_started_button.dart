import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(ColorsManager.mainBlue),
          tapTargetSize:
              MaterialTapTargetSize.shrinkWrap, // Default Space Removed
          minimumSize: MaterialStateProperty.all(
              const Size(double.infinity, 52)), // Takes Full Width
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
        child: Text(
          'Get Started',
          style: TextStyles.font16WhiteSemiBold,
        ));
  }
}
