import 'package:meta/meta.dart';

@immutable
class StatusState {
  static var empty = StatusState(false);
  bool status;
  StatusState(this.status);
}