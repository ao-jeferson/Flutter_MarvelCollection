import 'package:flutter/material.dart';
import 'package:marvel_catalog/models/character_model.dart';

class CharacterDetailsBody extends StatelessWidget {
  final Character character;

  CharacterDetailsBody({required this.character});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Image.network(
          character.imageUrl,
          height: 200,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                character.name,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                character.description ?? 'No description available',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              const Text(
                'Comics:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: character.comics
                    .map((comic) =>
                        Text(comic.name, style: const TextStyle(fontSize: 16)))
                    .toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
