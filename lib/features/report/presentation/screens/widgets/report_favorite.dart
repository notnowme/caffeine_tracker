part of '../report_screen.dart';

class _Favorite extends ConsumerStatefulWidget {
  const _Favorite();

  @override
  ConsumerState<_Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends ConsumerState<_Favorite> {
  int touchedIndex = -1;
  @override
  Widget build(BuildContext context) {
    final List<DrinkDescModel> descList =
        ref.watch(reportCaffeineDescProvider).value ?? [];
    final total = descList.fold<int>(0, (sum, e) => sum + e.count);
    final isTouched = touchedIndex > -1;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          '가장 많이 섭취한 카페인',
          style: AppFonts.h3.copyWith(color: AppColors.primary),
        ),
        context.verticalSpace(10),
        Container(
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(context.r(20)),
            boxShadow: boxShadows(),
          ),
          child: Column(
            children: [
              // 터치했을 때만 표시
              _FavoriteItem(
                isFirst: true,
                isLast: true,
                menu: isTouched
                    ? descList[touchedIndex].name
                    : descList.isEmpty
                    ? '카페인을 기록 후 데이터를 확인해 보세요'
                    : '항목을 터치하면 표시돼요',
                amount: isTouched ? descList[touchedIndex].count : 0,
                percent: isTouched ? descList[touchedIndex].count / total : 0,
                category: isTouched ? descList[touchedIndex].category : '기타',
              ),

              if (descList.isNotEmpty)
                SizedBox(
                  // margin: context.edgeInsets(vertical: 30),
                  height: context.h(250),
                  child: PieChart(
                    PieChartData(
                      pieTouchData: PieTouchData(
                        enabled: true,
                        touchCallback: (event, res) {
                          setState(() {
                            if (!event.isInterestedForInteractions ||
                                res == null ||
                                res.touchedSection == null) {
                              touchedIndex = -1;
                              return;
                            }
                            touchedIndex =
                                res.touchedSection!.touchedSectionIndex;
                          });
                        },
                      ),
                      borderData: FlBorderData(show: false),
                      sectionsSpace: 1,
                      centerSpaceRadius: context.r(50),
                      sections: List.generate(descList.length, (i) {
                        final isTouched = i == touchedIndex;
                        final radius = isTouched
                            ? context.r(60)
                            : context.r(50);

                        return PieChartSectionData(
                          title:
                              '${((descList[i].count / total) * 100).toStringAsFixed(0)}%',
                          titleStyle: AppFonts.tiny.copyWith(
                            color: AppColors.surface,
                          ),
                          color: pieChartColors[i % pieChartColors.length],
                          radius: radius,
                          value: descList[i].count.toDouble(),
                        );
                      }),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

const pieChartColors = [
  Color(0xFF8B5E3C),
  Color(0xFF2E7D32),
  Color(0xFFE65100),
  Color(0xFF6A1B9A),
  Color(0xFF1565C0),
  Color(0xFF2E7D32),
  Color(0xFF0277BD),
  Color(0xFFC62828),
  Color(0xFF6A1B9A),
  Color(0xFF2A1D0E),
];

class _FavoriteItem extends StatelessWidget {
  const _FavoriteItem({
    required this.menu,
    required this.amount,
    required this.percent,
    required this.category,
    this.isFirst = false,
    this.isLast = false,
  });

  final String menu;
  final String category;
  final int amount;
  final double percent;
  final bool isFirst;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return ListItemCard(
      isFirst: isFirst,
      isLast: isLast,
      child: Row(
        children: [
          CaffeineCategoryIcon(category: CaffeineCategory.fromLabel(category)!),
          context.horizontalSpace(14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  menu,
                  style: AppFonts.body.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                context.verticalSpace(6),
                Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.surface02,
                        borderRadius: BorderRadius.circular(context.r(3)),
                      ),
                      height: context.h(5),
                    ),
                    TweenAnimationBuilder(
                      tween: Tween(begin: 0, end: percent),
                      duration: const Duration(milliseconds: 300),
                      builder: (context, value, child) {
                        return FractionallySizedBox(
                          widthFactor: value.toDouble(),
                          // heightFactor: context.h(5),
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(context.r(3)),
                            ),
                            height: context.h(5),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          context.horizontalSpace(14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '$amount개',
                style: AppFonts.body.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                '${(percent * 100).toStringAsFixed(0)}%',
                style: AppFonts.tiny.copyWith(color: AppColors.primary),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
