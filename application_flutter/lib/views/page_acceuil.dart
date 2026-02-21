import 'package:application/core/services/api_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PageAcceuil extends StatefulWidget {
  const PageAcceuil({super.key});

  @override
  State<PageAcceuil> createState() => _PageAcceuilState();
}

class _PageAcceuilState extends State<PageAcceuil> {
  final List<Map<String, dynamic>> _utilisateurs = [];
  //erreur peut être null, d'où le ? sur le type String
  String? erreur;
  bool estChargement = false;

  //initState est appelé une seule fois, au moment de la création du widget, avant le build
  @override
  void initState() {
    super.initState();
    _chargerUtilisateurs();
  }

  Future<void> _chargerUtilisateurs() async {
    estChargement = true;
    erreur = null;
    setState(() {});
    try {
      final resultatRecu = await ApiService.fetchAllUsers();
     
        print("Resultat reçu: $resultatRecu");

      _utilisateurs.clear(); //vide la liste avant de la remplir à nouveau
      _utilisateurs.addAll(
        resultatRecu,
      ); //ajoute tous les éléments du résultat à la liste des utilisateurs
    } catch (e) {
      if (kDebugMode) {
        print('Erreur lors du chargement des utilisateurs: $e');
      }
      erreur = e.toString();
    } finally {
      //finally est exécuté que l'opération réussisse ou échoue,
      estChargement = false;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Acceuil")),
      body: estChargement
          ? Center(child: CircularProgressIndicator())
          : erreur != null
          ? Center(
              child: Text(
                "Erreur: $erreur",
                style: TextStyle(color: Colors.red, fontSize: 25),
              ),
            )
          : RefreshIndicator(
              onRefresh: _chargerUtilisateurs,
              child: ListView.builder(
                //physics: const AlwaysScrollableScrollPhysics(),//
                physics: const AlwaysScrollableScrollPhysics(),
                itemBuilder: (context, i) {
                  return Card(
                    child: ListTile(
                      leading: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color.fromARGB(255, 221, 149, 142),
                            width: 2,
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(
                            //encodeComponent permet de convertir les caractères spéciaux en une forme compatible avec les URL
                            "https://ui-avatars.com/api/?name=${Uri.encodeComponent(_utilisateurs[i]['nomEntreprise'])}&size=128&background=random"
                          ),
                          //Gestion des erreurs de chargement de l'image
                          onBackgroundImageError: (error, stackTrace) {
                            // Optionnel : fallback si l'image ne se charge pas
                              print("Erreur chargement avatar pour ${_utilisateurs[i]['nomEntreprise']}: $error");
                          },
                        ),
                      ),
                      title: Text(
                        "Nom: ${_utilisateurs[i]['nomEntreprise']}\nAdresse: ${_utilisateurs[i]['adresseEn']}",
                      ),
                      subtitle: Text(
                        "Date de création: ${_utilisateurs[i]['dateCreation']}",
                      ),
                    ),
                  );
                },
                //recupéer la taille du tableau
                itemCount: _utilisateurs.length,
              ),
            ),
    );
  }
}
