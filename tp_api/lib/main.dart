import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: UsersPage(),
    );
  }
}

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {

  List users = [];

  Future fetchUsers() async {
    final response = await http.get(
      Uri.parse("https://retoolapi.dev/i5VMRO/data"),
    );

    if (response.statusCode == 200) {
      setState(() {
        users = jsonDecode(response.body);
      });
    } else {
      print("Erreur API : ${response.statusCode}");
    }
  }

  @override
  void initState() {
    super.initState();
    fetchUsers(); // Appelle l'API au démarrage
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Liste des employés")),
      body: users.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final u = users[index];
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    title: Text(u['nomCompletUser']),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Poste: ${u['posteOccupe']}"),
                        Text("Entreprise: ${u['nomEntreprise']}"),
                        Text("Date: ${u['dateEmbauche']}"),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}