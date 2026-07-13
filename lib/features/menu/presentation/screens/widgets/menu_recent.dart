part of '../menu_screen.dart';

class _Recent extends ConsumerWidget {
  const _Recent();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recents = ref.watch(recentRecordProvider);
    return Padding(
      padding: context.edgeInsets(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '최근에 기록한 음료',
            style: AppFonts.small.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.w800,
            ),
          ),
          context.verticalSpace(10),
          Container(
            decoration: BoxDecoration(boxShadow: boxShadows()),
            child: recents.when(
              data: (data) {
                return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final record = data[index].record;
                    final product = data[index].item!;
                    return _RecentItem(
                      onTap: () async {
                        showModalBottomSheet(
                          useRootNavigator: true,
                          backgroundColor: Colors.transparent,
                          isScrollControlled: true,
                          enableDrag: true,
                          context: context,
                          builder: (sheetContext) {
                            return _AddBottomSheet(product: product);
                          },
                        );
                      },
                      isFirst: index == 0,
                      isLast: data.length == 1
                          ? true
                          : index + 1 == data.length,
                      menu: product.name,
                      category: product.category,
                      size: product.serviceSize,
                      amount: record.caffeineAmount.toInt(),
                    );
                  },
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
        ],
      ),
    );
  }
}

class _RecentItem extends StatelessWidget {
  const _RecentItem({
    this.isFirst = false,
    this.isLast = false,
    required this.menu,
    required this.category,
    required this.size,
    required this.amount,
    required this.onTap,
  });

  final bool isFirst;
  final bool isLast;
  final String menu;
  final String category;
  final String size;
  final int amount;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return BounceTapper(
      shrinkScaleFactor: 0.99,
      onTap: onTap,
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
                      style: AppFonts.small.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      '$category · $size',
                      style: AppFonts.tiny.copyWith(
                        color: AppColors.fg04,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '$amount',
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
                context.horizontalSpace(4),
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
    );
  }
}
