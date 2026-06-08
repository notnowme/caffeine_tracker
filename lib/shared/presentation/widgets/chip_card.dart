import 'package:caffeine_tracker/common/const/colors.dart';
import 'package:caffeine_tracker/common/const/fonts.dart';
import 'package:caffeine_tracker/shared/presentation/ui/container_deco.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class ChipCard extends StatelessWidget {
  const ChipCard({
    super.key,
    required this.title,
    required this.desc,
    required this.icon,
  });

  final String title;
  final String desc;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(context.r(20)),
        color: AppColors.surface,
        boxShadow: boxShadows(),
      ),
      child: Padding(
        padding: context.edgeInsets(horizontal: 14, vertical: 14),
        child: Row(
          children: [
            Container(
              width: context.w(36),
              height: context.h(36),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(context.r(12)),
                color: AppColors.surface02,
              ),
              child: icon,
            ),
            context.horizontalSpace(12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppFonts.small.copyWith(color: AppColors.primary),
                ),
                context.verticalSpace(2),
                Text(
                  desc,
                  style: AppFonts.tiny.copyWith(color: AppColors.fg03),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
