import 'package:application/views/page_acceuil.dart';
import 'package:flutter/material.dart';

abstract class Routeur {
  //Definir les routes de l'application
  static const String routeAccueil = '/page-acceuil';

  //Map des routes de l'application
  static Map<String, WidgetBuilder> toutesLesRoutes = {
    routeAccueil: (context) => const PageAcceuil(),
  };

  static Route<dynamic> routeParDefaut(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => const PageAcceuil());
  }
}
