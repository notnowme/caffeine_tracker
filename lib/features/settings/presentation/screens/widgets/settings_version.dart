part of '../settings_screen.dart';

class _Version extends StatelessWidget {
  const _Version();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '카페인 스테이 v 1.0.0',
        style: AppFonts.tiny.copyWith(color: AppColors.fg04),
      ),
    );
  }
}
