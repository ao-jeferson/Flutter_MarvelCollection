// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CharacterStore on _CharacterStore, Store {
  late final _$charactersAtom =
      Atom(name: '_CharacterStore.characters', context: context);

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

  late final _$isLoadingAtom =
      Atom(name: '_CharacterStore.isLoading', context: context);

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
      Atom(name: '_CharacterStore.interval', context: context);

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
      AsyncAction('_CharacterStore.fetchCharacters', context: context);

  @override
  Future<void> fetchCharacters() {
    return _$fetchCharactersAsyncAction.run(() => super.fetchCharacters());
  }

  @override
  String toString() {
    return '''
characters: ${characters},
isLoading: ${isLoading},
interval: ${interval}
    ''';
  }
}
