import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'pages/profile.dart';

// AppRoutes = tempat mengatur semua navigasi halaman
class AppRoutes {

  // 👉 COMMAND 1:
  // nama route untuk login page
  static const String login = '/login';

  // 👉 COMMAND 2:
  // nama route untuk profile page
  static const String profile = '/profile';

  // 👉 COMMAND 3:
  // fungsi untuk menentukan halaman mana yang ditampilkan
  static Route<dynamic> generateRoute(RouteSettings settings) {

    // 👉 COMMAND 4:
    // cek route yang dipanggil
    switch (settings.name) {

      case login:
        // 👉 COMMAND 5:
        // jika route = /login → buka LoginPage
        return MaterialPageRoute(builder: (_) => LoginPage());

      case profile:
        // 👉 COMMAND 6:
        // jika route = /profile → buka ProfilePage
        return MaterialPageRoute(builder: (_) => const ProfilePage());

      default:
        // 👉 COMMAND 7:
        // jika route tidak dikenali → fallback ke LoginPage
        return MaterialPageRoute(builder: (_) => LoginPage());
    }
  }
}