import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_app_task/core/constants/extensions.dart';
import 'package:whats_app_task/core/constants/strings.dart';
import 'package:whats_app_task/data/models/category_model.dart';
import 'package:whats_app_task/data/models/chat_model.dart';
import 'package:whats_app_task/data/models/message_model.dart';

part 'chats_state.dart';

class ChatsCubit extends Cubit<ChatsState> {
  ChatsCubit() : super(ChatsInitial()) {
    getData();
  }

  TextEditingController messageController = TextEditingController();

  List<ChatModel> chats = [
    ChatModel(
      name: "Alice Johnson",
      status: "read",
      image: "assets/images/user_1.jpeg",
      messages: [
        MessageModel(seen: true, time: DateTime.now().subtract(10.min), sender: "Alice Johnson", message: "Hey! How’s your day?"),
        MessageModel(seen: true, time: DateTime.now().subtract(9.min), sender: "You", message: "Pretty good! Just coding."),
        MessageModel(seen: true, time: DateTime.now().subtract(8.min), sender: "Alice Johnson", message: "Nice! Flutter again?"),
        MessageModel(seen: true, time: DateTime.now().subtract(7.min), sender: "You", message: "Yup 😅 building a WhatsApp-style UI for a task."),
        MessageModel(seen: true, time: DateTime.now().subtract(6.min), sender: "Alice Johnson", message: "Oooh that sounds fun. Did you nail the chat bubbles?"),
        MessageModel(seen: true, time: DateTime.now().subtract(5.min), sender: "You", message: "Yeah, got them rounded just like the real app 👌"),
        MessageModel(seen: true, time: DateTime.now().subtract(4.min), sender: "Alice Johnson", message: "Impressive 🔥 you always pay attention to details."),
        MessageModel(seen: true, time: DateTime.now().subtract(3.min), sender: "You", message: "Haha thanks! Pixel-perfect or nothing 😎"),
        MessageModel(seen: true, time: DateTime.now().subtract(2.min), sender: "Alice Johnson", message: "So when do I get to test this app? 👀"),
        MessageModel(seen: false, time: DateTime.now().subtract(1.min), sender: "You", message: "As soon as I finish the stories screen. You’ll be my first beta tester 😂"),
      ],
      lastMessage: MessageModel(seen: false, time: DateTime.now().subtract(1.min), sender: "You", message: "As soon as I finish the stories screen. You’ll be my first beta tester 😂"),
    ),
    ChatModel(
      name: "David Wilson",
      status: "unread",
      image: "assets/images/user_2.jpeg",
      messages: [
        MessageModel(seen: true, time: DateTime.now().subtract(45.min), sender: "David Wilson", message: "Hey, are we still on for lunch tomorrow?"),
        MessageModel(seen: true, time: DateTime.now().subtract(40.min), sender: "You", message: "Absolutely! 12:30 at the usual spot?"),
        MessageModel(seen: true, time: DateTime.now().subtract(3.min), sender: "David Wilson", message: "Perfect! Can't wait to catch up!"),
      ],
      lastMessage: MessageModel(seen: true, time: DateTime.now().subtract(3.min), sender: "David Wilson", message: "Perfect! Can't wait to catch up!"),
    ),
    ChatModel(
      name: "Emma Davis",
      status: "read",
      image: "assets/images/user_3.jpeg",
      messages: [
        MessageModel(seen: true, time: DateTime.now().subtract(2.hour), sender: "You", message: "Did you see the latest episode?"),
        MessageModel(seen: true, time: DateTime.now().subtract(1.hour), sender: "Emma Davis", message: "Yes! That plot twist was insane!"),
        MessageModel(seen: true, time: DateTime.now().subtract(30.min), sender: "You", message: "Right?? I totally didn't see that coming!"),
        MessageModel(seen: true, time: DateTime.now().subtract(5.min), sender: "Emma Davis", message: "When's the next episode coming out?"),
      ],
      lastMessage: MessageModel(seen: true, time: DateTime.now().subtract(5.min), sender: "Emma Davis", message: "When's the next episode coming out?"),
    ),
    ChatModel(
      name: "Mom",
      status: "read",
      image: "assets/images/user_4.jpeg",
      messages: [
        MessageModel(seen: true, time: DateTime.now().subtract(1.hour), sender: "Mom", message: "Call me when you get a chance"),
        MessageModel(seen: true, time: DateTime.now().subtract(15.min), sender: "You", message: "Sorry, been busy. Will call tonight!"),
        MessageModel(seen: true, time: DateTime.now().subtract(9.min), sender: "Mom", message: "Don't forget about Sunday dinner!"),
      ],
      lastMessage: MessageModel(seen: false, time: DateTime.now().subtract(9.min), sender: "Mom", message: "Don't forget about Sunday dinner!"),
    ),
    ChatModel(
      name: "James Rodriguez",
      status: "read",
      image: "assets/images/user_5.jpeg",
      messages: [
        MessageModel(seen: true, time: DateTime.now().subtract(2.hour), sender: "James Rodriguez", message: "The meeting is rescheduled to 3 PM"),
        MessageModel(seen: true, time: DateTime.now().subtract(10.min), sender: "You", message: "Got it, thanks for the heads up"),
      ],
      lastMessage: MessageModel(seen: true, time: DateTime.now().subtract(10.min), sender: "You", message: "Got it, thanks for the heads up"),
    ),
    ChatModel(
      name: "Olivia Chen",
      status: "unread",
      image: "assets/images/user_6.jpeg",
      messages: [
        MessageModel(seen: true, time: DateTime.now().subtract(3.hour), sender: "You", message: "Happy birthday!! 🎉"),
        MessageModel(seen: true, time: DateTime.now().subtract(12.min), sender: "Olivia Chen", message: "Thank you!! 😊"),
      ],
      lastMessage: MessageModel(seen: true, time: DateTime.now().subtract(12.min), sender: "Olivia Chen", message: "Thank you!! 😊"),
    ),
    ChatModel(
      image: "",
      status: "read",
      name: "Alex Turner",
      messages: [
        MessageModel(seen: true, time: DateTime.now().subtract(2.hour), sender: "Alex Turner", message: "Check out this new song I found!"),
        MessageModel(seen: true, time: DateTime.now().subtract(15.min), sender: "You", message: "This is amazing! Who's the artist?"),
      ],
      lastMessage: MessageModel(seen: true, time: DateTime.now().subtract(15.min), sender: "You", message: "This is amazing! Who's the artist?"),
    ),
    ChatModel(
      name: "Dr. Smith",
      status: "read",
      image: "assets/images/user_8.jpeg",
      messages: [
        MessageModel(seen: true, time: DateTime.now().subtract(1.hour), sender: "Dr. Smith", message: "Just a reminder about your appointment tomorrow at 2 PM"),
        MessageModel(seen: true, time: DateTime.now().subtract(18.min), sender: "You", message: "Thanks for the reminder!"),
      ],
      lastMessage: MessageModel(seen: true, time: DateTime.now().subtract(18.min), sender: "You", message: "Thanks for the reminder!"),
    ),
  ];
  List<CategoryModel> categories = [
    CategoryModel(name: AppStrings.all, isSelected: true),
    CategoryModel(name: AppStrings.unread, isSelected: false),
    CategoryModel(name: AppStrings.favorites, isSelected: false),
    CategoryModel(name: AppStrings.groups, isSelected: false),
  ];

