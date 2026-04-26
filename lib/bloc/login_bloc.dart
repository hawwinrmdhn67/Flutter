import 'package:flutter_bloc/flutter_bloc.dart';
import '../services/api_service.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final ApiService apiService;

  LoginBloc(this.apiService) : super(LoginInitial()) {
    on<LoginButtonPressed>((event, emit) async {
      emit(LoginLoading());

      try {
        final user = await apiService.login(event.username, event.password);

        emit(LoginSuccess(user));
        
      } catch (e) {

        emit(LoginFailure(e.toString().replaceAll("Exception: ", "")));
      }
    });
  }
}
