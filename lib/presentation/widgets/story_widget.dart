import 'package:flutter/material.dart';
import 'package:whats_app_task/core/constants/extensions.dart';
import 'package:whats_app_task/core/routes/route_names.dart';
import 'package:whats_app_task/core/theme/colors.dart';
import 'package:whats_app_task/data/models/story_model.dart';

class StoryWidget extends StatelessWidget {
  final StoryModel story;

  const StoryWidget(this.story, {super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Row(
      children: [
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, AppRouteNames.story, arguments: story);
          },
          child: Hero(
            tag: story.image,
            child: Card(
              elevation: 0,
              margin: 0.edgeInsetsAll,
              child: SizedBox(
                width: 100,
                height: 175,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: 15.borderRadiusAll,
                      child: Opacity(
                        opacity: 0.8,
                        child: Image.asset(story.image, fit: BoxFit.cover, width: double.infinity, height: double.infinity),
                      ),
                    ),
                    Padding(
                      padding: 5.edgeInsetsAll,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: 1.edgeInsetsAll,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: isDark ? AppColors.searchBarAndBordersDark : AppColors.searchBarAndBordersLight, width: 2),
                            ),
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor: isDark ? AppColors.searchBarAndBordersDark : AppColors.searchBarAndBordersLight,
                              child: story.userImage.isEmpty
                                  ? Icon(Icons.person_outline_rounded, color: isDark ? AppColors.textAndBottomBarIconsDark : AppColors.textAndBottomBarIconsLight)
                                  : ClipRRect(
                                      borderRadius: 50.borderRadiusAll,
                                      child: Image.asset(story.userImage, fit: BoxFit.cover, width: 50, height: 50),
                                    ),
                            ),
                          ),
                          Spacer(),
                          Text(story.name, style: TextStyle(color: AppColors.backgroundLight)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        10.gap,
      ],
    );
  }
}
