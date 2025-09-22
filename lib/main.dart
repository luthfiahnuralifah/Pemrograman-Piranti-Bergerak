import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profil Mahasiswa',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.pink),
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int selectedIndex = 0;

  // Data Diri
  final String namaLengkap = "Luthfiah Nur Alifah";
  final String namaPanggilan = "Upi";
  final String nim = "2309106102";
  final String prodi = "Informatika";
  final String fakultas = "Fakultas Teknik";
  final String universitas = "Universitas Mulawarman";

  // Tentang Saya
  final List<String> peminatan = [
    "Artificial Intelligence (AI)",
    "Data Science",
  ];
  final List<String> hobi = ["Membaca", "Jalan-jalan", "Memasak", "Tidur"];
  final List<String> keahlian = ["Bisa membaca pikiran"];
  final String citaCita = "Sukses Dunia dan Akhirat";

  // Kontak
  final String email = "upi@gmail.com";
  final String whatsapp = "0812-3456-7890";
  final String instagram = "luthfiahnuralifah";
  final String xAccount = "upiupiaja";
  final String facebook = "cumaupi";

  // Konten sesuai tab
  Widget buildContent() {
    if (selectedIndex == 0) {
      // Data Diri
      return Column(
        children: [
          buildCard(Icons.person, "Nama Lengkap", namaLengkap),
          buildCard(Icons.tag, "Nama Panggilan", namaPanggilan),
          buildCard(Icons.badge, "NIM", nim),
          buildCard(Icons.school, "Prodi", prodi),
          buildCard(Icons.account_balance, "Fakultas", fakultas),
          buildCard(Icons.apartment, "Universitas", universitas),
        ],
      );
    } else if (selectedIndex == 1) {
      // Tentang Saya
      return Column(
        children: [
          buildCard(Icons.computer, "Peminatan", peminatan.join(", ")),
          buildCard(Icons.favorite, "Hobi", hobi.join(", ")),
          buildCard(Icons.star, "Keahlian", keahlian.join(", ")),
          buildCard(Icons.flag, "Cita-cita", citaCita),
        ],
      );
    } else {
      // Kontak
      return Column(
        children: [
          buildCard(Icons.email, "Email", email),
          buildCard(Icons.chat, "WhatsApp", whatsapp),
          buildCard(Icons.camera_alt, "Instagram", instagram),
          buildCard(Icons.alternate_email, "X", xAccount),
          buildCard(Icons.people, "Facebook", facebook),
        ],
      );
    }
  }

  // Card reusable dengan ikon
  Widget buildCard(IconData icon, String title, String value) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(icon, color: Colors.pink[300]),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(value, style: const TextStyle(fontSize: 14)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        title: const Text("Profil Mahasiswa"),
        backgroundColor: Colors.pink,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Foto Profil + Nama
            Column(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage("assets/upi.jpg"),
                ),
                const SizedBox(height: 10),
                Text(
                  namaLengkap,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Tab Menu
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildTab("Data Diri", 0),
                _buildTab("Tentang Saya", 1),
                _buildTab("Kontak", 2),
              ],
            ),
            const Divider(thickness: 1.2),

            // Isi konten
            const SizedBox(height: 10),
            Expanded(child: SingleChildScrollView(child: buildContent())),
          ],
        ),
      ),
    );
  }

  // Widget untuk Tab Menu
  Widget _buildTab(String label, int index) {
    final isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected ? Colors.pink : Colors.grey,
            ),
          ),
          if (isSelected)
            Container(
              margin: const EdgeInsets.only(top: 4),
              height: 3,
              width: 50,
              color: Colors.pink,
            ),
        ],
      ),
    );
  }
}
