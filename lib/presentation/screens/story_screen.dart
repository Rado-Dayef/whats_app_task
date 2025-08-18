import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:whats_app_task/core/constants/extensions.dart';
import 'package:whats_app_task/core/constants/strings.dart';
import 'package:whats_app_task/core/theme/colors.dart';
import 'package:whats_app_task/core/theme/fonts.dart';
import 'package:whats_app_task/data/models/story_model.dart';
import 'package:whats_app_task/logic/cubits/story_cubit/story_cubit.dart';

class StoryScreen extends StatelessWidget {
  const StoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    StoryModel story = ModalRoute.of(context)!.settings.arguments as StoryModel;
    return BlocConsumer<StoryCubit, StoryState>(
      listener: (context, state) {
        if (state is StoryFinished) {
          Navigator.of(context).pop();
        }
      },
      builder: (context, state) {
        double progress = 0;
        if (state is StoryProgress) {
          progress = state.progress;
        }
        return Scaffold(
          body: SafeArea(
            child: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              onLongPress: () {
                AppStrings.thisFeatureIsNotAvailable.showToast;
              },
              child: Container(
                alignment: Alignment.center,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Hero(
                      tag: story.image,
                      child: Card(elevation: 0, margin: 0.edgeInsetsAll, child: Image.asset(story.image)),
                    ),
                    Column(
                      children: [
                        TweenAnimationBuilder<double>(
                          tween: Tween<double>(begin: 0, end: progress),
                          duration: 1.sec,
                          builder: (context, value, _) {
                            return LinearProgressIndicator(
                              value: value,
                              color: AppColors.backgroundLight,
                              backgroundColor: AppColors.backgroundLight.withAlpha(150),
                              minHeight: 2,
                              borderRadius: BorderRadius.circular(10), // looks clean
                            );
                          },
                        ),
                        10.gap,
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: Icon(Icons.arrow_back, color: AppColors.textAndBottomBarIconsDark),
                            ),
                            Container(
                              padding: 1.edgeInsetsAll,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: AppColors.searchBarAndBordersDark, width: 2),
                              ),
                              child: CircleAvatar(
                                radius: 20,
                                backgroundColor: AppColors.searchBarAndBordersDark,
                                child: story.userImage.isEmpty
                                    ? Icon(Icons.person_outline_rounded, color: AppColors.textAndBottomBarIconsDark)
                                    : ClipRRect(
                                        borderRadius: 50.borderRadiusAll,
                                        child: Image.asset(story.userImage, fit: BoxFit.cover, width: 50, height: 50),
                                      ),
                              ),
                            ),
                            10.gap,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(story.name, style: TextStyle(color: AppColors.backgroundLight)),
                                Text(
                                  DateFormat("hh:mm a").format(DateTime.now().subtract(3.hour)),
                                  style: TextStyle(color: AppColors.subTextAndIconsDark, fontSize: AppFonts.h6),
                                ),
                              ],
                            ),
                            Spacer(),
                            IconButton(
                              onPressed: () {
                                AppStrings.thisFeatureIsNotAvailable.showToast;
                              },
                              icon: Icon(Icons.more_vert_rounded),
                            ),
                          ],
                        ),
                        Spacer(),
                        Padding(
                          padding: 10.edgeInsetsAll,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      style: TextStyle(color: AppColors.textAndBottomBarIconsDark),
                                      onTapOutside: (_) {
                                        FocusManager.instance.primaryFocus?.unfocus();
                                      },
                                      decoration: InputDecoration(
                                        filled: true,
                                        enabled: false,
                                        hintText: AppStrings.reply,
                                        border: OutlineInputBorder(
                                          borderRadius: 25.borderRadiusAll,
                                          borderSide: BorderSide(color: AppColors.searchBarAndBordersDark),
                                        ),
                                        disabledBorder: OutlineInputBorder(
                                          borderRadius: 25.borderRadiusAll,
                                          borderSide: BorderSide(color: AppColors.searchBarAndBordersDark),
                                        ),
                                        fillColor: AppColors.searchBarAndBordersDark,
                                      ),
                                    ),
                                  ),
                                  10.gap,
                                  InkWell(
                                    onTap: () {},
                                    child: CircleAvatar(
                                      radius: 25,
                                      backgroundColor: AppColors.searchBarAndBordersDark,
                                      child: Icon(Icons.favorite_border, color: AppColors.textAndBottomBarIconsDark),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
