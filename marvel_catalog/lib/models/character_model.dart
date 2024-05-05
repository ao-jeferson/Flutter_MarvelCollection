import 'package:marvel_catalog/models/comics_model.dart';

class Character {
  final int id;
  final String name;
  final String description;
  final String imageUrl;
  List<comic> comics = [];

  Character(
      {required this.id,
      required this.name,
      required this.description,
      required this.imageUrl,
      comics});

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        imageUrl:
            json['thumbnail']['path'] + '.' + json['thumbnail']['extension'],
        comics: json['comics']['name']);
  }
}
