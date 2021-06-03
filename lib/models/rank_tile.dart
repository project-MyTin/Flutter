class RankTile {
  final String name, imageUrl;
  final int value;

  RankTile.fromMap(Map<String, dynamic> map)
      : name = map["name"],
        imageUrl = map["imageUrl"],
        value = map["value"];
}
