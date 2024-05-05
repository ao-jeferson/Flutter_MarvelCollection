import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// MobX Store
class CharacterStore = _CharacterStore with _$CharacterStore;

abstract class _CharacterStore with Store {
  @observable
  ObservableList<Character> characters = ObservableList<Character>();

  @observable
  bool isLoading = false;

  @observable
  int init = 0;

  @action
  Future<void> fetchCharacters() async {
    if (isLoading) return;
    isLoading = true;

    final response = await http
        .get(Uri.parse('https://www.marvel.com/characters?init=$init'));
    final jsonData = json.decode(response.body);

    for (var character in jsonData['results']) {
      characters.add(Character(
        name: character['name'],
        description: character['description'],
      ));
    }

    init += int.parse(jsonData['count']);
    isLoading = false;
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final characterStore = CharacterStore();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marvel Characters',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Marvel Characters'),
        ),
        body: CharacterList(characterStore: characterStore),
      ),
    );
  }
}

class CharacterList extends StatefulWidget {
  final CharacterStore characterStore;

  CharacterList({required this.characterStore});

  @override
  _CharacterListState createState() => _CharacterListState();
}

class _CharacterListState extends State<CharacterList> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    widget.characterStore.fetchCharacters();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.init >= _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      widget.characterStore.fetchCharacters();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return ListView.builder(
          controller: _scrollController,
          itemCount: widget.characterStore.characters.length + 1,
          itemBuilder: (context, index) {
            if (index < widget.characterStore.characters.length) {
              final character = widget.characterStore.characters[index];
              return ListTile(
                title: Text(character.name),
                subtitle: Text(character.description),
              );
            } else if (!widget.characterStore.isLoading) {
              return ListTile(
                title: const Center(child: Text("Carregar mais")),
                onTap: () => widget.characterStore.fetchCharacters(),
              );
            } else {
              return const ListTile(
                title: Center(child: CircularProgressIndicator()),
              );
            }
          },
        );
      },
    );
  }
}
