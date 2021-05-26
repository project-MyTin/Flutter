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
  final String date, contentName;
  final List contentList;

  RecordTile.fromMap(Map<String, dynamic> map)
      : date = map["date"],
        contentName = map["contentName"],
        contentList = map["contentList"];
}
