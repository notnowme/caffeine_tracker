import 'package:bounce_tapper/bounce_tapper.dart';
import 'package:caffeine_tracker/common/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class BounceButton extends StatelessWidget {
  const BounceButton({
    super.key,
    required this.buttonColor,
    required this.child,
    required this.action,
  });

  final Color buttonColor;
  final Widget child;
  final VoidCallback action;

  @override
  Widget build(BuildContext context) {
    return BounceTapper(
      onTap: action,
      highlightColor: AppColors.surface.withValues(alpha: 0.1),
      child: Container(
        padding: context.edgeInsets(vertical: context.h(14)),
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(context.r(14)),
        ),
        child: Center(child: child),
      ),
    );
  }
}
