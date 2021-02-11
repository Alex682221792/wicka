import 'package:wicka/enums/StatusPostEnum.dart';
import 'package:wicka/model/embedded/Location.dart';

class KmelloPost {
  String id;
  String title;
  String description;
  Location location;
  DateTime startDate;
  String serviceId;
  double budget;
  StatusPostEnum status;

  KmelloPost(
      {this.id,
      this.title,
      this.description,
      this.location,
      this.startDate,
      this.serviceId,
      this.budget,
      this.status});
}
