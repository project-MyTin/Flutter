class MotionTime {
  int motionTime;
  int motionCount;
  String motionUrl;
  String motionName;

  MotionTime({this.motionTime, this.motionCount, this.motionUrl, this.motionName});

  MotionTime.fromMap(Map<String, dynamic> map)
    : motionTime = map['motionTime'],
      motionUrl = map['motionUrl'],
      motionCount = map['motionCount'],
      motionName = map['motionName'];
}