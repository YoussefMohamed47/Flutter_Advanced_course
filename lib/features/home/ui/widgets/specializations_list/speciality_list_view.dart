import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/features/home/data/models/specializations_response_model.dart';
import 'package:flutter_complete_project/features/home/logic/home_cubit.dart';
import 'package:flutter_complete_project/features/home/ui/widgets/specializations_list/speciality_list_view_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpecialityListView extends StatefulWidget {
  final List<SpecializationsData?> specializationsList;
  const SpecialityListView({super.key, required this.specializationsList});

  @override
  State<SpecialityListView> createState() => _DoctorSpecialityListViewState();
}

class _DoctorSpecialityListViewState extends State<SpecialityListView> {
  var selectedSpecializationIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.specializationsList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedSpecializationIndex = index;
              });
              context.read<HomeCubit>().getDoctorsList(
                  specializationId: widget.specializationsList[index]?.id);
            },
            child: SpecialityListViewItem(
              itemIndex: index,
              specializationsData: widget.specializationsList[index],
              selectedIndex: selectedSpecializationIndex,
            ),
          );
        },
      ),
    );
  }
}
