enum Authority { admin, user }

class RoutineTile {
  int id; // 루틴 아이디
  String name; // 루틴 이름
  String description; // 루틴 설명
  int time; // 총 소요 시간
  Authority authority; // 루틴 권한
  String difficulty; // 루틴 난이도
  String type; // 루틴 유형
  String imageUrl; // 루틴 이미지

  RoutineTile(this.id, this.name, this.description, this.time, this.authority,
      this.difficulty, this.type, this.imageUrl);

  RoutineTile.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'],
        description = map['description'],
        time = map['time'],
        authority = map['authority'],
        difficulty = map['difficulty'],
        type = map['type'],
        imageUrl = map['imageUrl'];
}
