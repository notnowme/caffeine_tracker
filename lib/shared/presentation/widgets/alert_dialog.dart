import 'package:bounce_tapper/bounce_tapper.dart';
import 'package:caffeine_tracker/common/const/colors.dart';
import 'package:caffeine_tracker/common/const/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:go_router/go_router.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.body,
    required this.actionTitle,
    required this.action,
  });

  final IconData icon;
  final Color iconColor;
  final String title;
  final String body;
  final String actionTitle;
  final VoidCallback action;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.edgeInsets(vertical: 20, horizontal: 20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(context.r(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: context.edgeInsets(all: 10),
            decoration: BoxDecoration(
              color: iconColor.withValues(alpha: 0.5),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: context.h(24)),
          ),
          context.verticalSpace(12),
          Text(title, style: AppFonts.h2.copyWith(color: AppColors.primary)),
          context.verticalSpace(8),
          Text(
            body,
            style: AppFonts.small.copyWith(
              color: AppColors.fg04,
              fontWeight: FontWeight.w800,
            ),
          ),
          context.verticalSpace(12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: BounceTapper(
                  onTap: () => context.pop(),
                  child: Container(
                    padding: context.edgeInsets(vertical: 14),
                    decoration: BoxDecoration(
                      color: AppColors.line,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        '취소',
                        style: AppFonts.body.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              context.horizontalSpace(12),
              Expanded(
                child: BounceTapper(
                  onTap: action,
                  child: Container(
                    padding: context.edgeInsets(vertical: 14),
                    decoration: BoxDecoration(
                      color: AppColors.error,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        actionTitle,
                        style: AppFonts.body.copyWith(
                          color: AppColors.onPrimary,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
