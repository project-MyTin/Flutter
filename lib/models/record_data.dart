class RecordData {
  final int totalTime, totalExp, countRoutine, countMotion;
  final List<RecordTile> motionList, routineList;
  final String date;

  RecordData.fromMap(Map<String, dynamic> map)
      : date = map["date"],
        totalTime = map["totalTime"],
        totalExp = map["totalExp"],
        countRoutine = map["countRoutine"],
        countMotion = map["countMotion"],
        motionList = map["motionList"],
        routineList = map["routineList"];
}

class RecordTile {
  final String name, imageUrl;
  final int value, id;

  RecordTile.fromMap(Map<String, dynamic> map)
      : id = map["id"],
        name = map["name"],
        imageUrl = map["imageUrl"],
        value = map["value"];
}
