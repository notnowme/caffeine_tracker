part of '../menu_screen.dart';

class _AddBottomSheet extends ConsumerWidget {
  const _AddBottomSheet({required this.product});

  final CaffeineItemModel product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isCustom = product.isCustom == 1;
    return Container(
      padding: context.edgeInsets(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(context.r(28)),
          topRight: Radius.circular(context.r(28)),
        ),
        boxShadow: boxShadows(),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          context.verticalSpace(12),
          Center(
            child: Container(
              width: context.w(48),
              height: context.h(4),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.5),
                borderRadius: BorderRadius.all(Radius.circular(context.r(6))),
              ),
            ),
          ),
          context.verticalSpace(12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '카페인 기록',
                style: AppFonts.h3.copyWith(color: AppColors.primary),
              ),
              IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: Icon(
                  CupertinoIcons.xmark,
                  size: context.h(24),
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          context.verticalSpace(12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CaffeineCategoryIcon(
                    category: CaffeineCategory.fromLabel(product.category)!,
                  ),
                  context.horizontalSpace(12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.category,
                        style: AppFonts.tiny.copyWith(color: AppColors.fg04),
                      ),
                      Text(
                        product.name,
                        style: AppFonts.h3.copyWith(color: AppColors.primary),
                      ),
                    ],
                  ),
                ],
              ),
              if (isCustom)
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.onPrimary,
                    borderRadius: BorderRadius.circular(context.r(12)),
                  ),
                  child: IconButton(
                    onPressed: () async {
                      showDialog(
                        useRootNavigator: true,
                        context: context,
                        builder: (alertContext) {
                          return Dialog(
                            backgroundColor: Colors.transparent,
                            insetPadding: context.edgeInsets(horizontal: 24),
                            child: CustomAlertDialog(
                              icon: CupertinoIcons.delete,
                              iconColor: AppColors.error,
                              title: '상품을 삭제할까요?',
                              body:
                                  '지금 등록한 상품이 삭제돼요. 관련된 데이터와 함께 삭제되며 되돌릴 수 없어요.',
                              actionTitle: '삭제',
                              action: () async {
                                final result = await ref
                                    .read(recordProvider.notifier)
                                    .delete(product.id!);
                                if (context.mounted) {
                                  if (result > 0) {
                                    print('삭제 성공!');
                                    context.pop();
                                    context.pop();
                                  } else {
                                    print('실패');
                                  }
                                }
                              },
                            ),
                          );
                        },
                      );
                    },
                    icon: Icon(
                      CupertinoIcons.delete,
                      size: context.h(24),
                      color: AppColors.error,
                    ),
                  ),
                ),
            ],
          ),
          context.verticalSpace(20),
          Container(
            padding: context.edgeInsets(vertical: 20, horizontal: 18),
            decoration: BoxDecoration(
              color: AppColors.onPrimary,
              borderRadius: BorderRadius.circular(context.r(20)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '섭취 카페인',
                      style: AppFonts.tiny.copyWith(color: AppColors.fg04),
                    ),
                    Text(
                      product.serviceSize,
                      style: AppFonts.tiny.copyWith(color: AppColors.fg04),
                    ),
                  ],
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: product.caffeineAmount.toStringAsFixed(0),
                        style: AppFonts.h1.copyWith(color: AppColors.primary),
                      ),
                      TextSpan(
                        text: ' mg',
                        style: AppFonts.small.copyWith(
                          color: AppColors.fg04,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          context.verticalSpace(10),
          BounceButton(
            buttonColor: Colors.transparent,
            action: () async {
              final result = await ref
                  .read(recordProvider.notifier)
                  .add(product);
              if (context.mounted) {
                if (result > 0) {
                  context.pop();
                }
              }
            },
            child: Container(
              padding: context.edgeInsets(all: 12),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(context.r(14)),
              ),
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.check, color: AppColors.onPrimary),
                    context.horizontalSpace(4),
                    Text(
                      '카페인 기록하기',
                      style: AppFonts.h3.copyWith(color: AppColors.onPrimary),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
