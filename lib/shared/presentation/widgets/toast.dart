import 'package:caffeine_tracker/common/const/colors.dart';
import 'package:caffeine_tracker/common/const/fonts.dart';
import 'package:caffeine_tracker/shared/presentation/ui/container_deco.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastMessage {
  static void showTaost(BuildContext context, String msg, {int bottom = 40}) {
    final fToast = FToast();
    fToast.init(context);
    Widget toast = Container(
      width: MediaQuery.of(context).size.width - context.h(40),
      margin: context.edgeInsets(horizontal: 20),
      padding: context.edgeInsets(horizontal: 14, vertical: 9),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(context.r(10)),
        boxShadow: boxShadows(),
      ),
      child: Text(
        msg,
        style: AppFonts.small.copyWith(color: AppColors.primary),
      ),
    );

    if (context.mounted) {
      fToast.showToast(
        child: toast,
        toastDuration: const Duration(seconds: 2),
        positionedToastBuilder: (context, child, gravity) {
          return Positioned(top: context.h(40), child: child);
        },
      );
    }
  }
}
