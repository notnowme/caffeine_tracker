part of '../menu_custom_screen.dart';

class _Caffeine extends ConsumerWidget {
  const _Caffeine();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isError =
        ref.watch(customItemNotiferProvider.select((s) => s.caffeineAmount)) <
        1;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '카페인 함량',
          style: AppFonts.small.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.w800,
          ),
        ),
        context.verticalSpace(8),
        TextInput(
          // hintText: '예: 더치커피, 콤부차...',
          isNumber: true,
          suffixText: ' mg',
          onChange: (value) {
            if (value.isEmpty || value == '.') return;
            final amount = double.tryParse(value);
            if (amount == null || amount < 1) {
              return;
            }
            ref.read(customItemNotiferProvider.notifier).updateCaffeine(amount);
          },
        ),
        context.verticalSpace(4),
        if (isError)
          Text(
            '0보다 커야해요',
            style: AppFonts.tiny.copyWith(
              color: AppColors.error,
              fontWeight: FontWeight.w800,
            ),
          ),
      ],
    );
  }
}
