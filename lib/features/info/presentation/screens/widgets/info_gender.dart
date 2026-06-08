part of '../info_screen.dart';

class _Gender extends StatelessWidget {
  const _Gender();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '성별',
          style: AppFonts.small.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.w800,
          ),
        ),
        context.verticalSpace(8),
        Consumer(
          builder: (consumerContext, ref, child) {
            final gender = ref.watch(
              infoProvider.select((data) => data.gender),
            );
            return IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _GenderChip(
                    gender: '남성',
                    isSelected: gender == Gender.male,
                    onTap: () => ref
                        .read(infoProvider.notifier)
                        .updateGender(Gender.male),
                  ),
                  context.horizontalSpace(8),
                  _GenderChip(
                    gender: '여성',
                    isSelected: gender == Gender.female,
                    onTap: () => ref
                        .read(infoProvider.notifier)
                        .updateGender(Gender.female),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}

class _GenderChip extends StatelessWidget {
  const _GenderChip({
    required this.gender,
    required this.isSelected,
    required this.onTap,
  });

  final String gender;
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
                gender,
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
