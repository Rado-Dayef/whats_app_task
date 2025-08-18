import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'story_state.dart';

class StoryCubit extends Cubit<StoryState> {
  StoryCubit() : super(StoryInitial()) {
    startTimer();
  }

  Timer? timer;
  int elapsed = 0;
  final int total = 15;

  void startTimer() {
    elapsed = 0;
    timer?.cancel();

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      elapsed++;
      double progress = elapsed / total;

      if (elapsed >= total) {
        timer.cancel();
        StoryFinished finishedState = StoryFinished();
        emit(finishedState);
      } else {
        StoryProgress progressState = StoryProgress(progress);
        emit(progressState);
      }
    });
  }

  void stopTimer() {
    timer?.cancel();
  }

  @override
  Future<void> close() {
    timer?.cancel();
    return super.close();
  }
}
