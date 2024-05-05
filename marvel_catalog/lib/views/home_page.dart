import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marvel_catalog/stores/character_store.dart';

class Characterlist extends StatefulWidget {
  @override
  _CharacterlistState createState() => _CharacterlistState();
}

class _CharacterlistState extends State<Characterlist> {
  final CharacterStore _characterStore = CharacterStore();

  @override
  void initState() {
    super.initState();
    _characterStore.fetchCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personagens da Marvel'),
      ),
      body: Observer(
        builder: (_) {
          if (_characterStore.isLoading && _characterStore.characters.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              // controller: _scrollController,
              itemCount: _characterStore.characters.length,
              itemBuilder: (context, index) {
                final character = _characterStore.characters[index];
                return ListTile(
                  title: Text(character.name),
                  leading: Image.network(character.imageUrl),
                  // Aqui você pode adicionar a lógica para exibir os quadrinhos em que o personagem aparece
                );
              },
            );
          }
        },
      ),
    );
  }
}
