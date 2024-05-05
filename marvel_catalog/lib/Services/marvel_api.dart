import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:marvel_catalog/helpers/utils.dart';
import 'package:marvel_catalog/models/character_model.dart';

class MarvelApi {
  static const String _baseUrl = 'https://gateway.marvel.com/v1/public';
  static const String _publicKey = 'bcd7dfd6fb853fddbea8e8fd0e69dee9';
  static const String _privateKey = '31120bb957a8d20b3899d3c695f02603eaf6d1a9';

  Future<List<Character>> getCharacters(int offset, int limit) async {
    final timeStamp = DateTime.now().millisecondsSinceEpoch;
    var hash =
        Utils.generateMarvelHash(timeStamp.toString(), _publicKey, _privateKey);

    try {
      var response = await http.get(Uri.parse(
          '$_baseUrl/characters?ts=$timeStamp&apikey=$_publicKey&hash=$hash&offset=$offset&limit=$limit'));

      final data =
          json.decode(response.body)['data']['results'] as List<dynamic>;

      return data.map((json) => Character.fromJson(json)).toList();
    } catch (e) {
      throw Exception;
    }
  }

  static Future<Character> fetchCharacter(int characterId) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/characters/$characterId?apikey=$_publicKey'),
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body)['data']['results'][0];
      final id = jsonData['id'];
      final name = jsonData['name'];
      final thumbnailUrl = jsonData['thumbnail']['path'] +
          '.' +
          jsonData['thumbnail']['extension'];
      final description = jsonData['description'];

      final comics = jsonData['comics']['items']
          .map<String>((comic) => comic['name'])
          .toList()
          .cast<String>();

      return Character(
        id: id,
        name: name,
        imageUrl: thumbnailUrl,
        description: description,
        comics: comics,
      );
    } else {
      throw Exception('Failed to load character');
    }
  }
}
