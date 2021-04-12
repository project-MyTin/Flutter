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
      "name": "삽질하기",
      "part": "손가락",
      "count": 30,
      "imageUrl": "https://user-images.githubusercontent.com/48408417/114371384-64f68800-9bbb-11eb-8d1b-7c76ddfbc188.png"
    }),
    MotionElement.fromMap({
      "name": "구글링 하기",
      "part": "눈",
      "count": 10,
      "imageUrl": "https://user-images.githubusercontent.com/48408417/114371626-a7b86000-9bbb-11eb-81e8-ef8b717798a3.png"
    }),

  ],
  "time": 108,
  "authority": Authority.admin,
  "difficulty": "상",
  "type": "홈트레이닝",
  "imageUrl": "https://miro.medium.com/max/773/0*7pYNAASjwKSNuhQM.",
});
