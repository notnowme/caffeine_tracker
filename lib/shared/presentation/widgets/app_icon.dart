import 'package:caffeine_tracker/common/const/colors.dart';
import 'package:caffeine_tracker/shared/presentation/ui/container_deco.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_svg/svg.dart';

class AppIcon extends StatelessWidget {
  const AppIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.w(200),
      height: context.h(220),
      decoration: BoxDecoration(
        boxShadow: boxShadows(),
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(context.r(20)),
      ),
      child: SvgPicture.asset('assets/icons/coffee_bean.svg'),
    );
  }
}
