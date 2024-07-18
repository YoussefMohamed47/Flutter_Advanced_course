import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/features/login/data/repos/login_repo.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;

  LoginCubit(this._loginRepo) : super(const LoginState.initial());
}
