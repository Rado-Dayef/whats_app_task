import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:whats_app_task/core/constants/extensions.dart';
import 'package:whats_app_task/core/theme/colors.dart';
import 'package:whats_app_task/core/theme/fonts.dart';
import 'package:whats_app_task/data/models/message_model.dart';

class MessageWidget extends StatelessWidget {
  final MessageModel message;

  const MessageWidget(this.message, {super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Directionality(
      textDirection: message.sender == "You" ? TextDirection.rtl : TextDirection.ltr,
      child: Row(
        children: [
          Flexible(
            child: Container(
              padding: 5.edgeInsetsAll,
              decoration: BoxDecoration(
                color: message.sender == "You" ? (isDark ? AppColors.selectedItemDark : AppColors.selectedItemLight) : (isDark ? AppColors.searchBarAndBordersDark : AppColors.backgroundLight),
                borderRadius: BorderRadius.only(
                  topLeft: message.sender == "You" ? Radius.circular(15) : Radius.circular(0),
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                  topRight: message.sender == "You" ? Radius.circular(0) : Radius.circular(15),
                ),
              ),
              child: Column(
                crossAxisAlignment: message.sender == "You" ? CrossAxisAlignment.start : CrossAxisAlignment.end,
                children: [
                  Text(
                    message.message + message.message,
                    style: TextStyle(color: isDark ? AppColors.textAndBottomBarIconsDark : AppColors.textAndBottomBarIconsLight, fontSize: AppFonts.h4),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      message.sender == "You"
                          ? Icon(Icons.check_circle_rounded, size: 12, color: message.seen ? AppColors.seen : (isDark ? AppColors.subTextAndIconsDark : AppColors.subTextAndIconsLight))
                          : 0.gap,
                      message.sender == "You" ? 5.gap : 0.gap,
                      Directionality(
                        textDirection: TextDirection.ltr,
                        child: Text(
                          intl.DateFormat("hh:mm a").format(message.time),
                          style: TextStyle(color: isDark ? AppColors.subTextAndIconsDark : AppColors.subTextAndIconsLight, fontSize: AppFonts.h6),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          25.gap,
        ],
      ),
    );
  }
}
