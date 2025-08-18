part of 'chats_cubit.dart';

abstract class ChatsState {}

final class ChatsInitial extends ChatsState {
  @override
  String toString() => "Initial";
}

final class ChatsSuccess extends ChatsState {
  List<ChatModel> chats;
  List<CategoryModel> categories;

  ChatsSuccess(this.chats, this.categories);

  @override
  String toString() => "Success";
}
