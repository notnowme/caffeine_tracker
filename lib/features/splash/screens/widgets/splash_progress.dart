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
              progress.maybeWhen(
                data: (data) {
                  return Text(
                    data.status,
                    style: AppFonts.small.copyWith(color: AppColors.fg03),
                  );
                },
                orElse: () {
                  return SizedBox.shrink();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
