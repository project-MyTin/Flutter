enum Authority {
  admin, user
}

enum Difficulty {
  easy, medium, hard
}

class Routine {
  int id;  // 루틴 아이디
  String name; // 루틴 이름
  String description;  // 루틴 설명
  String publisher;  // 작성자
  String materials;  // 준비물
  List<int> motions;  // 동작 간단한 정보 리스트
  int time;   // 총 소요 시간
  Authority authority;  // 루틴 권한
  Difficulty difficulty; // 루틴 난이도
  String type; // 루틴 유형
  DateTime createdTime;  // 생성 시간
  DateTime updatedTime;  // 수정 시간
  String imageUrl;  // 루틴 이미지 링크
}