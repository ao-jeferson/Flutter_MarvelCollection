class comic {
  final String name;
  final String resourceURI;

  comic({required this.name, required this.resourceURI});

  factory comic.fromJson(Map<String, dynamic> json) {
    return comic(name: json['name'], resourceURI: json['resourceURI']);
  }
}
