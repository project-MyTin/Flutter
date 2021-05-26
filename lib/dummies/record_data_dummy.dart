import 'package:mytin/models/record_data.dart';

final RecordData recordData = RecordData.fromMap({
  "totalTime": 78,
  "totalExp": 340,
  "countRoutine": 6,
  "countMotion": 36,
  "motionList": [
    RecordTile.fromMap({
      "id": 1,
      "name": "스쿼트",
      "imageUrl": "https://0k-cal.com/wp-content/uploads/2020/10/sss.jpg",
      "time": 30,
    }),
    RecordTile.fromMap({
      "id": 2,
      "name": "윗몸일으키기",
      "imageUrl": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTeYRnjj0wCD5BjexjsE4IKh4NIW7gqrI7t5Q&usqp=CAU",
      "time": 50,
    }),
    RecordTile.fromMap({
      "id": 3,
      "name": "명상",
      "part": "어딘가",
      "difficulty": "신급",
      "imageUrl": "https://buddhayana2018504915002.files.wordpress.com/2018/11/417.jpg?w=500",
      "time": 120,
    }),
  ],
  "routineList": [
    RecordTile.fromMap({
      "id": 1,
      "name": "타바타 트레이닝",
      "imageUrl": "https://src.hidoc.co.kr/image/lib/2020/5/22/1590132842552_0.jpg",
      "time": 10 * 60,
    }),
    RecordTile.fromMap({
      "id": 2,
      "name": "근력 운동 루틴",
      "time": 20 * 60,
      "imageUrl": "https://thumb.mt.co.kr/06/2020/07/2020070712585172596_3.jpg/dims/optimize/",
    }),
    RecordTile.fromMap({
      "id": 3,
      "name": "걷기 루틴",
      "time": 60 * 60,
      "imageUrl": "https://post-phinf.pstatic.net/MjAxNzA1MThfMTU2/MDAxNDk1MDkxMjAzOTAy.O9M2eUuk5H5zhzB3u45Qt2xH4-YWx3DrikIjR3zefFIg.hZCp8Ku494tcefcGmGj6-xXpU-VHwcLSHZf7iJaBTEYg.JPEG/shutterstock_411246616.jpg?type=w1200",
    }),
  ],
});
