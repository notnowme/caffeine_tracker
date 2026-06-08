import 'package:caffeine_tracker/common/const/colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class ListItemCard extends StatelessWidget {
  const ListItemCard({
    super.key,
    this.isFirst = false,
    this.isLast = false,
    required this.child,
  });

  final bool isFirst;
  final bool isLast;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.edgeInsets(horizontal: 14, vertical: 18),
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border(
          bottom: isLast
              ? BorderSide(width: 1, color: Colors.transparent)
              : BorderSide(width: 1, color: AppColors.line),
        ),
        borderRadius: BorderRadius.only(
          topLeft: isFirst ? Radius.circular(context.r(20)) : Radius.zero,
          topRight: isFirst ? Radius.circular(context.r(20)) : Radius.zero,
          bottomLeft: isLast ? Radius.circular(context.r(20)) : Radius.zero,
          bottomRight: isLast ? Radius.circular(context.r(20)) : Radius.zero,
        ),
      ),
      child: child,
    );
  }
}
