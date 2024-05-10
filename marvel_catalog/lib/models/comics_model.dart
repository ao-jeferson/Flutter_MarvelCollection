class Comics {
  int? available;
  String? collectionURI;
  List<Item?>? items;
  int? returned;

  Comics({this.available, this.collectionURI, this.items, this.returned});

  Comics.fromJson(Map<String, dynamic> json) {
    available = json['available'];
    collectionURI = json['collectionURI'];
    if (json['items'] != null) {
      items = <Item>[];
      json['items'].forEach((v) {
        items!.add(Item.fromJson(v));
      });
    }
    returned = json['returned'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['available'] = available;
    data['collectionURI'] = collectionURI;
    data['items'] =
        items != null ? items!.map((v) => v?.toJson()).toList() : null;
    data['returned'] = returned;
    return data;
  }
}

class Item {
  String? resourceURI;
  String? name;

  Item({this.resourceURI, this.name});

  Item.fromJson(Map<String, dynamic> json) {
    resourceURI = json['resourceURI'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['resourceURI'] = resourceURI;
    data['name'] = name;
    return data;
  }
}
