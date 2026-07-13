part of '../menu_custom_screen.dart';

class _Category extends ConsumerWidget {
  const _Category();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategory = ref.watch(
      customItemNotiferProvider.select((c) => c.category),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '카테고리',
          style: AppFonts.small.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.w800,
          ),
        ),
        context.verticalSpace(8),
        Wrap(
          spacing: context.w(6),
          runSpacing: context.h(6),
          children: CaffeineCategory.values.map((category) {
            return _CategoryChip(
              isSelected: category.label == selectedCategory,
              category: category.label,
              onTap: () {
                ref
                    .read(customItemNotiferProvider.notifier)
                    .updateCategory(category.label);
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}

class _CategoryChip extends StatelessWidget {
  const _CategoryChip({
    required this.category,
    required this.onTap,
    required this.isSelected,
  });

  final String category;
  final VoidCallback onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Container(
        padding: context.edgeInsets(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.line,
          ),
          color: isSelected ? AppColors.bg : AppColors.surface,
          borderRadius: BorderRadius.circular(context.r(12)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CaffeineCategoryIcon(
              category: CaffeineCategory.fromLabel(category)!,
              size: 20,
            ),
            context.horizontalSpace(4),
            Text(
              category,
              style: AppFonts.tiny.copyWith(color: AppColors.primary),
            ),
          ],
        ),
      ),
    );
  }
}
