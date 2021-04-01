class MotionTime {
  int motionTime;
  String motionUrl;
  String motionName;

  MotionTime({this.motionTime, this.motionUrl, this.motionName});

  MotionTime.fromMap(Map<String, dynamic> map)
    : motionTime = map['motionTime'],
      motionUrl = map['motionUrl'],
      motionName = map['motionName'];
}