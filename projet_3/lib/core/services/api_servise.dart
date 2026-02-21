import 'dart:convert';

import 'package:http/http.dart' as http;

abstract class ApiService {
  static const String _urlBase = 'https://retoolapi.dev/yPojTw/data';

  static Future<List<Map<String, dynamic>>> fetchAllUsers() async {
    try {
      final response = await http.get(Uri.parse(_urlBase));
      if (response.statusCode == 200) {
        final dynamic data = jsonDecode(response.body);
        return List<Map<String, dynamic>>.from(data);
      } else {
        final code = response.statusCode;
        final raison = response.reasonPhrase;
        throw Exception('Erreur $code : $raison');
      }
    } catch (e, stackTrace) {
      print('Erreur : $e,$stackTrace');
      rethrow;
    }
  }
}