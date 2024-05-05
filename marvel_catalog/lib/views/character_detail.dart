import 'package:flutter/material.dart';
import 'package:marvel_catalog/Services/marvel_api.dart';
import 'package:marvel_catalog/models/character_model.dart';
import 'package:marvel_catalog/views/character_details_body.dart';

class CharacterDetailsPage extends StatefulWidget {
  final int characterId;

  CharacterDetailsPage({required this.characterId});

  @override
  _CharacterDetailsPageState createState() => _CharacterDetailsPageState();
}

class _CharacterDetailsPageState extends State<CharacterDetailsPage> {
  late Future<Character> _characterFuture;

  @override
  void initState() {
    super.initState();
    _characterFuture = MarvelApi.fetchCharacter(widget.characterId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Character Details'),
      ),
      body: FutureBuilder<Character>(
        future: _characterFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return CharacterDetailsBody(character: snapshot.data!);
          }
        },
      ),
    );
  }
}
