import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/core/resources/app_assets.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_complete_project/features/home/data/models/specializations_response_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SpecialityListViewItem extends StatelessWidget {
  final int itemIndex;
  final SpecializationsData? specializationsData;
  final int selectedIndex;
  const SpecialityListViewItem(
      {super.key,
      required this.itemIndex,
      required this.specializationsData,
      required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: itemIndex == 0 ? 0 : 16),
      child: Column(
        children: [
          Container(
            decoration: selectedIndex == itemIndex
                ? BoxDecoration(
                    border: Border.all(
                      color: ColorsManager.darkBlue,
                    ),
                    shape: BoxShape.circle,
                  )
                : null,
            child: CircleAvatar(
              radius: 28,
              backgroundColor: ColorsManager.lightBlue,
              child: SvgPicture.asset(
                AppIcons.generalSpeciality,
                height: itemIndex == selectedIndex ? 42.h : 40.h,
                width: itemIndex == selectedIndex ? 42.w : 40.w,
              ),
            ),
          ),
          verticalSpace(8),
          Text(
            specializationsData?.name ?? "Specialization",
            style: selectedIndex == itemIndex
                ? TextStyles.font14DarkBlueBold
                : TextStyles.font12DarkBlueRegular,
          ),
        ],
      ),
    );
  }
}
