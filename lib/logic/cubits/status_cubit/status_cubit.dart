import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_app_task/data/models/channel_model.dart';
import 'package:whats_app_task/data/models/story_model.dart';

part 'status_state.dart';

class StatusCubit extends Cubit<StatusState> {
  StatusCubit() : super(StatusInitial()) {
    getData();
  }

  List<StoryModel> stories = [
    StoryModel(name: "James Rodriguez", image: "assets/images/status_1.jpg", userImage: "assets/images/user_5.jpeg"),
    StoryModel(name: "Dr. Smith", image: "assets/images/status_2.jpg", userImage: "assets/images/user_8.jpeg"),
    StoryModel(name: "Emma Davis", image: "assets/images/status_3.jpg", userImage: "assets/images/user_3.jpeg"),
    StoryModel(name: "Olivia Chen", image: "assets/images/status_4.jpg", userImage: "assets/images/user_6.jpeg"),
    StoryModel(name: "Alex Turner", image: "assets/images/status_5.jpg", userImage: ""),
  ];
  List<ChannelModel> channels = [
    ChannelModel(name: "Programming Helper", image: "assets/images/channel_1.jpeg", followers: 12),
    ChannelModel(name: "basketball", image: "assets/images/channel_2.jpeg", followers: 101),
    ChannelModel(name: "Formula 1", image: "assets/images/channel_3.jpeg", followers: 354),
    ChannelModel(name: "Quran Karim", image: "assets/images/channel_4.jpeg", followers: 693),
    ChannelModel(name: "Jop Hunter", image: "", followers: 73),
  ];

  void getData() {
    StatusSuccess successState = StatusSuccess(stories, channels);
    emit(successState);
  }
}
