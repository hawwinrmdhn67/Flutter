import 'package:flutter_bloc/flutter_bloc.dart';
import '../services/api_service.dart';
import 'login_event.dart';
import 'login_state.dart';

// Bloc = penghubung antara UI dan API
class LoginBloc extends Bloc<LoginEvent, LoginState> {

  // ambil ApiService untuk akses API
  final ApiService apiService;

  // set state awal = LoginInitial
  LoginBloc(this.apiService) : super(LoginInitial()) {

    // dengarkan event ketika tombol login ditekan
    on<LoginButtonPressed>((event, emit) async {

      // 👉 COMMAND 1:
      // kirim state loading ke UI
      // biasanya UI akan tampilkan loading spinner
      emit(LoginLoading());

      try {
        // 👉 COMMAND 2:
        // kirim username & password ke API
        // tunggu response dari server
        final user = await apiService.login(
          event.username,
          event.password,
        );

        // 👉 COMMAND 3:
        // jika login berhasil
        // kirim data user ke UI
        // UI akan pindah ke halaman profile
        emit(LoginSuccess(user));

      } catch (e) {

        // 👉 COMMAND 4:
        // jika terjadi error (misal password salah)
        // kirim pesan error ke UI
        emit(LoginFailure(
          e.toString().replaceAll("Exception: ", ""),
        ));
      }
    });
  }
}