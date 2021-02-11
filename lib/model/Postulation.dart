import 'package:wicka/model/KmelloPost.dart';

class Postulation {
  String id;
  String workerId;
  double cost;
  Duration duration;
  KmelloPost post;

  Postulation({this.id, this.workerId, this.cost, this.duration, this.post});
}
