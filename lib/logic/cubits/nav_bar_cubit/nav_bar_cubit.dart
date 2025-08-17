import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_app_task/core/constants/strings.dart';

class NavBarCubit extends Cubit<String> {
  NavBarCubit() : super(AppStrings.chats);

  void changeScreen(String screen) {
    emit(screen);
  }
}
