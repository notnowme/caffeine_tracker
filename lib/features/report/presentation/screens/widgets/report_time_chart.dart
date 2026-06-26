part of '../report_screen.dart';

class _TimeChart extends StatelessWidget {
  const _TimeChart();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: context.edgeInsets(horizontal: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '시간대별 패턴',
                style: AppFonts.h3.copyWith(color: AppColors.primary),
              ),
            ],
          ),
        ),
        context.verticalSpace(4),
        _TimePatternGraph(),
      ],
    );
  }
}

class _TimePatternGraph extends ConsumerWidget {
  const _TimePatternGraph();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<double> timePatternData =
        ref.watch(reportTimePatternProvider).value ?? [];
    return Container(
      padding: context.edgeInsets(vertical: 20, horizontal: 18),
      decoration: BoxDecoration(
        boxShadow: boxShadows(),
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(context.r(20)),
      ),
      child: Column(
        children: [
          SizedBox(
            height: context.h(70),
            child: BarChart(
              BarChartData(
                minY: 0,
                maxY: 1000 * 1.1,

                barTouchData: BarTouchData(enabled: false),

                titlesData: FlTitlesData(show: false),
                gridData: FlGridData(show: false),
                borderData: FlBorderData(show: false),

                // 바 간격 줄이기
                groupsSpace: 2,

                barGroups: _buildHourlyBarGroups(timePatternData),
              ),
            ),
          ),
          Padding(
            padding: context.edgeInsets(top: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: ['0시', '6시', '12시', '18시', '24시']
                  .map(
                    (e) => Text(
                      e,
                      style: AppFonts.tiny.copyWith(color: AppColors.fg04),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

List<BarChartGroupData> _buildHourlyBarGroups(List<double> data) {
  return data.asMap().entries.map((e) {
    return BarChartGroupData(
      x: e.key,
      barRods: [
        BarChartRodData(
          toY: e.value.toDouble(),
          color: AppColors.primary,
          width: 10, // 촘촘하게
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(1),
            topRight: Radius.circular(1),
          ),
        ),
      ],
    );
  }).toList();
}
