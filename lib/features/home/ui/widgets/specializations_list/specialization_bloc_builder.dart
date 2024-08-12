import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/features/home/logic/home_cubit.dart';
import 'package:flutter_complete_project/features/home/logic/home_state.dart';
import 'package:flutter_complete_project/features/home/ui/widgets/doctors_list/doctor_shimmer_loading.dart';
import 'package:flutter_complete_project/features/home/ui/widgets/specializations_list/speciality_list_view.dart';
import 'package:flutter_complete_project/features/home/ui/widgets/specializations_list/speciality_shimmer_loading.dart';

class SpecializationsBlocBuilder extends StatelessWidget {
  const SpecializationsBlocBuilder({super.key});

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
          specializationSuccess: (specializationsList) {
            return setupSuccess(specializationsList);
          },
          specializationError: (error) => setupError(),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }

// Shimmer Loading for Specializations and Doctors
  Widget setupLoading() {
    return Expanded(
        child: Column(
      children: [
        const SpecialityShimmerLoading(),
        verticalSpace(8),
        const DoctorsShimmerLoading(),
      ],
    ));
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }

  Widget setupSuccess(specializationsList) {
    return SpecialityListView(
      specializationsList: specializationsList ?? [],
    );
  }
}
