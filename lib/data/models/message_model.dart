class MessageModel {
  final bool seen;
  final DateTime time;
  final String sender, message;

  MessageModel({required this.seen, required this.time, required this.sender, required this.message});
}
