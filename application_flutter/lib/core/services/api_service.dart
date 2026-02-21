import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

abstract class ApiService {
  static const String _baseUrl = 'https://retoolapi.dev/8T4E0Z/data';

  static Future<List<Map<String, dynamic>>> fetchAllUsers() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));
      if (response.statusCode == 200) {
        final dynamic data = jsonDecode(response.body);
        // from convertir les données (data) en List<Map<String, dynamic>>
        final contenuArenvoyer = List<Map<String, dynamic>>.from(data);
        return contenuArenvoyer;
      } else {
        final code = response.statusCode;
        final raison = response.reasonPhrase;
        throw Exception(
          'Erreur de chargement des données: $code ,$raison',
        );
      }
    } catch (e, stackTrace) {
      //StackTrace permet de suivre l'origine de l'erreur dans le code
      if (kDebugMode) {
        print('Une erreur s\'est produite: $e,$stackTrace');
      }
      //rethrow permet de relancer l'erreur pour qu'elle puisse être gérée à un niveau précis de l'application
      rethrow;
    }
  }
}
