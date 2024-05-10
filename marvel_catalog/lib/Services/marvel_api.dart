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

  static Future<Map<String, dynamic>> fetchCharacterDetail(
      int characterId) async {
    final ts = DateTime.now().millisecondsSinceEpoch;
    var hash = Utils.generateMarvelHash(ts.toString(), _publicKey, _privateKey);

    final response = await http.get(Uri.parse(
        '$_baseUrl/characters/$characterId?ts=$ts&apikey=$_publicKey&hash=$hash'));

    if (response.statusCode == 200) {
      return json.decode(response.body)['data']['results'][0];
    } else {
      throw Exception('Failed to load character');
    }
  }

  static Future<List<Map<String, dynamic>>> fetchComics(
      int characterId, int offset) async {
    final ts = DateTime.now().millisecondsSinceEpoch;
    var hash = Utils.generateMarvelHash(ts.toString(), _publicKey, _privateKey);

    final response = await http.get(Uri.parse(
        '$_baseUrl/characters/$characterId/comics?ts=$ts&apikey=$_publicKey&hash=$hash&offset=$offset'));

    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(
          json.decode(response.body)['data']['results']);
    } else {
      throw Exception('Failed to load comics');
    }
  }
}
