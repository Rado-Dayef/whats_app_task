import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:whats_app_task/core/constants/extensions.dart';
import 'package:whats_app_task/core/routes/route_names.dart';
import 'package:whats_app_task/core/theme/colors.dart';
import 'package:whats_app_task/core/theme/fonts.dart';
import 'package:whats_app_task/data/models/chat_model.dart';
import 'package:whats_app_task/logic/cubits/chats_cubit/chats_cubit.dart';

class ChatWidget extends StatelessWidget {
  final ChatModel chat;

  const ChatWidget(this.chat, {super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRouteNames.chat, arguments: [chat, context.read<ChatsCubit>()]);
        context.read<ChatsCubit>().changeChatStatus(chat.name);
      },
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: isDark ? AppColors.searchBarAndBordersDark : AppColors.searchBarAndBordersLight,
            child: chat.image.isEmpty
                ? Icon(Icons.person_outline_rounded, color: isDark ? AppColors.textAndBottomBarIconsDark : AppColors.textAndBottomBarIconsLight)
                : ClipRRect(
                    borderRadius: 50.borderRadiusAll,
                    child: Image.asset(chat.image, fit: BoxFit.cover, width: 50, height: 50),
                  ),
          ),
          15.gap,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  chat.name,
                  style: TextStyle(color: isDark ? AppColors.textAndBottomBarIconsDark : AppColors.textAndBottomBarIconsLight, fontSize: AppFonts.h4),
                ),
                Text(
                  "${chat.lastMessage.sender}: ${chat.lastMessage.message}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: isDark ? AppColors.subTextAndIconsDark : AppColors.subTextAndIconsLight, fontSize: AppFonts.h5),
                ),
              ],
            ),
          ),
          15.gap,
          Column(
            children: [
              Text(
                DateFormat("hh:mm a").format(chat.lastMessage.time),
                style: TextStyle(color: isDark ? AppColors.subTextAndIconsDark : AppColors.subTextAndIconsLight, fontSize: AppFonts.h6),
              ),
              chat.status == "unread" ? 5.gap : 0.gap,
              chat.status == "unread" ? CircleAvatar(radius: 5, backgroundColor: isDark ? AppColors.floatingActionButtonDark : AppColors.floatingActionButtonLight) : 0.gap,
            ],
          ),
        ],
      ),
    );
  }
}
