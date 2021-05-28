class MotionTile {
  int id; // 동작 id
  String name; // 동작 이름
  String part; // 동작 부위
  String difficulty;  // 동작 난이도
  String imageUrl;  // 동작 이미지

  MotionTile(this.id, this.name, this.part, this.difficulty, this.imageUrl);

  MotionTile.fromJson(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'],
        part = map['part'],
        difficulty = map['difficulty'],
        imageUrl = map['imageUrl'];
}