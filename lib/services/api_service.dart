import 'dart:convert';
import 'package:http/http.dart' as http;

// ApiService = tempat semua komunikasi ke server (API)
class ApiService {

  // function login untuk kirim username & password ke API
  Future<Map<String, dynamic>> login(
      String username, String password) async {

    // 👉 COMMAND 1:
    // kirim request POST ke server
    final response = await http.post(
      Uri.parse('https://dummyjson.com/auth/login'),

      // 👉 COMMAND 2:
      // header: memberi tahu server bahwa kita kirim JSON
      headers: {
        'Content-Type': 'application/json',
      },

      // 👉 COMMAND 3:
      // body: data yang dikirim ke API (username & password)
      body: jsonEncode({
        'username': username,
        'password': password,
      }),
    );

    // 👉 COMMAND 4:
    // ubah response JSON menjadi Map (biar bisa dipakai di Dart)
    final data = jsonDecode(response.body);

    // 👉 COMMAND 5:
    // cek apakah login berhasil (status 200)
    if (response.statusCode == 200) {

      // 👉 COMMAND 6:
      // jika berhasil → kirim data user ke Bloc
      // (berisi token, username, dll)
      return data;

    } else {

      // 👉 COMMAND 7:
      // jika gagal → lempar error ke Bloc
      throw Exception(data['message'] ?? 'Login gagal');
    }
  }
}