part of '../splash_screen.dart';

class _Text extends StatelessWidget {
  const _Text();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Caffeine Stay',
          style: AppFonts.h1.copyWith(color: AppColors.primary),
        ),
        context.horizontalSpace(6),
        Text(
          '한 잔, 가볍게 기록해요.',
          style: AppFonts.body.copyWith(color: AppColors.fg03),
        ),
      ],
    );
  }
}
