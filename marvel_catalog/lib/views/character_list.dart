import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marvel_catalog/shared/components/mv_drawer.dart';
import 'package:marvel_catalog/stores/character_store.dart';

class CharactersList extends StatefulWidget {
  @override
  _CharactersListState createState() => _CharactersListState();

  final CharacterStore _characterStore = CharacterStore();
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personagens'),
      ),
      drawer: MvDrawer(),
      body: Observer(
        builder: (_) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
                controller: _scrollController,
                itemCount: widget._characterStore.characters.length + 1,
                itemBuilder: (context, index) {
                  if (index < widget._characterStore.characters.length) {
                    final character = widget._characterStore.characters[index];
                    return Card(
                      child: ListTile(
                        onTap: () => Navigator.pushNamed(
                            context, '/Characterdetail',
                            arguments: {character.id}),
                        title: Text(character.name),
                        leading: Image.network(character.imageUrl),
                        subtitle: Text(character.description.isNotEmpty &&
                                character.description.length > 50
                            ? '${character.description.substring(0, 50)}...'
                            : character.description),
                      ),
                    );
                  } else if (!widget._characterStore.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          );
        },
      ),
    );
  }
}
