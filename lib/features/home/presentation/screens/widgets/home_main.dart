part of '../home_screen.dart';

class _Main extends StatelessWidget {
  const _Main();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.edgeInsets(top: 28, horizontal: 20, bottom: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(context.r(20)),
        color: AppColors.surface,
        boxShadow: boxShadows(),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _MainCaffeineTextNow(),
          context.verticalSpace(16),
          _MainCaffeineGraphNow(),
          context.verticalSpace(16),
          _MainCaffeineSleepTime(),
          context.verticalSpace(24),
          _MainCaffeineLimit(),
        ],
      ),
    );
  }
}

class _MainCaffeineTextNow extends ConsumerWidget {
  const _MainCaffeineTextNow();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentCaffeine = ref.watch(currentCaffeineProvider);

    final todayAllCaffeine =
        ref.watch(todayTotalCaffeineAmountProvider).value ?? 0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '현재 체내 카페인',
          style: AppFonts.small.copyWith(
            color: AppColors.fg04,
            fontWeight: FontWeight.w600,
          ),
        ),
        currentCaffeine.maybeWhen(
          data: (data) {
            return TweenAnimationBuilder(
              tween: Tween(begin: 0, end: data),
              duration: const Duration(milliseconds: 500),
              builder: (context, value, child) {
                return RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: value.toStringAsFixed(0),
                        style: AppFonts.hero.copyWith(color: AppColors.primary),
                      ),
                      TextSpan(text: ' '),
                      TextSpan(
                        text: 'mg',
                        style: AppFonts.h1.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
          orElse: () {
            return RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '0',
                    style: AppFonts.hero.copyWith(color: AppColors.primary),
                  ),
                  TextSpan(text: ' '),
                  TextSpan(
                    text: 'mg',
                    style: AppFonts.h1.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: '누적 ',
                style: AppFonts.small.copyWith(
                  color: AppColors.fg04,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextSpan(text: ' '),
              TextSpan(
                text: '${todayAllCaffeine}mg',
                style: AppFonts.small.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _MainCaffeineGraphNow extends ConsumerWidget {
  const _MainCaffeineGraphNow();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chartData = ref.watch(caffeineChartDataProvider);
    final targetAmount =
        ref.watch(myInfoProvider.select((e) => e.value?.targetAmount)) ?? 400;
    return Column(
      children: [
        SizedBox(
          height: context.h(210),
          child: chartData.when(
            data: (data) {
              return LineChart(
                duration: const Duration(milliseconds: 300),
                curve: const Cubic(0.64, 0.34, 0.46, 0.82),
                LineChartData(
                  minX: 0,
                  maxX: 12,
                  minY: 0,
                  maxY: targetAmount * 1.2, // 최대값보다 약간 크게 해서 여유 남기기
                  // 그래프 둘러싸는 선
                  borderData: FlBorderData(show: false),
                  titlesData: FlTitlesData(show: false),
                  gridData: FlGridData(show: false),
                  lineBarsData: [
                    LineChartBarData(
                      spots: data,
                      isCurved: true,
                      preventCurveOverShooting: true,
                      curveSmoothness: 0.1,
                      isStrokeJoinRound: true,
                      isStrokeCapRound: true,
                      color: AppColors.primary,
                      barWidth: 3,
                      dotData: FlDotData(
                        show: true,
                        getDotPainter: (spot, percent, bar, index) {
                          if (index == bar.spots.length - 1) {
                            // 마지막 값을 시 점을 표시
                            return FlDotCirclePainter(
                              radius: context.r(4),
                              color: AppColors.primary,
                              strokeColor: AppColors.primary.withValues(
                                alpha: 0.1,
                              ),
                            );
                          }
                          return FlDotCirclePainter(radius: 0);
                        },
                      ),
                      belowBarData: BarAreaData(
                        show: true,
                        color: AppColors.primary,
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            // 선의 바로 밑 잘 보이게
                            AppColors.primary.withValues(alpha: 0.8),

                            // 선의 끝 투명
                            AppColors.primary.withValues(alpha: 0.0),
                          ],
                        ),
                      ),
                    ),
                  ],
                  extraLinesData: ExtraLinesData(
                    // x나 y 보조선 표시
                    extraLinesOnTop: false,
                    horizontalLines: [
                      HorizontalLine(
                        y: 400.toDouble(),
                        dashArray: [
                          // 점선 길이,
                          2,
                        ],
                        color: AppColors.primary.withValues(alpha: 0.3),
                        label: HorizontalLineLabel(
                          show: true,
                          alignment: Alignment.topRight,
                          style: AppFonts.tiny.copyWith(
                            color: AppColors.primary,
                          ),
                          labelResolver: (p0) {
                            return '나의 목표 섭취 카페인 (${targetAmount.toStringAsFixed(0)}mg)';
                          },
                        ),
                      ),
                    ],
                  ),
                  // 터치 시 데이터 표시
                  lineTouchData: LineTouchData(
                    enabled: true,
                    touchTooltipData: LineTouchTooltipData(
                      getTooltipColor: (group) => Colors.white,
                      tooltipBorder: BorderSide(
                        width: 1,
                        color: AppColors.primary.withValues(alpha: 0.2),
                      ),
                      tooltipHorizontalAlignment: FLHorizontalAlignment.center,
                      tooltipPadding: context.edgeInsets(
                        horizontal: context.w(8),
                        vertical: context.h(4),
                      ),
                      tooltipMargin: context.h(5),
                      getTooltipItems: (touchedSpots) {
                        return touchedSpots.map((e) {
                          String amount = e.y.toStringAsFixed(0);
                          return LineTooltipItem(
                            '${amount}mg',
                            AppFonts.tiny.copyWith(color: AppColors.primary),
                          );
                        }).toList();
                      },
                    ),
                  ),
                ),
              );
            },
            error: (e, stack) {
              return SizedBox.shrink();
            },
            loading: () {
              return SizedBox.shrink();
            },
          ),
        ),
        context.verticalSpace(8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: generateTimeLabels().map((time) {
            return Text(
              DateFormat('HHa').format(time).toLowerCase(),
              style: AppFonts.tiny.copyWith(color: AppColors.fg04),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class _MainCaffeineSleepTime extends ConsumerWidget {
  const _MainCaffeineSleepTime();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sleepTime = ref.watch(sleepTimeProvider).value ?? DateTime.now();
    return Container(
      padding: context.edgeInsets(horizontal: 13, vertical: 11),
      decoration: BoxDecoration(
        color: AppColors.fg.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(context.r(14)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            CupertinoIcons.moon,
            color: AppColors.primary,
            size: context.h(16),
          ),
          context.horizontalSpace(4),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '예상 가능 수면 시간: ',
                  style: AppFonts.small.copyWith(
                    color: AppColors.fg04,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text: DateFormat('HH:MM').format(sleepTime),
                  style: AppFonts.small.copyWith(
                    color: AppColors.fg,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MainCaffeineLimit extends ConsumerWidget {
  const _MainCaffeineLimit();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todayTotalCaffeine =
        ref.watch(todayTotalCaffeineAmountProvider).value ?? 0.0;
    final myInfo = ref.watch(myInfoProvider).value ?? InfoModel.empty();
    final remaingAmount = myInfo.targetAmount - todayTotalCaffeine;
    final remainingPercent = CaffeineCalculator.getRemainingPercent(
      currentLevel: remaingAmount,
      targetAmount: myInfo.targetAmount,
    );
    return Center(
      child: Container(
        padding: context.edgeInsets(horizontal: 10, vertical: 7),
        decoration: BoxDecoration(
          color: AppColors.fg.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(context.r(14)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.arrow_right_rounded,
              color: AppColors.primary,
              size: context.h(16),
            ),
            Text(
              '권장량의 ${remainingPercent.toStringAsFixed(1)}% · ${remaingAmount.toStringAsFixed(0)}mg 남았어요',
              style: AppFonts.tiny.copyWith(
                color: AppColors.fg02,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// 현재 시간 기준으로 12시간 전 가져오기
List<DateTime> generateTimeLabels() {
  final now = DateTime.now();
  return List.generate(7, (index) {
    // 0, 2, 4, 6, 8, 10, 12시간 전 계산
    return now.subtract(Duration(hours: (6 - index) * 2));
  });
}
