import 'package:marvel_catalog/Services/marvel_api.dart';
import 'package:marvel_catalog/models/character_model.dart';
import 'package:mobx/mobx.dart';

part 'character_store.g.dart';

class CharacterStore = _CharacterStore with _$CharacterStore;

abstract class _CharacterStore with Store {
  final MarvelApi _apiService = MarvelApi();
  final int _limit = 10;
  int _interval = 0;

  @observable
  ObservableList<Character> characters = ObservableList<Character>();

  @observable
  bool isLoading = false;

  @observable
  int interval = 0;

  @action
  Future<void> fetchCharacters() async {
    final List<Character> newCharacters =
        await _apiService.getCharacters(_interval, _limit);

    characters.addAll(newCharacters);
    _interval += _limit;
  }
}
