import 'package:flutter/cupertino.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';

class DoctorSpecialitySeeAll extends StatelessWidget {
  const DoctorSpecialitySeeAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Doctor Speciality',
          style: TextStyles.font18DarkBlueSemiBold,
        ),
        const Spacer(),
        Text(
          'See all',
          style: TextStyles.font12MainBlueRegular,
        ),
      ],
    );
  }
}
