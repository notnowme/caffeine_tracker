import 'package:caffeine_tracker/common/const/colors.dart';
import 'package:caffeine_tracker/common/const/fonts.dart';
import 'package:caffeine_tracker/features/home/presentation/screens/home_screen.dart';
import 'package:caffeine_tracker/features/menu/presentation/screen/menu_screen.dart';
import 'package:caffeine_tracker/features/report/presentation/screens/report_screen.dart';
import 'package:caffeine_tracker/features/settings/presentation/screen/settings_screen.dart';
import 'package:caffeine_tracker/shared/presentation/providers/bottom_nav_provider.dart';
import 'package:caffeine_tracker/shared/presentation/widgets/alert_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:go_router/go_router.dart';

class BottomNav extends ConsumerWidget {
  const BottomNav({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        final currentrPage = ref.read(pageProvider);

        if (currentrPage != 0) {
          ref.read(pageProvider.notifier).goHome();
          return;
        }
        showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              backgroundColor: Colors.transparent,
              insetPadding: context.edgeInsets(horizontal: 24),
              child: CustomAlertDialog(
                icon: Icons.hail_rounded,
                iconColor: AppColors.primary,
                title: '앱을 종료할까요?',
                body: '깜빡한 카페인 섭취는 없나요?',
                actionTitle: '종료',
                action: () async {
                  SystemNavigator.pop();
                },
              ),
            );
          },
        );
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Positioned.fill(child: child),
            Positioned(
              bottom: 0,
              child: Consumer(
                builder: (context, ref, child) {
                  final page = ref.watch(pageProvider);
                  ref.listen(pageProvider, (prev, next) {
                    final routeName = switch (next) {
                      0 => HomeScreen.routeName,
                      2 => ReportScreen.routeName,
                      3 => SettingsScreen.routeName,
                      _ => HomeScreen.routeName,
                    };
                    context.goNamed(routeName);
                  });
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    padding: context.edgeInsets(
                      top: 6,
                      bottom: 20,
                      horizontal: 6,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      border: Border(
                        top: BorderSide(width: 1.5, color: AppColors.line),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _NavIcon(
                          onTap: () {
                            ref.read(pageProvider.notifier).move(0);
                          },
                          icon: CupertinoIcons.home,
                          color: page == 0
                              ? AppColors.primary
                              : AppColors.fg.withValues(alpha: 0.4),
                          label: '홈',
                        ),
                        _NavIcon(
                          onTap: () {
                            context.pushNamed(MenuScreen.routeName);
                          },
                          icon: Icons.add,
                          color: page == 1
                              ? AppColors.primary
                              : AppColors.fg.withValues(alpha: 0.4),
                          label: '기록',
                        ),
                        _NavIcon(
                          onTap: () {
                            ref.read(pageProvider.notifier).move(2);
                          },
                          icon: CupertinoIcons.chart_bar_fill,
                          color: page == 2
                              ? AppColors.primary
                              : AppColors.fg.withValues(alpha: 0.4),
                          label: '리포트',
                        ),
                        _NavIcon(
                          onTap: () {
                            ref.read(pageProvider.notifier).move(3);
                          },
                          icon: Icons.settings,
                          color: page == 3
                              ? AppColors.primary
                              : AppColors.fg.withValues(alpha: 0.4),
                          label: '설정',
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavIcon extends StatelessWidget {
  const _NavIcon({
    required this.icon,
    required this.color,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final Color color;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Container(
        padding: context.edgeInsets(all: 12),
        child: Column(
          children: [
            Icon(icon, color: color, size: context.h(24)),
            Text(label, style: AppFonts.tiny.copyWith(color: color)),
          ],
        ),
      ),
    );
  }
}
