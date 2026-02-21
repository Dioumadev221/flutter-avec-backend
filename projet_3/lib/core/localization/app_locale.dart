

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class   AppLocale {
  static Locale localeParDefaut=Locale('fr','FR');
  static List<Locale>toutesLesLocales=[
    Locale('fr','FR'),
    Locale('en','US'),
    Locale('ar','SA'),
  ];
  //les delegates de localisation
  static List<LocalizationsDelegate<dynamic>>delegates=[
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate
  ];
  static Locale resolutionLocaleParDefaut(Locale?locale,
      Iterable<Locale>supportedLocales,
  ){
    if(locale!=null){
      for(Locale supportedLocale in supportedLocales){
        if (supportedLocale.languageCode==locale.languageCode&& supportedLocale.countryCode==locale.countryCode){
          return supportedLocale;
        }
      }
    }
    return localeParDefaut;
  }
}