import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marvel_catalog/Controllers/character_controller.dart';
import 'package:marvel_catalog/models/comics_model.dart';

class CharacterDetailView extends StatelessWidget {
  final CharacterController controller = CharacterController();

  final int characterId;

  CharacterDetailView({Key? key, required this.characterId}) {
    controller.fetchCharacter(characterId);
    controller.fetchComics(
        characterId, 0); // Adicionando para buscar quadrinhos
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personagem'),
      ),
      body: Observer(
        builder: (_) {
          if (controller.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (controller.character == null) {
            return const Center(child: Text('Character not found'));
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(controller.character!.thumbnailUrl),
                Text(controller.character!.name),
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.comics.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text('Nome personagem'),
                        // Pode adicionar a imagem do quadrinho aqui também
                      );
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
