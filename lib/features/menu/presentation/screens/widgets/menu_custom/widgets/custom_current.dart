part of '../menu_custom_screen.dart';

class _CurrentMenu extends ConsumerWidget {
  const _CurrentMenu();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentMenu = ref.watch(customItemNotiferProvider);
    return Container(
      padding: context.edgeInsets(all: 20),
      decoration: BoxDecoration(
        boxShadow: boxShadows(),
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(context.r(20)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CaffeineCategoryIcon(
                category: CaffeineCategory.fromLabel(currentMenu.category)!,
              ),
              context.horizontalSpace(14),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    currentMenu.name,
                    style: AppFonts.body.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    currentMenu.category,
                    style: AppFonts.tiny.copyWith(
                      color: AppColors.fg04,
                      fontWeight: FontWeight.w800,
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
                  text: currentMenu.caffeineAmount.toStringAsFixed(0),
                  style: AppFonts.h3.copyWith(color: AppColors.primary),
                ),
                TextSpan(
                  text: ' mg',
                  style: AppFonts.small.copyWith(
                    color: AppColors.primary,
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
