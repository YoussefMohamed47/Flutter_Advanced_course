import 'package:flutter/material.dart';
import 'package:flutter_complete_project/features/home/data/models/specializations_response_model.dart';
import 'package:flutter_complete_project/features/home/ui/widgets/doctor_speciality_list_view_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorSpecialityListView extends StatelessWidget {
  final List<SpecializationsData?> specializationsList;
  const DoctorSpecialityListView(
      {super.key, required this.specializationsList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: specializationsList.length,
        itemBuilder: (context, index) {
          return DoctorSpecialityListViewItem(
            itemIndex: index,
            specializationsData: specializationsList[index],
          );
        },
      ),
    );
  }
}
