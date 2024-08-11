import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/core/resources/app_assets.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_complete_project/features/home/data/models/specializations_response_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DoctorSpecialityListViewItem extends StatelessWidget {
  final int itemIndex;
  final SpecializationsData? specializationsData;
  const DoctorSpecialityListViewItem(
      {super.key, required this.itemIndex, required this.specializationsData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: itemIndex == 0 ? 0 : 16),
      child: Column(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: ColorsManager.lightBlue,
            child: SvgPicture.asset(
              AppIcons.generalSpeciality,
              height: 40.h,
              width: 40.w,
            ),
          ),
          verticalSpace(8),
          Text(
            specializationsData?.name ?? "Specialization",
            style: TextStyles.font12DarkBlueRegular,
          ),
        ],
      ),
    );
  }
}
