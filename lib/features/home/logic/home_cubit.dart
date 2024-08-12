import 'package:bloc/bloc.dart';
import 'package:flutter_complete_project/core/helpers/extentions.dart';
import 'package:flutter_complete_project/core/networking/api_error_handler.dart';
import 'package:flutter_complete_project/features/home/data/models/specializations_response_model.dart';
import 'package:flutter_complete_project/features/home/data/repos/home_repo.dart';
import 'package:flutter_complete_project/features/home/logic/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(const HomeState.initial());

  List<SpecializationsData?>? specializationsList = [];

  void getSpecializations() async {
    emit(const HomeState.specializationLoading());
    final response = await _homeRepo.getSpeialization();
    response.when(
      success: (specializationResponseModel) {
        specializationsList =
            specializationResponseModel.specializationDataList ?? [];

        getDoctorsList(specializationId: specializationsList?.first?.id);

        emit(HomeState.specializationSuccess(specializationsList));
      },
      failure: (errorHandler) {
        emit(HomeState.specializationError(errorHandler));
      },
    );
  }

  void getDoctorsList({required int? specializationId}) {
    List<Doctors?>? doctorsList =
        getDoctorsListBySpecializationId(specializationId);
    if (!doctorsList.isNullOrEmpty()) {
      emit(HomeState.doctorsSuccess(doctorsList));
    } else {
      emit(
        const HomeState.doctorsError(),
      );
    }
  }

  /// Returns the list of doctors based on the specialization id
  getDoctorsListBySpecializationId(int? specializationId) {
    return specializationsList
        ?.firstWhere(
          (specialization) => specialization?.id == specializationId,
        )
        ?.doctorsList;
  }
}
