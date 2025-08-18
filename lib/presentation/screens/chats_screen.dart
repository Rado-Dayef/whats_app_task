import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_app_task/core/constants/extensions.dart';
import 'package:whats_app_task/core/constants/strings.dart';
import 'package:whats_app_task/core/theme/assets.dart';
import 'package:whats_app_task/core/theme/colors.dart';
import 'package:whats_app_task/core/theme/fonts.dart';
import 'package:whats_app_task/data/models/chat_model.dart';
import 'package:whats_app_task/logic/cubits/chats_cubit/chats_cubit.dart';
import 'package:whats_app_task/presentation/widgets/chat_widget.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        surfaceTintColor: AppColors.transparent,
        foregroundColor: isDark ? AppColors.textAndBottomBarIconsDark : AppColors.textAndBottomBarIconsLight,
        title: Text(
          AppStrings.appName,
          style: TextStyle(color: isDark ? AppColors.titleDark : AppColors.titleLight, fontSize: AppFonts.h1, fontWeight: AppFonts.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              AppStrings.thisFeatureIsNotAvailable.showToast;
            },
            icon: Icon(Icons.camera_alt_outlined),
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
        create: (context) => ChatsCubit(),
        child: SingleChildScrollView(
          padding: 10.edgeInsetsAll,
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  AppStrings.thisFeatureIsNotAvailable.showToast;
                },
                child: TextFormField(
                  /// Doesn't work on disabled mode
                  // onTap: () {
                  //   AppStrings.thisFeatureIsNotAvailable.showToast;
                  // },
                  enabled: false,
                  style: TextStyle(color: isDark ? AppColors.subTextAndIconsDark : AppColors.subTextAndIconsLight),
                  decoration: InputDecoration(
                    filled: true,
                    hintText: AppStrings.askMetaAiOrSearch,
                    border: OutlineInputBorder(
                      borderRadius: 25.borderRadiusAll,
                      borderSide: BorderSide(color: AppColors.transparent),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: 25.borderRadiusAll,
                      borderSide: BorderSide(color: AppColors.transparent),
                    ),
                    fillColor: isDark ? AppColors.searchBarAndBordersDark : AppColors.searchBarAndBordersLight,
                    prefixIcon: Icon(Icons.search, color: isDark ? AppColors.subTextAndIconsDark : AppColors.subTextAndIconsLight),
                  ),
                ),
              ),
              20.gap,
              Align(
                alignment: Alignment.centerLeft,
                child: BlocBuilder<ChatsCubit, ChatsState>(
                  builder: (context, state) {
                    if (state is ChatsSuccess) {
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: state.categories.map((category) {
                            return Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    context.read<ChatsCubit>().changeCategory(category.name);
                                  },
                                  child: AnimatedContainer(
                                    duration: 250.milSec,
                                    padding: 15.edgeInsetsHorizontal,
                                    decoration: BoxDecoration(
                                      color: category.isSelected ? (isDark ? AppColors.selectedItemDark : AppColors.selectedItemLight) : AppColors.transparent,
                                      borderRadius: 25.borderRadiusAll,
                                      border: Border.all(color: isDark ? AppColors.searchBarAndBordersDark : AppColors.searchBarAndBordersLight),
                                    ),
                                    child: Padding(padding: 5.edgeInsetsVertical, child: Text(category.name)),
                                  ),
                                ),
                                10.gap,
                              ],
                            );
                          }).toList(),
                        ),
                      );
                    } else {
                      return 0.gap;
                    }
                  },
                ),
              ),
              15.gap,
              _buildLockedChatsAndArchivedItem(Icons.lock_outlined, title: AppStrings.lockedChats, isDark: isDark),
              _buildLockedChatsAndArchivedItem(Icons.archive_outlined, title: AppStrings.archived, isDark: isDark),
              10.gap,
              BlocBuilder<ChatsCubit, ChatsState>(
                builder: (context, state) {
                  if (state is ChatsSuccess) {
                    return state.chats.isEmpty
                        ? Text(
                            AppStrings.noChatsFound,
                            style: TextStyle(color: isDark ? AppColors.textAndBottomBarIconsDark : AppColors.textAndBottomBarIconsLight, fontSize: AppFonts.h4, fontWeight: AppFonts.bold),
                          )
                        : ListView.separated(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: state.chats.length,
                            itemBuilder: (_, int index) {
                              ChatModel chat = state.chats[index];
                              return ChatWidget(chat);
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
              child: Image.asset(AppAssets.metaAi, height: 25, width: 25),
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
              child: Icon(Icons.mark_unread_chat_alt, color: isDark ? AppColors.backgroundDark : AppColors.backgroundLight),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLockedChatsAndArchivedItem(IconData icon, {required String title, required bool isDark}) {
    return InkWell(
      onTap: () {
        AppStrings.thisFeatureIsNotAvailable.showToast;
      },
      child: Row(
        children: [
          SizedBox(
            width: 50,
            height: 50,
            child: Center(child: Icon(icon, color: isDark ? AppColors.subTextAndIconsDark : AppColors.subTextAndIconsLight)),
          ),
          10.gap,
          Text(
            title,
            style: TextStyle(color: isDark ? AppColors.subTextAndIconsDark : AppColors.subTextAndIconsLight, fontSize: AppFonts.h4, fontWeight: AppFonts.bold),
          ),
        ],
      ),
    );
  }
}
