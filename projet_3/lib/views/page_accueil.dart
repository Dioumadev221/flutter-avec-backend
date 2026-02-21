import 'package:flutter/material.dart';

import '../core/services/api_servise.dart';

class PageAccueil extends StatefulWidget {
  const PageAccueil({super.key});

  @override
  State<PageAccueil> createState() => _PageAccueilState();
}

class _PageAccueilState extends State<PageAccueil> {
  final List<Map<String, dynamic>> _utilisateurs = [];
  String? erreur;
  bool estEnChargement = false;

  @override
  void initState() {
    super.initState();
    _chargerUtilisateurs();
  }

  Future<void> _chargerUtilisateurs() async {
    estEnChargement = true;
    erreur = null;
    setState(() {});
    try {
      final utilisateurs = await ApiService.fetchAllUsers();
      print("Utilisateurs chargés : $utilisateurs");
      _utilisateurs.clear();
      _utilisateurs.addAll(utilisateurs);
    } catch (e) {
      print("Erreur lors du chargement des utilisateurs");
      erreur = e.toString();
    } finally {
      setState(() {
        estEnChargement = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accueil'),
      ),
      body: estEnChargement
          ? const Center(child: CircularProgressIndicator())
          : erreur != null
          ? Center(
        child: Text(
          erreur!,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ),
      )
          : RefreshIndicator(
        onRefresh: _chargerUtilisateurs,
        child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: _utilisateurs.length,
          itemBuilder: (context, i) {
            final utilisateur = _utilisateurs[i];
            return Card(
              child: ListTile(
                leading: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.pinkAccent,
                      width: 4,
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                      "https://i.pravatar.cc/150?img=${utilisateur['id']}",
                    ),
                  ),
                ),
                title: Text("${utilisateur['nomComplet']}"),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.location_on, size: 14, color: Colors.redAccent),
                        const SizedBox(width: 4),
                        Expanded(child: Text("${utilisateur['adresse']}", overflow: TextOverflow.ellipsis)),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.phone, size: 14, color: Colors.green),
                        const SizedBox(width: 4),
                        Text("${utilisateur['numeroTelephone']}"),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.calendar_today, size: 14, color: Colors.blueAccent),
                        const SizedBox(width: 4),
                        Text("${utilisateur['dateInscription']}"),
                      ],
                    ),
                  ],
                ),
                isThreeLine: true,
              ),
            );
          },
        ),
      ),
    );
  }
}