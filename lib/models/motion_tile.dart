class MotionTile {
  String name; // 동작 이름
  String part; // 동작 부위
  String difficulty;  // 동작 난이도
  String imageUrl;  // 동작 이미지

  MotionTile(this.name, this.part, this.difficulty, this.imageUrl);

  MotionTile.fromMap(Map<String, dynamic> map)
      : name = map['name'],
        part = map['part'],
        difficulty = map['difficulty'],
        imageUrl = map['imageUrl'];
}