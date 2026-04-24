// State = kondisi yang dikirim dari Bloc ke UI

abstract class LoginState {}


// 👉 STATE 1: kondisi awal (belum ngapa-ngapain)
class LoginInitial extends LoginState {}


// 👉 STATE 2: saat proses login berjalan
// biasanya UI tampilkan loading spinner
class LoginLoading extends LoginState {}


// 👉 STATE 3: login berhasil
// membawa data user dari API
class LoginSuccess extends LoginState {

  // 👉 COMMAND:
  // simpan data user (username, token, dll)
  final Map<String, dynamic> user;

  LoginSuccess(this.user);
}


// 👉 STATE 4: login gagal
// membawa pesan error
class LoginFailure extends LoginState {

  // 👉 COMMAND:
  // simpan pesan error untuk ditampilkan di UI
  final String error;

  LoginFailure(this.error);
}