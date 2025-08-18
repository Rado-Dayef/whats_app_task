import 'package:whats_app_task/data/models/message_model.dart';

class ChatModel {
  String status;
  MessageModel lastMessage;
  final String name, image;
  final List<MessageModel> messages;

  ChatModel({required this.name, required this.image, required this.status, required this.messages, required this.lastMessage});
}
