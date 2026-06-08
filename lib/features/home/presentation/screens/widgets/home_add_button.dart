part of '../home_screen.dart';

class _AddButton extends StatelessWidget {
  const _AddButton();

  @override
  Widget build(BuildContext context) {
    return BounceButton(
      buttonColor: Colors.transparent,
      action: () {
        print('hi');
      },
      child: DottedBorder(
        options: RoundedRectDottedBorderOptions(
          padding: EdgeInsets.zero,
          strokeWidth: 2,
          dashPattern: [6, 7],
          color: AppColors.fg.withValues(alpha: 0.4),
          strokeCap: StrokeCap.round,
          radius: Radius.circular(context.r(14)),
        ),
        child: Container(
          padding: context.edgeInsets(all: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(context.r(14)),
          ),
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.add, color: AppColors.fg04),
                Text(
                  '음료 추가하기',
                  style: AppFonts.h3.copyWith(color: AppColors.fg04),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
