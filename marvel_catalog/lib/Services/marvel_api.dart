import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:marvel_catalog/helpers/utils.dart';

class MarvelApi {
  String baseUrl = 'https://gateway.marvel.com/v1/public';
  String publicKey = 'bcd7dfd6fb853fddbea8e8fd0e69dee9';
  String privateKey = '31120bb957a8d20b3899d3c695f02603eaf6d1a9';

  Future<Map<String, dynamic>> getCharacters(int init) async {
    final timeStamp = DateTime.now().millisecondsSinceEpoch.toString();
    final hash = generateMd5(timeStamp + privateKey + publicKey);
    final response = await http.get(Uri.parse(
      '$baseUrl/characters?ts=$timeStamp&apikey=$publicKey&hash=$hash&init=$init',
    ));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load characters');
    }
  }

  String generateMd5(String value) {
    return Utils.generateMd5(value);
  }
}
