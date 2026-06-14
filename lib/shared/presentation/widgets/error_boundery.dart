import 'package:caffeine_tracker/common/const/colors.dart';
import 'package:caffeine_tracker/shared/presentation/providers/error_provider.dart';
import 'package:caffeine_tracker/shared/presentation/widgets/alert_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:go_router/go_router.dart';

class ErrorBoundery extends ConsumerWidget {
  const ErrorBoundery({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(errorProvider, (prev, error) {
      if (error != null) {
        showDialog(
          useRootNavigator: true,
          context: context,
          builder: (alertContext) {
            return Dialog(
              backgroundColor: Colors.transparent,
              insetPadding: context.edgeInsets(horizontal: 24),
              child: CustomAlertDialog(
                icon: CupertinoIcons.delete,
                iconColor: AppColors.error,
                title: '오류가 발생했습니다',
                body: error.message,
                confirmText: '닫기',
                confirm: () {
                  context.pop();
                  ref.read(errorProvider.notifier).clear();
                },
              ),
            );
          },
        );
      }
    });
    return child;
  }
}
