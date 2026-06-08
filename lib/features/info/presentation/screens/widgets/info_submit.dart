part of '../info_screen.dart';

class _Submit extends ConsumerWidget {
  const _Submit({required this.isEdit});

  final bool isEdit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isShort = ref.watch(infoProvider.select((e) => e.name)).length < 3;
    final isWrong = ref.watch(infoProvider.select((e) => e.weight)) <= 30;
    return BounceButton(
      action: () async {
        if (isShort) {
          debugPrint('짧은 이름');
          return;
        }
        if (isWrong) {
          debugPrint('몸무게 이상');
          return;
        }
        if (!isEdit) {
          final result = await ref.read(infoProvider.notifier).add();
          if (context.mounted) {
            if (result > 0) {
              context.goNamed(HomeScreen.routeName);
            } else {
              print('failed');
            }
          }
        } else {
          final result = await ref.read(infoProvider.notifier).update();
          if (context.mounted) {
            if (result > 0) {
              context.pop();
            } else {
              print('failed');
            }
          }
        }
      },
      buttonColor: !isShort && !isWrong
          ? AppColors.primary
          : AppColors.primary.withValues(alpha: 0.3),
      child: Text(
        '입력 완료',
        style: AppFonts.h3.copyWith(color: AppColors.onPrimary),
      ),
    );
  }
}
