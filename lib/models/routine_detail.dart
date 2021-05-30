enum Authority { admin, user }

class MotionElement {
  String name; // 동작 이름
  String part; // 동작 부위
  int count; // 동작 횟수
  int time; // 동작 하나당 시간
  int id; // 동작 id
  String imageUrl;  // 동작 이미지

  MotionElement(this.name, this.part, this.count, this.time, this.imageUrl, [this.id]);

  MotionElement.fromMap(Map<String, dynamic> map)
      : name = map['name'],
        part = map['part'],
        time = map['time'],
        count = map['count'],
        imageUrl = map['imageUrl'],
        id = map['id'];
}

class RoutineDetail {
  int id; // 루틴 아이디
  String name; // 루틴 이름
  String description; // 루틴 설명
  String publisher; // 작성자
  List<String> materials; // 준비물
  List<MotionElement> motions; // 동작 간단한 정보 리스트
  int time; // 총 소요 시간
  Authority authority; // 루틴 권한
  String difficulty; // 루틴 난이도
  String type; // 루틴 유형
  // DateTime createdTime;  // 생성 시간
  // DateTime updatedTime;  // 수정 시간
  int breakTime; // 휴식 시간
  String imageUrl; // 루틴 이미지 링크

  RoutineDetail(
      this.id,
      this.name,
      this.description,
      this.publisher,
      this.materials,
      this.motions,
      this.time,
      this.authority,
      this.difficulty,
      this.type,
      this.breakTime,
      this.imageUrl);

  RoutineDetail.fromMap(Map<String, dynamic> map)
      : id = map["id"],
        name = map["name"],
        description = map["description"],
        publisher = map["publisher"],
        materials = map["materials"],
        motions = map["motions"],
        time = map["time"],
        authority = map["authority"],
        difficulty = map["difficulty"],
        type = map["type"],
        breakTime= map["breakTime"],
        imageUrl = map["imageUrl"];
}
