import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/features/home/logic/home_cubit.dart';
import 'package:flutter_complete_project/features/home/logic/home_state.dart';
import 'package:flutter_complete_project/features/home/ui/widgets/doctor_speciality_list_view.dart';

import 'doctors_list_view.dart';

class SpecializationAndDoctorsBlocBuilder extends StatelessWidget {
  const SpecializationAndDoctorsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is SpecializationsLoading ||
          current is SpecializationSuccess ||
          current is SpecializationsError,
      builder: (BuildContext context, state) {
        return state.maybeWhen(
          specializationLoading: () => setupLoading(),
          specializationSuccess: (specializationsResponseModel) {
            var specializationsList =
                specializationsResponseModel.specializationDataList;
            return setupSuccess(specializationsList);
          },
          specializationError: (error) => setupError(),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }

  Widget setupLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }

  Widget setupSuccess(specializationsList) {
    return Expanded(
      child: Column(
        children: [
          DoctorSpecialityListView(
            specializationsList: specializationsList ?? [],
          ),
          verticalSpace(8),
          DoctorsListView(
            doctorsList: specializationsList?[0]?.doctorsList,
          ),
        ],
      ),
    );
  }
}
