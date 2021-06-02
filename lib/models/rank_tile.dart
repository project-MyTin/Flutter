class RankTile {
  final String name, imageUrl;
  int value;

  RankTile.fromMap(Map<String, dynamic> map)
      : name = map["name"],
        imageUrl = map["imageUrl"],
        value = map["value"];
}
