import 'package:flutter/material.dart';
import 'package:whats_app_task/core/constants/extensions.dart';
import 'package:whats_app_task/core/constants/strings.dart';
import 'package:whats_app_task/core/theme/colors.dart';
import 'package:whats_app_task/core/theme/fonts.dart';
import 'package:whats_app_task/data/models/channel_model.dart';

class ChannelWidget extends StatelessWidget {
  final ChannelModel channel;

  const ChannelWidget(this.channel, {super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return InkWell(
      onTap: () {
        AppStrings.thisFeatureIsNotAvailable.showToast;
      },
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: isDark ? AppColors.searchBarAndBordersDark : AppColors.searchBarAndBordersLight,
            child: channel.image.isEmpty
                ? Icon(Icons.groups_outlined, color: isDark ? AppColors.textAndBottomBarIconsDark : AppColors.textAndBottomBarIconsLight)
                : ClipRRect(
                    borderRadius: 50.borderRadiusAll,
                    child: Image.asset(channel.image, fit: BoxFit.cover, width: 50, height: 50),
                  ),
          ),
          15.gap,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  channel.name,
                  style: TextStyle(color: isDark ? AppColors.textAndBottomBarIconsDark : AppColors.textAndBottomBarIconsLight, fontSize: AppFonts.h4),
                ),
                Text(
                  "${channel.followers}K Followers",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: isDark ? AppColors.subTextAndIconsDark : AppColors.subTextAndIconsLight, fontSize: AppFonts.h5),
                ),
              ],
            ),
          ),
          15.gap,
          Container(
            padding: 10.edgeInsetsVertical,
            decoration: BoxDecoration(borderRadius: 25.borderRadiusAll, color: isDark ? AppColors.selectedItemDark : AppColors.selectedItemLight),
            child: Padding(
              padding: 20.edgeInsetsHorizontal,
              child: Text(AppStrings.follow, style: TextStyle(color: isDark ? AppColors.textAndBottomBarIconsDark : AppColors.textAndBottomBarIconsLight)),
            ),
          ),
        ],
      ),
    );
  }
}
