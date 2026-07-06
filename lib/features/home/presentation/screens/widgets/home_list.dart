part of '../home_screen.dart';

class _DrinkList extends ConsumerWidget {
  const _DrinkList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todayDrinks = ref.watch(todayDrinksProvider);
    return todayDrinks.when(
      data: (data) {
        if (data.isEmpty) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '오늘 기록한 카페인',
                style: AppFonts.h3.copyWith(color: AppColors.primary),
              ),
              context.verticalSpace(10),
              Container(
                width: double.infinity,
                padding: context.edgeInsets(horizontal: 32, vertical: 24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(context.r(20)),
                  color: AppColors.surface,
                  boxShadow: boxShadows(),
                ),
                child: Column(
                  children: [
                    Container(
                      width: context.w(48),
                      height: context.h(48),
                      decoration: BoxDecoration(
                        color: AppColors.onPrimary,
                        shape: BoxShape.circle,
                      ),
                      child: CaffeineCategoryIcon(
                        category: CaffeineCategory.cafeCoffee,
                      ),
                    ),
                    context.verticalSpace(14),
                    Text(
                      "오늘은 아직 카페인 기록을 하지 않았어요",
                      style: AppFonts.body.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      "카페인을 기록해서 관리해 보세요",
                      style: AppFonts.tiny.copyWith(
                        color: AppColors.fg04,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '오늘 마신 음료',
                  style: AppFonts.h3.copyWith(color: AppColors.primary),
                ),
                Text(
                  '${data.length}개',
                  style: AppFonts.tiny.copyWith(color: AppColors.fg04),
                ),
              ],
            ),
            context.verticalSpace(8),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: (context, index) {
                final recordWithItem = data[index];
                return _DrinkItem(
                  isFirst: index == 0,
                  isLast: data.length == 1 ? true : data.length == index + 1,
                  menu: recordWithItem.item!.name,
                  time: DateFormat(
                    'HH:mm',
                  ).format(recordWithItem.record.drinkAt),
                  category: recordWithItem.item!.category,
                  amount: recordWithItem.record.caffeineAmount,
                );
              },
            ),
          ],
        );
      },
      error: (error, stackTrace) {
        return SizedBox.shrink();
      },
      loading: () {
        return SizedBox.shrink();
      },
    );
  }
}

class _DrinkItem extends StatelessWidget {
  const _DrinkItem({
    required this.menu,
    required this.time,
    required this.category,
    required this.amount,
    this.isFirst = false,
    this.isLast = false,
  });

  final String menu;
  final String time;
  final String category;
  final num amount;
  final bool isFirst;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(context.r(20)),
        color: AppColors.surface,
        boxShadow: boxShadows(),
      ),
      child: ListItemCard(
        isFirst: isFirst,
        isLast: isLast,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CaffeineCategoryIcon(
                  category: CaffeineCategory.fromLabel(category)!,
                ),
                context.horizontalSpace(14),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      menu,
                      style: AppFonts.body.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      '$time · $category',
                      style: AppFonts.tiny.copyWith(
                        color: AppColors.fg04,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: amount.toStringAsFixed(0),
                    style: AppFonts.body.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  TextSpan(
                    text: ' mg',
                    style: AppFonts.tiny.copyWith(color: AppColors.primary),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
