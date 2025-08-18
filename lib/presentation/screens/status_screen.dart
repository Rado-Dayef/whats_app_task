import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_app_task/core/constants/extensions.dart';
import 'package:whats_app_task/core/constants/strings.dart';
import 'package:whats_app_task/core/theme/assets.dart';
import 'package:whats_app_task/core/theme/colors.dart';
import 'package:whats_app_task/core/theme/fonts.dart';
import 'package:whats_app_task/data/models/channel_model.dart';
import 'package:whats_app_task/logic/cubits/status_cubit/status_cubit.dart';
import 'package:whats_app_task/presentation/widgets/channel_widget.dart';
import 'package:whats_app_task/presentation/widgets/story_widget.dart';

class StatusScreen extends StatelessWidget {
  const StatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        surfaceTintColor: AppColors.transparent,
        foregroundColor: isDark ? AppColors.textAndBottomBarIconsDark : AppColors.textAndBottomBarIconsLight,
        title: Text(
          AppStrings.updates,
          style: TextStyle(color: isDark ? AppColors.titleDark : AppColors.textAndBottomBarIconsLight, fontSize: AppFonts.h2),
        ),
        actions: [
          IconButton(
            onPressed: () {
              AppStrings.thisFeatureIsNotAvailable.showToast;
            },
            icon: Icon(Icons.search_rounded),
          ),
          IconButton(
            onPressed: () {
              AppStrings.thisFeatureIsNotAvailable.showToast;
            },
            icon: Icon(Icons.more_vert_rounded),
          ),
        ],
      ),
      body: BlocProvider(
        create: (context) => StatusCubit(),
        child: SingleChildScrollView(
          padding: 10.edgeInsetsAll,
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  AppStrings.status,
                  style: TextStyle(color: isDark ? AppColors.textAndBottomBarIconsDark : AppColors.textAndBottomBarIconsLight, fontSize: AppFonts.h3),
                ),
              ),
              10.gap,
              Align(
                alignment: Alignment.centerLeft,
                child: BlocBuilder<StatusCubit, StatusState>(
                  builder: (context, state) {
                    if (state is StatusSuccess) {
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    AppStrings.thisFeatureIsNotAvailable.showToast;
                                  },
                                  child: Container(
                                    width: 100,
                                    height: 175,
                                    padding: 5.edgeInsetsAll,
                                    decoration: BoxDecoration(
                                      color: isDark ? AppColors.searchBarAndBordersDark : AppColors.searchBarAndBordersLight,
                                      borderRadius: 15.borderRadiusAll,
                                      border: Border.all(color: isDark ? AppColors.subTextAndIconsDark : AppColors.subTextAndIconsLight),
                                    ),
                                    child: Column(
                                      children: [
                                        Spacer(),
                                        Stack(
                                          children: [
                                            CircleAvatar(
                                              radius: 25,
                                              backgroundColor: isDark ? AppColors.searchBarAndBordersDark : AppColors.searchBarAndBordersLight,
                                              child: ClipRRect(borderRadius: 50.borderRadiusAll, child: Image.asset(AppAssets.myImage)),
                                            ),
                                            Positioned(
                                              right: 0,
                                              bottom: 0,
                                              child: CircleAvatar(
                                                backgroundColor: isDark ? AppColors.floatingActionButtonDark : AppColors.floatingActionButtonLight,
                                                radius: 10,
                                                child: Icon(Icons.add, size: 12, color: isDark ? AppColors.backgroundDark : AppColors.backgroundLight),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Spacer(),
                                        Text(AppStrings.addStatus, style: TextStyle(color: AppColors.textAndBottomBarIconsDark)),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            10.gap,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: state.stories.map((story) {
                                return StoryWidget(story);
                              }).toList(),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return 0.gap;
                    }
                  },
                ),
              ),
              20.gap,
              Row(
                children: [
                  Text(
                    AppStrings.channels,
                    style: TextStyle(color: isDark ? AppColors.textAndBottomBarIconsDark : AppColors.textAndBottomBarIconsLight, fontSize: AppFonts.h3),
                  ),
                  Spacer(),
                  Container(
                    padding: 10.edgeInsetsVertical,
                    decoration: BoxDecoration(borderRadius: 25.borderRadiusAll, color: isDark ? AppColors.searchBarAndBordersDark : AppColors.searchBarAndBordersLight),
                    child: Padding(
                      padding: 20.edgeInsetsHorizontal,
                      child: Text(AppStrings.explore, style: TextStyle(color: isDark ? AppColors.textAndBottomBarIconsDark : AppColors.textAndBottomBarIconsLight)),
                    ),
                  ),
                ],
              ),
              10.gap,
              BlocBuilder<StatusCubit, StatusState>(
                builder: (context, state) {
                  if (state is StatusSuccess) {
                    return ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: state.channels.length,
                      itemBuilder: (_, int index) {
                        ChannelModel channel = state.channels[index];
                        return ChannelWidget(channel);
                      },
                      separatorBuilder: (_, __) {
                        return 20.gap;
                      },
                    );
                  } else {
                    return 0.gap;
                  }
                },
              ),
              20.gap,
              Align(
                alignment: Alignment.centerLeft,
                child: InkWell(
                  onTap: () {
                    AppStrings.thisFeatureIsNotAvailable.showToast;
                  },
                  child: Container(
                    padding: 10.edgeInsetsVertical,
                    decoration: BoxDecoration(
                      borderRadius: 25.borderRadiusAll,
                      color: AppColors.transparent,
                      border: Border.all(color: isDark ? AppColors.searchBarAndBordersDark : AppColors.searchBarAndBordersLight),
                    ),
                    child: Padding(
                      padding: 20.edgeInsetsHorizontal,
                      child: Text(AppStrings.exploreMore, style: TextStyle(color: isDark ? AppColors.textAndBottomBarIconsDark : AppColors.textAndBottomBarIconsLight)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              AppStrings.thisFeatureIsNotAvailable.showToast;
            },
            child: Container(
              padding: 5.edgeInsetsAll,
              decoration: BoxDecoration(borderRadius: 10.borderRadiusAll, color: isDark ? AppColors.searchBarAndBordersDark : AppColors.searchBarAndBordersLight),
              child: Icon(Icons.edit, color: isDark ? AppColors.textAndBottomBarIconsDark : AppColors.textAndBottomBarIconsLight),
            ),
          ),
          15.gap,
          InkWell(
            onTap: () {
              AppStrings.thisFeatureIsNotAvailable.showToast;
            },
            child: Container(
              padding: 12.edgeInsetsAll,
              decoration: BoxDecoration(borderRadius: 10.borderRadiusAll, color: isDark ? AppColors.floatingActionButtonDark : AppColors.floatingActionButtonLight),
              child: Icon(Icons.camera_alt, color: isDark ? AppColors.backgroundDark : AppColors.backgroundLight),
            ),
          ),
        ],
      ),
    );
  }
}
