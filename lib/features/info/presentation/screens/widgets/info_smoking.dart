part of '../info_screen.dart';

class _Smoking extends StatelessWidget {
  const _Smoking();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '흡연 여부',
          style: AppFonts.small.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.w800,
          ),
        ),
        context.verticalSpace(8),
        Consumer(
          builder: (consumerContext, ref, child) {
            final smoking = ref.watch(
              infoProvider.select((data) => data.smoking),
            );
            return IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _SmokingChip(
                    smoke: '흡연',
                    isSelected: smoking == true,
                    onTap: () =>
                        ref.read(infoProvider.notifier).updateSmoking(true),
                  ),
                  context.horizontalSpace(8),
                  _SmokingChip(
                    smoke: '비흡연',
                    isSelected: smoking == false,
                    onTap: () =>
                        ref.read(infoProvider.notifier).updateSmoking(false),
                  ),
                ],
              ),
            );
          },
        ),
        context.verticalSpace(4),
        Text(
          '흡연 여부에 따라 카페인 대사량이 달라요',
          style: AppFonts.tiny.copyWith(color: AppColors.fg04),
        ),
      ],
    );
  }
}

class _SmokingChip extends StatelessWidget {
  const _SmokingChip({
    required this.smoke,
    required this.isSelected,
    required this.onTap,
  });

  final String smoke;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: onTap,
        child: Container(
          padding: context.edgeInsets(top: 12, bottom: 12),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.bg : AppColors.surface,
            border: Border.all(
              width: 1,
              color: isSelected ? AppColors.fg : AppColors.line,
            ),
            borderRadius: BorderRadius.circular(context.r(14)),
          ),
          child: Column(
            children: [
              Text(
                smoke,
                style: AppFonts.small.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
