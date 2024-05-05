import 'package:flutter/material.dart';
import 'package:marvel_catalog/stores/character_store.dart';

class CharactersList extends StatefulWidget {
  final CharacterStore _characterStore = CharacterStore();

  //CharactersList({super.key, required this.CharactersStore});

  @override
  _CharactersListState createState() => _CharactersListState();
}

class _CharactersListState extends State<CharactersList> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    widget._characterStore.fetchCharacters();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange &&
        !widget._characterStore.isLoading) {
      widget._characterStore.fetchCharacters();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        controller: _scrollController,
        itemCount: widget._characterStore.characters.length + 1,
        itemBuilder: (context, index) {
          if (index < widget._characterStore.characters.length) {
            final character = widget._characterStore.characters[index];
            return ListTile(
              leading: Image.network(character.imageUrl),
              title: Text(character.name),
            );
          } else if (!widget._characterStore.isLoading) {
            return Center(
              child: ElevatedButton(
                onPressed: () {
                  widget._characterStore.fetchCharacters();
                },
                child: const Text('Load More'),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
