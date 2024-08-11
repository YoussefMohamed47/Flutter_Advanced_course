import 'package:bloc/bloc.dart';
import 'package:flutter_complete_project/features/home/data/repos/home_repo.dart';
import 'package:flutter_complete_project/features/home/logic/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(const HomeState.initial());

  void getSpecializations() async {
    emit(const HomeState.specializationLoading());
    final response = await _homeRepo.getSpeialization();
    response.when(
      success: (specializationResponseModel) {
        emit(HomeState.specializationSuccess(specializationResponseModel));
      },
      failure: (errorHandler) {
        emit(HomeState.specializationError(errorHandler));
      },
    );
  }
}
