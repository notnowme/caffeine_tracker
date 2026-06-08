part of '../report_screen.dart';

class _Summary extends ConsumerWidget {
  const _Summary();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final summary = ref.watch(reportSummaryProvider).value;
    return Row(
      children: [
        _SummaryItem(
          isOver: true,
          days: '${summary?['over'] ?? 0}',
          type: '최근 일주일 중',
        ),
        context.horizontalSpace(10),
        _SummaryItem(
          isOver: false,
          days: '${summary?['down'] ?? 0}',
          type: '최근 일주일 중',
        ),
      ],
    );
  }
}

class _SummaryItem extends StatelessWidget {
  const _SummaryItem({
    required this.isOver,
    required this.days,
    required this.type,
  });

  final bool isOver;
  final String days;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: context.edgeInsets(all: 16),
        decoration: BoxDecoration(
          boxShadow: boxShadows(),
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(context.r(20)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: context.w(30),
              height: context.h(30),
              decoration: BoxDecoration(
                color: isOver
                    ? AppColors.error.withValues(alpha: 0.5)
                    : AppColors.good.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(context.r(10)),
              ),
              child: Center(
                child: Icon(
                  isOver ? Icons.error_outline_rounded : Icons.check_rounded,
                  color: isOver ? AppColors.error : AppColors.good,
                ),
              ),
            ),
            Text(
              '$days일',
              style: AppFonts.h2.copyWith(color: AppColors.primary),
            ),
            Text(
              isOver ? '권장량 초과' : '권장량 이내',
              style: AppFonts.body.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(type, style: AppFonts.tiny.copyWith(color: AppColors.fg04)),
          ],
        ),
      ),
    );
  }
}
