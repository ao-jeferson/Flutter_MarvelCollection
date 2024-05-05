import 'package:marvel_catalog/helpers/utils.dart' as helper;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:marvel_catalog/models/character_model.dart';

class Service {
  final String baseUrl = 'https://gateway.marvel.com/v1/public';
  final String publicKey = 'bcd7dfd6fb853fddbea8e8fd0e69dee9';
  final String privateKey = '31120bb957a8d20b3899d3c695f02603eaf6d1a9';

  helper.Utils hp = helper.Utils();

  Future<List<Character>> fetchData() async {
    final timeStamp = DateTime.now().millisecondsSinceEpoch.toString();
    final String hash = hp.generateMarvelHash(publicKey, privateKey);
    List<Character> characters = [];

    final response = await http.get(
      '$baseUrl/characters?ts=$timeStamp&apikey=$publicKey&hash=$hash' as Uri,
    );

    final jsonData = json.decode(response.body);

    for (var c in jsonData['results']) {
      characters.add(Character(
        id: int.parse(c['id']),
        name: c['name'],
        thumbnail: c['thumbnail'],
        // description: character['description'],
      ));
    }

    return characters;
  }
}
