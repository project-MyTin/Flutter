class RankTile {
  final String name, imageUrl;
  final int rankNumber, value;

  RankTile.fromMap(Map<String, dynamic> map)
      : name = map["name"],
        imageUrl = map["imageUrl"],
        rankNumber = map["rankNumber"],
        value = map["value"];
}
