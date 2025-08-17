import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_app_task/core/constants/extensions.dart';
import 'package:whats_app_task/core/constants/strings.dart';
import 'package:whats_app_task/core/theme/colors.dart';
import 'package:whats_app_task/core/theme/fonts.dart';
import 'package:whats_app_task/logic/cubits/nav_bar_cubit/nav_bar_cubit.dart';
import 'package:whats_app_task/presentation/screens/chat_screen.dart';
import 'package:whats_app_task/presentation/screens/status_screen.dart';

class NavBarScreen extends StatelessWidget {
  const NavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<NavBarCubit, String>(
          builder: (context, state) {
            return state == AppStrings.chats
                ? ChatScreen()
                : state == AppStrings.updates
                ? StatusScreen()
                : Center(
                    child: Text(
                      "$state Screen Is Not Available",
                      style: TextStyle(fontSize: AppFonts.h2, fontWeight: AppFonts.bold, color: isDark ? AppColors.textAndBottomBarIconsDark : AppColors.textAndBottomBarIconsLight),
                    ),
                  );
          },
        ),
        bottomSheet: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: 10.edgeInsetsVertical,
              alignment: Alignment.center,
              color: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
              child: BlocBuilder<NavBarCubit, String>(
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Spacer(),
                      _buildBottomSheetItem(isDark: isDark, icon: Icons.chat_rounded, title: AppStrings.chats, isSelected: state == AppStrings.chats, context: context),
                      Spacer(),
                      _buildBottomSheetItem(isDark: isDark, icon: Icons.update_rounded, title: AppStrings.updates, isSelected: state == AppStrings.updates, context: context),
                      Spacer(),
                      _buildBottomSheetItem(isDark: isDark, icon: Icons.groups_outlined, title: AppStrings.communities, isSelected: state == AppStrings.communities, context: context),
                      Spacer(),
                      _buildBottomSheetItem(isDark: isDark, icon: Icons.phone_outlined, title: AppStrings.calls, isSelected: state == AppStrings.calls, context: context),
                      Spacer(),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomSheetItem({required bool isDark, required bool isSelected, required IconData icon, required String title, required BuildContext context}) {
    return InkWell(
      onTap: () {
        context.read<NavBarCubit>().changeScreen(title);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedContainer(
            duration: 250.milSec,
            padding: 20.edgeInsetsHorizontal,
            decoration: BoxDecoration(color: isSelected ? (isDark ? AppColors.selectedItemDark : AppColors.selectedItemLight) : AppColors.transparent, borderRadius: 25.borderRadiusAll),
            child: Padding(
              padding: 6.edgeInsetsVertical,
              child: Icon(icon, color: isDark ? AppColors.textAndBottomBarIconsDark : AppColors.textAndBottomBarIconsLight),
            ),
          ),
          5.gap,
          Text(
            title,
            style: TextStyle(fontWeight: AppFonts.bold, fontSize: AppFonts.h3),
          ),
        ],
      ),
    );
  }
}
