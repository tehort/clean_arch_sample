import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  // final RestorePreviousSessionUseCase _restorePreviousSessionUseCase;
  // Restore_previous_session_use_case

  AppCubit(
      // this._restorePreviousSessionUseCase
      )
      : super(const AppState(pageStack: PageStack.splash)) {
    // _restorePreviousSession();
    Future.delayed(const Duration(seconds: 2)).then((value) => changeStack(PageStack.login));
    // changeStack(PagesStack.loginStack);
  }

  // void _restorePreviousSession() {
  //   // auth_restore_previous_session_use_case();
  // }

  void changeStack(PageStack val) {
    emit(state.copyWith(stack: val));
  }
}
