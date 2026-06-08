part of '../info_screen.dart';

class _Sensitive extends StatelessWidget {
  const _Sensitive();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '카페인 민감도',
          style: AppFonts.small.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.w800,
          ),
        ),
        context.verticalSpace(8),
        Consumer(
          builder: (consumerContext, ref, child) {
            final sense = ref.watch(infoProvider.select((info) => info.sense));
            return IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _SensitiveChip(
                    sense: '둔감',
                    desc: '4잔 +',
                    isSelected: sense.sense == Sensitive.low.sense,
                    onTap: () => ref
                        .read(infoProvider.notifier)
                        .updateSense(Sensitive.low),
                  ),
                  context.horizontalSpace(8),
                  _SensitiveChip(
                    sense: '평범',
                    desc: '2~3잔',
                    isSelected: sense.sense == Sensitive.normal.sense,
                    onTap: () => ref
                        .read(infoProvider.notifier)
                        .updateSense(Sensitive.normal),
                  ),
                  context.horizontalSpace(8),
                  _SensitiveChip(
                    sense: '민감',
                    desc: '오후 자제',
                    isSelected: sense.sense == Sensitive.high.sense,
                    onTap: () => ref
                        .read(infoProvider.notifier)
                        .updateSense(Sensitive.high),
                  ),
                ],
              ),
            );
          },
        ),
        context.verticalSpace(4),
        Text(
          '한 잔으로도 잠 안 오면 민감으로',
          style: AppFonts.tiny.copyWith(color: AppColors.fg04),
        ),
      ],
    );
  }
}

class _SensitiveChip extends StatelessWidget {
  const _SensitiveChip({
    required this.sense,
    required this.desc,
    required this.isSelected,
    required this.onTap,
  });

  final String sense;
  final String desc;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: onTap,
        child: Container(
          padding: context.edgeInsets(top: 8, bottom: 8),
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
                sense,
                style: AppFonts.small.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(desc, style: AppFonts.tiny.copyWith(color: AppColors.fg04)),
            ],
          ),
        ),
      ),
    );
  }
}
