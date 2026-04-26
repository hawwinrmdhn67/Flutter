import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/login_bloc.dart';
import '../bloc/login_event.dart';
import '../bloc/login_state.dart';
import '../routes.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        title: const Text("Login"),
        backgroundColor: Colors.green,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40),

            // Icon / Header
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.green,
              child: Icon(Icons.person, size: 50, color: Colors.white),
            ),

            const SizedBox(height: 20),

            const Text(
              "Selamat Datang",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            const Text(
              "Silakan login untuk melanjutkan",
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 30),

            // CARD LOGIN
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      // USERNAME
                      TextField(
                        controller: usernameController,
                        decoration: InputDecoration(
                          labelText: "Username",
                          prefixIcon: const Icon(Icons.person, color: Colors.green),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),

                      const SizedBox(height: 15),

                      // PASSWORD
                      TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Password",
                          prefixIcon: const Icon(Icons.lock, color: Colors.green),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),

                      const SizedBox(height: 25),

                      // BUTTON LOGIN
                      BlocConsumer<LoginBloc, LoginState>(
                        listener: (context, state) {
                          if (state is LoginSuccess) {
                            Navigator.pushReplacementNamed(
                              context,
                              AppRoutes.profile,
                              arguments: state.user, // kirim data user
                            );
                          } else if (state is LoginFailure) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(state.error)),
                            );
                          }
                        },
                        builder: (context, state) {
                          if (state is LoginLoading) {
                            return const CircularProgressIndicator();
                          }

                          return SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              onPressed: () {
                                final username = usernameController.text.trim();
                                final password = passwordController.text.trim();

                                if (username.isEmpty || password.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Username & Password wajib diisi"),
                                    ),
                                  );
                                  return;
                                }

                                context.read<LoginBloc>().add(
                                      LoginButtonPressed(
                                        username,
                                        password,
                                      ),
                                    );
                              },
                              child: const Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16),
                              ),
                            ),
                          );
                        },
                      ),

                      const SizedBox(height: 15),

                      // INFO LOGIN
                      const Text(
                        "Gunakan akun:",
                        style: TextStyle(color: Colors.grey),
                      ),
                      const Text(
                        "emilys / emilyspass",
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}