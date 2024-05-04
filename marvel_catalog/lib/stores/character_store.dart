import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:marvel_catalog/models/character_model.dart';
import 'package:mobx/mobx.dart';
part 'character_store.g.dart';

class CharacterStore = _CharacterStore with _$CharacterStore;

abstract class _CharacterStore with Store {
  @observable
  ObservableList<Character> characters = ObservableList<Character>();

  @action
  Future<void> fetchCharacters() async {
    final response =
        await http.get(Uri.parse('https://www.marvel.com/characters'));
    final jsonData = json.decode(response.body);

    for (var character in jsonData['results']) {
      characters.add(Character(
          id: int.parse(character['int']),
          name: character['name'],
          thumbnail: character['thumbnail']));
    }
  }
}
