import 'package:marvel_catalog/models/comics_model.dart';

class Character {
  int id;
  String name;
  String thumbnail;
  List<Comics> comics = [];
  Character({required this.id, required this.name, required this.thumbnail});
}
