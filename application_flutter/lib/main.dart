import 'package:application/config/routeur.dart';
import 'package:application/core/theme/theme_perso.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MonApplication());
}

class MonApplication extends StatelessWidget {
  const MonApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Titre de l'application
      title: "Mon application", 

      //suopprimer le bugs banner
      debugShowCheckedModeBanner: false,
      //Gérer les routes de l'application
      routes: Routeur.toutesLesRoutes,
      initialRoute: Routeur.routeAccueil,
      //Route par defauts
      onUnknownRoute: Routeur.routeParDefaut,

      // Theme de l'application
      theme: ThemePerso.modeClair,
      darkTheme: ThemePerso.modeSombre,
      themeMode: ThemeMode.system,
    );
  }
}
