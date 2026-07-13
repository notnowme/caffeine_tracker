part of '../menu_screen.dart';

class _ToggleResult extends StatelessWidget {
  const _ToggleResult();

  @override
  Widget build(BuildContext context) {
    return _DefaultMenuList();
  }
}

class _DefaultMenuList extends ConsumerWidget {
  const _DefaultMenuList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasText = ref.watch(searchTextProvider).isEmpty;
    return hasText
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [context.verticalSpace(10), _Recent()],
          )
        : _Results();
  }
}

class _Results extends ConsumerWidget {
  const _Results();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final text = ref.watch(searchTextProvider);
    final items = ref.watch(searchCaffeineItemsProvider);
    return Padding(
      padding: context.edgeInsets(horizontal: 10),
      child: items.when(
        skipLoadingOnReload: true,
        skipLoadingOnRefresh: true,
        data: (item) {
          if (item.isEmpty) {
            return _NoResult();
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "'$text' 검색 결과 ${item.length}건",
                style: AppFonts.tiny.copyWith(
                  color: AppColors.fg04,
                  fontWeight: FontWeight.w800,
                ),
              ),
              context.verticalSpace(10),
              Container(
                decoration: BoxDecoration(boxShadow: boxShadows()),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: item.length,
                  itemBuilder: (context, index) {
                    final product = item[index];
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
                      isLast: item.length == 1
                          ? true
                          : index + 1 == item.length,
                      menu: product.name,
                      category: product.category,
                      size: product.serviceSize,
                      amount: product.caffeineAmount.toInt(),
                    );
                  },
                ),
              ),
            ],
          );
        },
        error: (e, stack) {
          return Container();
        },
        loading: () {
          return _NoResult();
        },
      ),
    );
  }
}

class _NoResult extends StatelessWidget {
  const _NoResult();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Consumer(
          builder: (context, ref, child) {
            final text = ref.watch(searchTextProvider);
            return Text(
              "'$text' 검색 결과 0건",
              style: AppFonts.tiny.copyWith(
                color: AppColors.fg04,
                fontWeight: FontWeight.w800,
              ),
            );
          },
        ),
        context.verticalSpace(10),
        Container(
          width: double.infinity,
          padding: context.edgeInsets(horizontal: 32, vertical: 24),
          decoration: BoxDecoration(
            boxShadow: boxShadows(),
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(context.r(20)),
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
                child: Icon(CupertinoIcons.search, color: AppColors.fg04),
              ),
              context.verticalSpace(14),
              Consumer(
                builder: (context, ref, child) {
                  final text = ref.watch(searchTextProvider);
                  return Text(
                    "'$text'에 대한 검색 결과가 없어요",
                    style: AppFonts.body.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w800,
                    ),
                  );
                },
              ),
              Text(
                "직접 입력해서 기록할 수도 있어요",
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
}
