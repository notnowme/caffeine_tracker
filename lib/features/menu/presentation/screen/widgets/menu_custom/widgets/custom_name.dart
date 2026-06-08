part of '../menu_custom_screen.dart';

class _Name extends ConsumerWidget {
  const _Name();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isError =
        ref.watch(customItemNotiferProvider.select((s) => s.name)).length < 3;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '메뉴 이름',
          style: AppFonts.small.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.w800,
          ),
        ),
        context.verticalSpace(8),
        TextInput(
          hintText: '예: 더치커피, 콤부차...',
          onChange: (value) {
            if (value.isEmpty) return;
            ref.read(customItemNotiferProvider.notifier).updateName(value);
          },
        ),
        context.verticalSpace(4),
        if (isError)
          Text(
            '세 글자 이상 작성해야 해요',
            style: AppFonts.tiny.copyWith(
              color: AppColors.error,
              fontWeight: FontWeight.w800,
            ),
          ),
      ],
    );
  }
}
