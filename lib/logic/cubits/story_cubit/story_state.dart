part of 'story_cubit.dart';

abstract class StoryState {}

final class StoryInitial extends StoryState {
  @override
  String toString() => "Initial";
}

class StoryProgress extends StoryState {
  final double progress;

  StoryProgress(this.progress);

  @override
  String toString() => "Progress";
}

final class StoryFinished extends StoryState {
  @override
  String toString() => "Finished";
}
