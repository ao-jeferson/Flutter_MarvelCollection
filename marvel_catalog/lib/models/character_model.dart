import 'package:marvel_catalog/models/comics_model.dart';

class Character {
  final int id;
  final String name;
  final String description;
  final String thumbnailUrl;
  final Comics comics;

  Character(
      {required this.id,
      required this.name,
      required this.description,
      required this.thumbnailUrl,
      required this.comics});

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      thumbnailUrl:
          "${json['thumbnail']['path']}.${json['thumbnail']['extension']}",
      comics: Comics.fromJson(json),
    );
  }
}
