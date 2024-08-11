import 'package:flutter_complete_project/core/networking/api_error_handler.dart';
import 'package:flutter_complete_project/features/home/data/models/specializations_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part "home_state.freezed.dart";

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;

  // Specializations
  const factory HomeState.specializationLoading() = SpecializationsLoading;
  const factory HomeState.specializationSuccess(
          SpecializationsResponseModel specializationsResponseModel) =
      SpecializationSuccess;
  const factory HomeState.specializationError(ErrorHandler error) =
      SpecializationsError;
}
