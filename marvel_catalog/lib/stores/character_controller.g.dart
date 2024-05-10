// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../Controllers/character_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CharacterController on _CharacterController, Store {
  late final _$charactersAtom =
      Atom(name: '_CharacterController.characters', context: context);

  @override
  ObservableList<Character> get characters {
    _$charactersAtom.reportRead();
    return super.characters;
  }

  @override
  set characters(ObservableList<Character> value) {
    _$charactersAtom.reportWrite(value, super.characters, () {
      super.characters = value;
    });
  }

  late final _$characterAtom =
      Atom(name: '_CharacterController.character', context: context);

  @override
  Character? get character {
    _$characterAtom.reportRead();
    return super.character;
  }

  @override
  set character(Character? value) {
    _$characterAtom.reportWrite(value, super.character, () {
      super.character = value;
    });
  }

  late final _$comicsAtom =
      Atom(name: '_CharacterController.comics', context: context);

  @override
  ObservableList<Comics> get comics {
    _$comicsAtom.reportRead();
    return super.comics;
  }

  @override
  set comics(ObservableList<Comics> value) {
    _$comicsAtom.reportWrite(value, super.comics, () {
      super.comics = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_CharacterController.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$intervalAtom =
      Atom(name: '_CharacterController.interval', context: context);

  @override
  int get interval {
    _$intervalAtom.reportRead();
    return super.interval;
  }

  @override
  set interval(int value) {
    _$intervalAtom.reportWrite(value, super.interval, () {
      super.interval = value;
    });
  }

  late final _$fetchCharactersAsyncAction =
      AsyncAction('_CharacterController.fetchCharacters', context: context);

  @override
  Future<void> fetchCharacters() {
    return _$fetchCharactersAsyncAction.run(() => super.fetchCharacters());
  }

  late final _$fetchCharacterAsyncAction =
      AsyncAction('_CharacterController.fetchCharacter', context: context);

  @override
  Future<void> fetchCharacter(int characterId) {
    return _$fetchCharacterAsyncAction
        .run(() => super.fetchCharacter(characterId));
  }

  late final _$fetchComicsAsyncAction =
      AsyncAction('_CharacterController.fetchComics', context: context);

  @override
  Future<void> fetchComics(int characterId, int offset) {
    return _$fetchComicsAsyncAction
        .run(() => super.fetchComics(characterId, offset));
  }

  @override
  String toString() {
    return '''
characters: ${characters},
character: ${character},
comics: ${comics},
isLoading: ${isLoading},
interval: ${interval}
    ''';
  }
}
