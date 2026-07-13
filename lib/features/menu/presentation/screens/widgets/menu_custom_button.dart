part of '../menu_screen.dart';

class _CustomButton extends ConsumerWidget {
  const _CustomButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: context.edgeInsets(horizontal: 10),
      child: BounceButton(
        buttonColor: Colors.transparent,
        action: () async {
          context.pushNamed(MenuCustomScreen.routeName);
        },
        child: DottedBorder(
          options: RoundedRectDottedBorderOptions(
            padding: EdgeInsets.zero,
            strokeWidth: 4,
            dashPattern: [6, 7],
            color: AppColors.fg.withValues(alpha: 0.4),
            strokeCap: StrokeCap.round,
            radius: Radius.circular(context.r(14)),
          ),
          child: Container(
            padding: context.edgeInsets(all: 12),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(context.r(14)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: context.w(38),
                      height: context.h(38),
                      decoration: BoxDecoration(
                        color: AppColors.surface02,
                        borderRadius: BorderRadius.circular(context.r(12)),
                      ),
                      child: Icon(
                        CupertinoIcons.pencil,
                        color: AppColors.primary,
                      ),
                    ),
                    context.horizontalSpace(14),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '직접 입력하기',
                          style: AppFonts.small.copyWith(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          '원하는 음료가 없으면 직접 입력해 보세요',
                          style: AppFonts.tiny.copyWith(
                            color: AppColors.fg04,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.chevron_right,
                      size: context.h(24),
                      color: AppColors.primary.withValues(alpha: 0.8),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