  void getData() {
    ChatsSuccess successState = ChatsSuccess(chats, categories);
    emit(successState);
  }

  void changeCategory(String categoryName) {
    if (state is ChatsSuccess) {
      for (CategoryModel category in (state as ChatsSuccess).categories) {
        category.isSelected = false;
      }
      CategoryModel currentCategory = (state as ChatsSuccess).categories.firstWhere((element) => element.name == categoryName);
      currentCategory.isSelected = true;
      if (categoryName == AppStrings.all) {
        currentCategory.isSelected = true;
        ChatsSuccess successState = ChatsSuccess(chats, (state as ChatsSuccess).categories);
        emit(successState);
      } else if (categoryName == AppStrings.unread) {
        ChatsSuccess successState = ChatsSuccess((state as ChatsSuccess).chats.where((element) => element.status == "unread").toList(), (state as ChatsSuccess).categories);
        emit(successState);
      } else {
        AppStrings.thisFeatureIsNotAvailable.showToast;
      }
    }
  }

  void changeChatStatus(String chatName) {
    if (state is ChatsSuccess) {
      ChatModel currentChat = (state as ChatsSuccess).chats.firstWhere((element) => element.name == chatName);
      currentChat.status = "read";
      ChatsSuccess successState = ChatsSuccess((state as ChatsSuccess).chats, (state as ChatsSuccess).categories);
      emit(successState);
    }
  }

  void addMessage(String chatName) {
    if (state is ChatsSuccess) {
      MessageModel newMessage = MessageModel(seen: false, time: DateTime.now(), sender: "You", message: messageController.text);
      ChatModel currentChat = (state as ChatsSuccess).chats.firstWhere((element) => element.name == chatName);
      currentChat.lastMessage = newMessage;
      currentChat.messages.add(newMessage);
      ChatsSuccess successState = ChatsSuccess((state as ChatsSuccess).chats, (state as ChatsSuccess).categories);
      messageController.clear();
      emit(successState);
    }
  }
}
