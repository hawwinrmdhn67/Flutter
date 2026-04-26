import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'pages/profile.dart';

class AppRoutes {

  static const String login = '/login';
  
  static const String profile = '/profile';

  static Route<dynamic> generateRoute(RouteSettings settings) {

    switch (settings.name) {

      case login:

        return MaterialPageRoute(builder: (_) => LoginPage());

      case profile:

        return MaterialPageRoute(builder: (_) => const ProfilePage());

      default:

        return MaterialPageRoute(builder: (_) => LoginPage());
    }
  }
}