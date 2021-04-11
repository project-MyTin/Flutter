import 'package:mytin/models/routine_detail.dart';

RoutineDetail routine = RoutineDetail.fromMap({
  "id": 1,
  "name": "코딩하기",
  "description": "코딩은 고난이도 운동입니다. 물론 정신적 트레이닝이지요. "
      "무엇보다 중요한 것은, 스프린트가 많이 밀렸다는 것입니다. 하지만 걱정하지 마십쇼! "
      "악과 깡으로 우리는 결국 프로젝트를 완수할 것입니다! (with 각성제, 커피)",
  "publisher": "운영자",
  "materials": ["컴퓨터(또는 노트북)", "인터넷(구글링이 가능한)", "커피"],
  "motions": [
    MotionElement.fromMap({
      "name": "코드 짜기",
      "part": "손가락",
      "count": 5
    }),
    MotionElement.fromMap({
      "name": "구글링 하기",
      "part": "눈",
      "count": 10
    }),
    MotionElement.fromMap({
      "name": "빌드 하기",
      "part": "손가락",
      "count": 1
    }),
    MotionElement.fromMap({
      "name": "버그 수정하기",
      "part": "손가락",
      "count": 30
    }),
  ],
  "time": 108,
  "authority": Authority.admin,
  "difficulty": Difficulty.medium,
  "type": "홈트레이닝",
  "imageUrl": "",
});
