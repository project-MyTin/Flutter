class RecordData {
  final int totalTime, totalExp, countRoutine, countMotion;
  final List<RecordTile> motionList, routineList;

  RecordData.fromMap(Map<String, dynamic> map)
      : totalTime = map["totalTime"],
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
