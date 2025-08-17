import 'package:flutter_bloc/flutter_bloc.dart';

part 'status_state.dart';

class StatusCubit extends Cubit<StatusState> {
  StatusCubit() : super(StatusInitial()) {
    getStatus();
    getChannels();
  }

  void getStatus() {}

  void getChannels() {}
}
