import 'package:caffeine_tracker/common/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:go_router/go_router.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppBar({
    super.key,
    required this.title,
    this.showBackButton = true,
    this.actions,
  });

  final bool showBackButton;
  final Widget title;
  final List<Widget>? actions;

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.bg,
      shadowColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      toolbarHeight: context.h(52),
      elevation: 0,
      leadingWidth: showBackButton ? context.w(48) : 0,
      leading: showBackButton
          ? IconButton(
              onPressed: () => context.pop(),
              icon: Icon(Icons.arrow_back_ios_new_rounded, size: context.h(24)),
            )
          : const SizedBox.shrink(),
      centerTitle: false,
      title: title,
      actions: actions,
    );
  }
}
