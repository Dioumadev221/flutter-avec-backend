import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../views/page_accueil.dart';
import '../views/page_boutique.dart';
import '../views/page_compteur.dart';
import '../views/page_profil.dart';

abstract class Routeur {
  // definir les routes de l'application
  static const String routeAccueil='/page-accueil';
  static const String pageCompteur='/page-compteur';
  static const String pageBoutique='/page-boutique';
  static const String pageProfil='/page-profil';
static final Map< String,WidgetBuilder> touesLesRoutes={
  routeAccueil:(context)=>PageAccueil(),
  pageCompteur:(context)=>PageCompteur(),
  pageBoutique:(context)=>PageBoutique(),
  pageProfil:(context)=>PageProfil(),
};

//Route pardefaut
static Route<dynamic>routeParDefaut(RouteSettings settings){
  return MaterialPageRoute(builder: (context)=>PageAccueil());
}
}