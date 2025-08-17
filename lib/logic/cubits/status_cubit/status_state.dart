part of 'status_cubit.dart';

abstract class StatusState {}

final class StatusInitial extends StatusState {
  @override
  String toString() => "Initial";
}

final class StatusSuccess extends StatusState {
  @override
  String toString() => "Success";
}
