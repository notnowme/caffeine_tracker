part of '../onboard_screen.dart';

class _Text extends StatelessWidget {
  const _Text();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '카페인 스테이에 오신 걸 환영해요',
          style: AppFonts.small.copyWith(color: AppColors.primary),
        ),
        context.verticalSpace(18),
        Text(
          '카페인 관리를\n시작해 보세요',
          style: AppFonts.h1.copyWith(color: AppColors.fg),
        ),
        context.verticalSpace(17),
        Text(
          '마신 음료를 기록하면 체내 카페인 농도를\n추적할 수 있어요',
          style: AppFonts.body.copyWith(color: AppColors.fg03),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
