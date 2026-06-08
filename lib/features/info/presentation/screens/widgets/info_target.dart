part of '../info_screen.dart';

class _Target extends StatelessWidget {
  const _Target();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '일일 목표량',
              style: AppFonts.small.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.w800,
              ),
            ),
            Consumer(
              builder: (context, ref, child) {
                final targetAmount = ref.watch(
                  infoProvider.select((data) => data.targetAmount),
                );
                return Text(
                  '${targetAmount.toStringAsFixed(0)}mg',
                  style: AppFonts.small.copyWith(color: AppColors.primary),
                );
              },
            ),
          ],
        ),
        context.verticalSpace(8),
        _TargetSlider(),
        context.verticalSpace(8),
      ],
    );
  }
}

class _TargetSlider extends StatelessWidget {
  const _TargetSlider();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.edgeInsets(horizontal: 14, vertical: 16),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.line),
        borderRadius: BorderRadius.circular(context.r(14)),
        color: AppColors.surface,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Consumer(
            builder: (context, ref, child) {
              final targetAmount = ref.watch(
                infoProvider.select((data) => data.targetAmount),
              );
              return SliderTheme(
                data: SliderThemeData(
                  trackHeight: context.h(8),
                  thumbShape: RoundSliderThumbShape(
                    enabledThumbRadius: context.h(8),
                  ),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 0),
                  activeTrackColor: AppColors.fg03,
                  inactiveTrackColor: AppColors.surface02,
                  thumbColor: AppColors.primary,
                  overlayColor: AppColors.fg04,
                  trackShape: RoundedRectSliderTrackShape(),
                ),
                child: Slider(
                  value: targetAmount,
                  min: 100,
                  max: 600,
                  onChanged: (v) {
                    ref.read(infoProvider.notifier).updateAmount(v);
                  },
                  padding: EdgeInsets.zero,
                ),
              );
            },
          ),
          context.verticalSpace(4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '100mg',
                style: AppFonts.tiny.copyWith(color: AppColors.primary),
              ),
              Text(
                '식약처 권고 400mg',
                style: AppFonts.tiny.copyWith(color: AppColors.primary),
              ),
              Text(
                '600mg',
                style: AppFonts.tiny.copyWith(color: AppColors.primary),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
