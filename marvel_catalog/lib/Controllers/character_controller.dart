import 'package:marvel_catalog/Services/marvel_api.dart';
import 'package:marvel_catalog/models/character_model.dart';
import 'package:marvel_catalog/models/comics_model.dart';
import 'package:mobx/mobx.dart';

part '../stores/character_controller.g.dart';

class CharacterController = _CharacterController with _$CharacterController;

abstract class _CharacterController with Store {
  final MarvelApi _apiService = MarvelApi();
  final int _limit = 20;
  int _interval = 0;

  @observable
  ObservableList<Character> characters = ObservableList<Character>();

  @observable
  Character? character;

  @observable
  ObservableList<Comics> comics = ObservableList<Comics>();

  @observable
  bool isLoading = false;

  @observable
  int interval = 0;

  @observable
  int characterId = 0;

  @action
  void setCharacterId(int id) {
    characterId = id;
  }

  @action
  Future<void> fetchCharacters() async {
    final List<Character> newCharacters =
        await _apiService.getCharacters(_interval, _limit);

    characters.addAll(newCharacters);
    _interval += _limit;
  }

  @action
  Future<void> fetchCharacter(int characterId) async {
    isLoading = true;
    try {
      final result = await MarvelApi.fetchCharacterDetail(characterId);
      character = Character.fromJson(result);
    } catch (e) {
      print("Error fetching character: $e");
    }
    isLoading = false;
  }

  @action
  Future<void> fetchComics(int characterId, int offset) async {
    isLoading = true;
    try {
      final results = await MarvelApi.fetchComics(characterId, offset);
      final List<Comics> fetchedComics =
          results.map((e) => Comics.fromJson(e)).toList();
      comics.addAll(fetchedComics);
    } catch (e) {
      print("Error fetching comics: $e");
    }
    isLoading = false;
  }
}
