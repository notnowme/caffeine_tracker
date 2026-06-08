part of '../report_screen.dart';

class _TabList extends StatelessWidget {
  const _TabList();

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      padding: context.edgeInsets(vertical: 22, horizontal: 20),
      decoration: BoxDecoration(
        boxShadow: boxShadows(),
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(context.r(20)),
      ),
      child: Column(
        children: [
          _TabCaffeineInfo(),
          context.verticalSpace(40),
          _TabCaffeineGraph(),
        ],
      ),
    );
  }
}

class _TabCaffeineInfo extends ConsumerWidget {
  const _TabCaffeineInfo();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final caffeineAmount = ref.watch(reportCaffeineDataProvider).value ?? [];
    final total = caffeineAmount.fold(0.0, (s, r) => s + r);
    final avg = caffeineAmount.isEmpty ? 0 : total / caffeineAmount.length;
    final changePercent =
        ref.watch(reportChangeCaffeinePercentProvider).value ?? 0.0;

    final isIncre = changePercent >= 0;

    final date = ref.watch(chartDateProvider);
    final day = switch (date) {
      ChartDate.week => '지난 7일보다',
      ChartDate.month => '지난 1달보다',
      ChartDate.year => '지난 1년보다',
    };
    final days = switch (date) {
      ChartDate.week => '최근 7일',
      ChartDate.month => '최근 1달',
      ChartDate.year => '최근 1년',
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '일 평균 섭취량',
              style: AppFonts.small.copyWith(color: AppColors.fg04),
            ),
            Container(
              padding: context.edgeInsets(vertical: 4, horizontal: 10),
              decoration: BoxDecoration(
                color: isIncre
                    ? AppColors.error.withValues(alpha: 0.3)
                    : AppColors.good.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(context.r(14)),
              ),
              child: Text(
                '$day ${isIncre ? '+' : '-'}${changePercent.abs().toStringAsFixed(0)}%',
                style: AppFonts.small.copyWith(
                  color: isIncre ? AppColors.error : AppColors.good,
                ),
              ),
            ),
          ],
        ),
        TweenAnimationBuilder(
          tween: Tween(begin: 0, end: avg),
          duration: const Duration(milliseconds: 500),
          builder: (context, value, child) {
            return RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: value.toStringAsFixed(0),
                    style: AppFonts.hero.copyWith(color: AppColors.primary),
                  ),
                  TextSpan(
                    text: ' mg',
                    style: AppFonts.h2.copyWith(color: AppColors.primary),
                  ),
                ],
              ),
            );
          },
        ),
        Text(
          '총 ${total.toStringAsFixed(0)}mg · $days',
          style: AppFonts.tiny.copyWith(color: AppColors.fg04),
        ),
      ],
    );
  }
}

class _TabCaffeineGraph extends ConsumerStatefulWidget {
  const _TabCaffeineGraph();

  @override
  ConsumerState<_TabCaffeineGraph> createState() => _TabCaffeineGraphState();
}

