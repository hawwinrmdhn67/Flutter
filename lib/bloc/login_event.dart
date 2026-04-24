// Event = aksi dari UI (misalnya klik tombol)

abstract class LoginEvent {}

class LoginButtonPressed extends LoginEvent {

  // 👉 COMMAND 1:
  // ambil input username dari TextField
  final String username;

  // 👉 COMMAND 2:
  // ambil input password dari TextField
  final String password;

  // 👉 COMMAND 3:
  // kirim data ke Bloc saat tombol login ditekan
  LoginButtonPressed(this.username, this.password);
}