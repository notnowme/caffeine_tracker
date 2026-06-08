part of '../info_screen.dart';

class _Text extends StatelessWidget {
  const _Text();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '맞춤 권장량을 계산해드릴게요',
          style: AppFonts.h2.copyWith(color: AppColors.primary),
        ),
        context.verticalSpace(4),
        Text(
          '아래 정보를 알려주시면 더 정확한 잔존량과 권장량을 보여드려요.',
          style: AppFonts.small.copyWith(color: AppColors.fg04),
        ),
      ],
    );
  }
}
