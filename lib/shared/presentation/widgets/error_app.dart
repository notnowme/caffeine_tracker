import 'package:caffeine_tracker/common/const/colors.dart';
import 'package:caffeine_tracker/common/const/fonts.dart';
import 'package:caffeine_tracker/main.dart';
import 'package:caffeine_tracker/shared/data/models/error_model.dart';
import 'package:caffeine_tracker/shared/presentation/widgets/bounce_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class ErrorApp extends StatelessWidget {
  const ErrorApp({super.key, required this.error});

  final ErrorModel error;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: AppColors.surface,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                CupertinoIcons.exclamationmark,
                color: AppColors.error,
                size: context.h(48),
              ),
              context.verticalSpace(16),
              Text(
                '초기화 하는데 실패했습니다.',
                style: AppFonts.h3.copyWith(color: AppColors.primary),
              ),
              context.verticalSpace(8),
              Text(
                error.message,
                style: AppFonts.tiny.copyWith(color: AppColors.fg04),
              ),
              context.verticalSpace(24),
              Padding(
                padding: context.edgeInsets(horizontal: 20),
                child: BounceButton(
                  buttonColor: AppColors.primary,
                  child: Text(
                    '다시 시도',
                    style: AppFonts.h3.copyWith(color: AppColors.onPrimary),
                  ),
                  action: () => main(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
