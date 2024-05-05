import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:marvel_catalog/helpers/utils.dart';
import 'package:marvel_catalog/models/character_model.dart';

class MarvelApi {
  String baseUrl = 'https://gateway.marvel.com/v1/public';
  String publicKey = 'bcd7dfd6fb853fddbea8e8fd0e69dee9';
  String privateKey = '31120bb957a8d20b3899d3c695f02603eaf6d1a9';

  Future<List<Character>> getCharacters(int offset, int limit) async {
    final timeStamp = DateTime.now().millisecondsSinceEpoch;
    var hash =
        Utils.generateMarvelHash(timeStamp.toString(), publicKey, privateKey);

    try {
      var response = await http.get(Uri.parse(
          '$baseUrl/characters?ts=$timeStamp&apikey=$publicKey&hash=$hash&offset=$offset&limit=$limit'));

      final data =
          json.decode(response.body)['data']['results'] as List<dynamic>;

      return data.map((json) => Character.fromJson(json)).toList();
    } catch (e) {
      throw Exception;
    }
  }
}
