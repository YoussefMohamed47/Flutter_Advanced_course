import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';

class AlreadyHaveAccountText extends StatelessWidget {
  const AlreadyHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: "Already Have account?",
        style: TextStyles.font13DarkBlueRegular,
        children: [
          TextSpan(
            text: ' Sign Up',
            style: TextStyles.font13BlueSemiBold,
          ),
        ],
      ),
    );
  }
}
