import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Profil Saya"),
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),

            // Foto Profil
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/profil.jpeg'),
            ),

            const SizedBox(height: 20),

            const Text(
              "Muchammad Hawwin Romadhon",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            
            const SizedBox(height: 5),

            const Text(
              "Politeknik Elektronika Negeri Surabaya",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 30),

            // Card Profil
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
                    children: const [
                      ListTile(
                        leading: Icon(Icons.person, color: Colors.green),
                        title: Text("Nama"),
                        subtitle: Text("Muchammad Hawwin Romadhon"),
                      ),
                      Divider(),

                      ListTile(
                        leading: Icon(Icons.badge, color: Colors.green),
                        title: Text("NRP"),
                        subtitle: Text("3124521003"),
                      ),
                      Divider(),

                      ListTile(
                        leading: Icon(Icons.school, color: Colors.green),
                        title: Text("Jurusan"),
                        subtitle: Text("Teknik Informatika"),
                      ),
                      Divider(),

                      ListTile(
                        leading: Icon(Icons.code, color: Colors.green),
                        title: Text("Hobi"),
                        subtitle: Text("Coding"),
                      ),
                      Divider(),

                      ListTile(
                        leading: Icon(Icons.workspace_premium, color: Colors.green),
                        title: Text("Cita-cita"),
                        subtitle: Text("Software Engineer"),
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