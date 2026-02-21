import 'package:flutter/material.dart';

import 'config/routeur.dart';
import 'core/constant/app_constants.dart';
import 'core/localization/app_locale.dart';
import 'core/theme/theme_perso.dart';

void main() {
  runApp(const MonApplication());
}

class MonApplication extends StatelessWidget {
  const MonApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //TITRE DE APPLICATION
      title: AppConstants.titreApplication,
      //supprimer le debug banner
      debugShowCheckedModeBanner: false,
      //les route de l'application
      routes: Routeur.touesLesRoutes,
      initialRoute: Routeur.routeAccueil,
      onUnknownRoute: Routeur.routeParDefaut,
      //theme de L'application
      theme: ThemePerso.modeClair,
      darkTheme: ThemePerso.modeSombre,
      themeMode: ThemeMode.system,

      //
      locale: AppLocale.localeParDefaut,
      supportedLocales: AppLocale.toutesLesLocales,
      localizationsDelegates: AppLocale.delegates,
      localeResolutionCallback: AppLocale.resolutionLocaleParDefaut,
    );
  }
}
