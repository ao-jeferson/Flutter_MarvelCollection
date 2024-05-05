import 'package:marvel_catalog/Services/marvel_api.dart';
import 'package:marvel_catalog/models/character_model.dart';
import 'package:mobx/mobx.dart';

part 'character_store.g.dart';

class CharacterStore = _CharacterStore with _$CharacterStore;

abstract class _CharacterStore with Store {
  final MarvelApi _api = MarvelApi();
  final ObservableList<Character> characters = ObservableList<Character>();
  int _init = 0;

  @action
  Future<void> fetchCharacters() async {
    final Map<String, dynamic> response = await _api.getCharacters(_init);
    final List<dynamic> results = response['data']['results'];
    final List<Character> fetchedCharacters =
        results.map((json) => Character.fromJson(json)).toList();
    characters.addAll(fetchedCharacters);
    _init += 20;
  }
}
