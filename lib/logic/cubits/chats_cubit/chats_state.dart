part of 'chats_cubit.dart';

abstract class ChatsState {}

final class ChatsInitial extends ChatsState {
  @override
  String toString() => "Initial";
}

final class ChatsSuccess extends ChatsState {
  @override
  String toString() => "Success";
}
