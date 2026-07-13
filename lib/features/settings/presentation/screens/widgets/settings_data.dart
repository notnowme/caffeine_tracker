part of '../settings_screen.dart';

class _Data extends ConsumerWidget {
  const _Data();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '데이터 및 서비스',
          style: AppFonts.small.copyWith(
            color: AppColors.fg04,
            fontWeight: FontWeight.w800,
          ),
        ),
        context.verticalSpace(10),
        Container(
          decoration: BoxDecoration(boxShadow: boxShadows()),
          child: Column(
            children: [
              BounceTapper(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        backgroundColor: Colors.transparent,
                        insetPadding: context.edgeInsets(horizontal: 24),
                        child: CustomAlertDialog(
                          icon: CupertinoIcons.delete,
                          iconColor: AppColors.error,
                          title: '모든 데이터를 초기화할까요?',
                          body: '모든 데이터가 초기화됩니다. 초기화된 데이터는 복구할 수 없습니다.',
                          actionTitle: '초기화',
                          action: () async {
                            // TODO 회원 정보, secure, product datas
                            final repo = ref.read(
                              caffeineItemRepositoryProvider,
                            );
                            final secure = ref.read(secureStorageProvider);
                            final result = await DeleteDataUsecase(
                              repo,
                            ).execute();
                            if (context.mounted) {
                              if (result > 0) {
                                context.pop();
                                await secure.deleteAll();
                                ref.invalidate(myInfoProvider);
                                if (context.mounted) {
                                  context.goNamed(SplashScreen.routeName);
                                }
                              }
                            } else {}
                          },
                        ),
                      );
                    },
                  );
                },
                child: _MyListItem(
                  isFirst: true,
                  isLast: true,
                  title: '데이터 초기화',
                  icon: Icons.refresh_rounded,
                  color: AppColors.error,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
