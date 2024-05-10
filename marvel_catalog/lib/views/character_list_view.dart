import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marvel_catalog/Controllers/character_controller.dart';
import 'package:marvel_catalog/models/character_model.dart';
import 'package:marvel_catalog/shared/components/mv_drawer.dart';
import 'package:marvel_catalog/views/character_detail_view.dart';

class CharactersListView extends StatefulWidget {
  @override
  _CharactersListState createState() => _CharactersListState();
  final CharacterController _characterController = CharacterController();
}

class _CharactersListState extends State<CharactersListView> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    widget._characterController.fetchCharacters();
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
        !widget._characterController.isLoading) {
      widget._characterController.fetchCharacters();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personagens'),
      ),
      drawer: const MvDrawer(),
      body: Observer(
        builder: (_) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
                controller: _scrollController,
                itemCount: widget._characterController.characters.length + 1,
                itemBuilder: (context, index) {
                  if (index < widget._characterController.characters.length) {
                    final character =
                        widget._characterController.characters[index];
                    return Card(
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CharacterDetailView(
                                  characterId: character.id),
                            ),
                          );
                        },
                        title: Text(character.name),
                        leading: Image.network(character.thumbnailUrl),
                        subtitle: Text(character.description.isNotEmpty &&
                                character.description.length > 50
                            ? '${'Quadrinhos:${widget._characterController.characters.length}  ${character.description.substring(0, 50)}'}...'
                            : character.description),
                      ),
                    );
                  } else if (!widget._characterController.isLoading) {
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
