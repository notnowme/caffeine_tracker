part of '../splash_screen.dart';

class _Progress extends ConsumerWidget {
  const _Progress();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final progress = ref.watch(progressProvider);
    ref.listen(progressProvider, (prev, next) async {
      if (next.value == Progress.infoCheck) {
        final secureStorage = ref.read(secureStorageProvider);
        final signed = await secureStorage.read(key: 'signed');
        if (context.mounted) {
          if (signed == null || signed == '') {
            context.goNamed(OnboardScreen.routeName);
          } else {
            context.goNamed(HomeScreen.routeName);
          }
        }
      }
    });
    return Padding(
      padding: context.edgeInsets(horizontal: 32),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: context.h(1),
            color: AppColors.primary,
          ),
          context.verticalSpace(18),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              progress.when(
                data: (data) {
                  return Text(
                    data.status,
                    style: AppFonts.small.copyWith(color: AppColors.fg03),
                  );
                },
                loading: () {
                  return Text(
                    '데이터를 읽어오고 있습니다.',
                    style: AppFonts.small.copyWith(color: AppColors.fg03),
                  );
                },
                error: (error, stackTrace) {
                  final errorModel = ErrorModel(
                    title: '데이터를 읽어오지 못했습니다',
                    message: '데이터를 확인하는 데 문제가 발생했습니다',
                    path: 'splash',
                  );
                  ref.read(errorProvider.notifier).updateError(errorModel);
                  return Text(
                    '오류가 발생했습니다!',
                    style: AppFonts.small.copyWith(color: AppColors.fg03),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
