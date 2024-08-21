import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:takehomechallenge_anggreni/models/character.dart';

class ApiService {
  final String baseUrl = 'https://rickandmortyapi.com/api/character';

  Future<List<Character>> fetchCharacters() async {
    List<Character> allCharacters = [];
    String? nextUrl = baseUrl;

    while (nextUrl != null) {
      final response = await http.get(Uri.parse(nextUrl));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final List results = data['results'];
        allCharacters
            .addAll(results.map((e) => Character.fromJson(e)).toList());
        nextUrl = data['info']['next'];
      } else {
        throw Exception('Failed to load characters');
      }
    }

    return allCharacters;
  }

  Future<List<Character>> searchCharacters(String query) async {
    final response = await http.get(Uri.parse('$baseUrl/?name=$query'));

    if (response.statusCode == 200) {
      final List results = jsonDecode(response.body)['results'];
      return results.map((e) => Character.fromJson(e)).toList();
    } else {
      throw Exception('Failed to search characters');
    }
  }
}
