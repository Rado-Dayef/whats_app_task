import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_app_task/core/constants/extensions.dart';
import 'package:whats_app_task/core/constants/strings.dart';
import 'package:whats_app_task/core/theme/assets.dart';
import 'package:whats_app_task/core/theme/colors.dart';
import 'package:whats_app_task/core/theme/fonts.dart';
import 'package:whats_app_task/data/models/chat_model.dart';
import 'package:whats_app_task/data/models/message_model.dart';
import 'package:whats_app_task/logic/cubits/chats_cubit/chats_cubit.dart';
import 'package:whats_app_task/presentation/widgets/message_widget.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    ChatModel chat = (ModalRoute.of(context)!.settings.arguments as List<dynamic>)[0] as ChatModel;
    ChatsCubit cubit = (ModalRoute.of(context)!.settings.arguments as List<dynamic>)[1] as ChatsCubit;
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(isDark ? AppAssets.chatBackgroundDark : AppAssets.chatBackgroundLight), opacity: 0.2, fit: BoxFit.fill),
          ),
          child: BlocProvider.value(
            value: cubit,
            child: Column(
              children: [
                Container(
                  padding: 10.edgeInsetsAll,
                  decoration: BoxDecoration(color: isDark ? AppColors.backgroundDark : AppColors.backgroundLight),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(Icons.arrow_back, color: isDark ? AppColors.textAndBottomBarIconsDark : AppColors.textAndBottomBarIconsLight),
                      ),
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: isDark ? AppColors.searchBarAndBordersDark : AppColors.searchBarAndBordersLight,
                        child: chat.image.isEmpty
                            ? Icon(Icons.person_outline_rounded, color: isDark ? AppColors.textAndBottomBarIconsDark : AppColors.textAndBottomBarIconsLight)
                            : ClipRRect(borderRadius: 50.borderRadiusAll, child: Image.asset(chat.image)),
                      ),
                      5.gap,
                      Text(
                        chat.name,
                        style: TextStyle(color: isDark ? AppColors.textAndBottomBarIconsDark : AppColors.textAndBottomBarIconsLight, fontSize: AppFonts.h4),
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {
                          AppStrings.thisFeatureIsNotAvailable.showToast;
                        },
                        icon: Icon(Icons.videocam_outlined, color: isDark ? AppColors.textAndBottomBarIconsDark : AppColors.textAndBottomBarIconsLight),
                      ),
                      IconButton(
                        onPressed: () {
                          AppStrings.thisFeatureIsNotAvailable.showToast;
                        },
                        icon: Icon(Icons.phone_outlined, color: isDark ? AppColors.textAndBottomBarIconsDark : AppColors.textAndBottomBarIconsLight),
                      ),
                      IconButton(
                        onPressed: () {
                          AppStrings.thisFeatureIsNotAvailable.showToast;
                        },
                        icon: Icon(Icons.more_vert_rounded, color: isDark ? AppColors.textAndBottomBarIconsDark : AppColors.textAndBottomBarIconsLight),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: BlocBuilder<ChatsCubit, ChatsState>(
                    builder: (context, state) {
                      return ListView.separated(
                        padding: 10.edgeInsetsAll,
                        itemCount: chat.messages.length,
                        itemBuilder: (_, int index) {
                          MessageModel message = chat.messages[index];
                          return MessageWidget(message);
                        },
                        separatorBuilder: (_, __) {
                          return 10.gap;
                        },
                      );
                    },
                  ),
                ),
                Padding(
                  padding: 10.edgeInsetsAll,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: BlocBuilder<ChatsCubit, ChatsState>(
                              builder: (context, state) {
                                return TextFormField(
                                  controller: context.read<ChatsCubit>().messageController,
                                  style: TextStyle(color: isDark ? AppColors.subTextAndIconsDark : AppColors.subTextAndIconsLight),
                                  onTapOutside: (_) {
                                    FocusManager.instance.primaryFocus?.unfocus();
                                  },
                                  decoration: InputDecoration(
                                    filled: true,
                                    hintText: AppStrings.message,
                                    border: OutlineInputBorder(
                                      borderRadius: 25.borderRadiusAll,
                                      borderSide: BorderSide(color: isDark ? AppColors.searchBarAndBordersDark : AppColors.searchBarAndBordersLight),
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                      borderRadius: 25.borderRadiusAll,
                                      borderSide: BorderSide(color: isDark ? AppColors.searchBarAndBordersDark : AppColors.searchBarAndBordersLight),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: 25.borderRadiusAll,
                                      borderSide: BorderSide(color: isDark ? AppColors.searchBarAndBordersDark : AppColors.searchBarAndBordersLight),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: 25.borderRadiusAll,
                                      borderSide: BorderSide(color: isDark ? AppColors.searchBarAndBordersDark : AppColors.searchBarAndBordersLight),
                                    ),
                                    fillColor: isDark ? AppColors.searchBarAndBordersDark : AppColors.searchBarAndBordersLight,
                                    prefixIcon: IconButton(
                                      onPressed: () {
                                        AppStrings.thisFeatureIsNotAvailable.showToast;
                                      },
                                      icon: Icon(Icons.camera_alt_outlined, color: isDark ? AppColors.subTextAndIconsDark : AppColors.subTextAndIconsLight),
                                    ),
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        AppStrings.thisFeatureIsNotAvailable.showToast;
                                      },
                                      icon: Icon(Icons.attach_file_rounded, color: isDark ? AppColors.subTextAndIconsDark : AppColors.subTextAndIconsLight),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          10.gap,
                          BlocBuilder<ChatsCubit, ChatsState>(
                            builder: (context, state) {
                              return ValueListenableBuilder<TextEditingValue>(
                                valueListenable: context.read<ChatsCubit>().messageController,
                                builder: (context, value, _) {
                                  return InkWell(
                                    onTap: () {
                                      context.read<ChatsCubit>().messageController.text.isEmpty ? AppStrings.thisFeatureIsNotAvailable.showToast : context.read<ChatsCubit>().addMessage(chat.name);
                                    },
                                    child: CircleAvatar(
                                      backgroundColor: isDark ? AppColors.floatingActionButtonDark : AppColors.floatingActionButtonLight,

                                      child: Icon(
                                        context.read<ChatsCubit>().messageController.text.isEmpty ? Icons.mic : Icons.send,
                                        color: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