class _TabCaffeineGraphState extends ConsumerState<_TabCaffeineGraph> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    final date = ref.watch(chartDateProvider);
    final isMonth = date == ChartDate.month;
    final barWidth = context.w(30 + 4);
    final chartWidth = isMonth ? context.w(30 * barWidth) : double.infinity;
    final targetAmount =
        ref.watch(myInfoProvider.select((e) => e.value?.targetAmount)) ?? 400;
    final maxAmount = switch (date) {
      ChartDate.week => 600.0,
      ChartDate.month => 600.0,
      ChartDate.year => 5000.0,
    };
    final List<double> caffeineDataList =
        ref.watch(reportCaffeineDataProvider).value ?? [];
    if (caffeineDataList.isEmpty) {
      return Text(
        '카페인 기록 후 데이터를 확인해 보세요',
        style: AppFonts.body.copyWith(
          color: AppColors.primary,
          fontWeight: FontWeight.w800,
        ),
      );
    }
    final chart = SizedBox(
      width: chartWidth,
      height: context.h(150),
      child: BarChart(
        duration: const Duration(milliseconds: 200),
        curve: const Cubic(0.64, 0.34, 0.46, 0.82),
        BarChartData(
          minY: 0,
          maxY: maxAmount,
          // 점선
          extraLinesData: ExtraLinesData(
            horizontalLines: date == ChartDate.week || date == ChartDate.month
                ? [
                    HorizontalLine(
                      y: targetAmount,
                      color: AppColors.primary.withValues(alpha: 0.5),
                      strokeWidth: 1,
                      dashArray: [6, 4],
                      label: HorizontalLineLabel(
                        show: true,
                        alignment: Alignment.topRight,
                        labelResolver: (_) => '목표 카페인 섭취량',
                        style: AppFonts.tiny.copyWith(
                          color: AppColors.primary.withValues(alpha: 0.5),
                        ),
                      ),
                    ),
                  ]
                : [],
          ),

          // 터치
          barTouchData: BarTouchData(
            enabled: true,
            touchTooltipData: BarTouchTooltipData(
              getTooltipColor: (_) => Colors.white,
              tooltipBorder: BorderSide(width: 1, color: AppColors.line),
              tooltipHorizontalAlignment: FLHorizontalAlignment.center,
              tooltipPadding: context.edgeInsets(horizontal: 8, vertical: 4),
              // tooltipMargin: context.h(5),
              getTooltipItem: (group, groupIndex, rod, rodIndex) {
                return BarTooltipItem(
                  '${((rod.toY >= 10 ? rod.toY - 10 : rod.toY).toStringAsFixed(0)).toString()}mg',
                  AppFonts.tiny.copyWith(color: AppColors.primary),
                );
              },
            ),
            touchCallback: (event, barTouchRes) {
              setState(() {
                if (!event.isInterestedForInteractions ||
                    barTouchRes == null ||
                    barTouchRes.spot == null) {
                  touchedIndex = -1;
                  return;
                }
                touchedIndex = barTouchRes.spot!.touchedBarGroupIndex;
              });
            },
          ),

          // x축
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  final now = DateTime.now();

                  final label = switch (date) {
                    ChartDate.week => () {
                      final day = now.subtract(
                        Duration(days: 6 - value.toInt()),
                      );
                      return '${day.month}/${day.day}';
                    }(),
                    ChartDate.month => () {
                      final day = now.subtract(
                        Duration(days: 29 - value.toInt()),
                      );
                      return '${day.day}일';
                    }(),
                    ChartDate.year => () {
                      final month = (now.month - 11 + value.toInt());
                      final adjustedMonth = month <= 0 ? month + 12 : month;
                      return '$adjustedMonth월';
                    }(),
                  };

                  return Text(label, style: AppFonts.tiny);
                },
              ),
            ),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),

          // grid 제거
          gridData: FlGridData(show: false),
          borderData: FlBorderData(show: false),

          // 바 데이터
          barGroups: _buildBarGroups(
            show: date == ChartDate.week || date == ChartDate.month,
            index: touchedIndex,
            data: caffeineDataList,
            limit: targetAmount,
          ),
        ),
      ),
    );
    if (isMonth) {
      return SingleChildScrollView(
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        child: chart,
      );
    }
    return chart;
  }
}

List<BarChartGroupData> _buildBarGroups({
  required bool show,
  required int index,
  required List<double> data,
  required double limit,
}) {
  return data.asMap().entries.map((e) {
    final bool isTouched = e.key == index;
    final isOver = e.value > limit;
    return BarChartGroupData(
      x: e.key,
      barRods: [
        BarChartRodData(
          toY: isTouched ? e.value + 10 : e.value,
          color: isOver && show
              ? isTouched
                    ? AppColors.error
                    : AppColors.error.withValues(alpha: 0.8)
              : isTouched
              ? AppColors.primary
              : AppColors.primary.withValues(alpha: 0.7),
          width: 36,
          borderRadius: BorderRadius.circular(6),
        ),
      ],
    );
  }).toList();
}
