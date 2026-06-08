part of 'menu_custom_screen.dart';

class _Scaffold extends StatelessWidget {
  const _Scaffold({
    required this.appBar,
    required this.currentMenu,
    required this.name,
    required this.caffeine,
    required this.category,
  });

  final PreferredSizeWidget appBar;
  final Widget currentMenu;
  final Widget name;
  final Widget caffeine;
  final Widget category;

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      appBar: appBar,
      bottomWidget: Padding(
        padding: context.edgeInsets(horizontal: 20, bottom: 40),
        child: SizedBox(
          height: context.h(56),
          child: Consumer(
            builder: (context, ref, child) {
              final name = ref.watch(customItemNotiferProvider).name;
              final amount = ref
                  .watch(customItemNotiferProvider)
                  .caffeineAmount;
              final isUnvalid = name.length < 3 || amount < 1;
              return BounceButton(
                buttonColor: isUnvalid
                    ? AppColors.primary.withValues(alpha: 0.5)
                    : AppColors.primary,
                child: Text(
                  '등록하기',
                  style: AppFonts.h3.copyWith(color: AppColors.onPrimary),
                ),
                action: () async {
                  if (isUnvalid) {
                    return;
                  }
                  final result = await ref
                      .read(customItemNotiferProvider.notifier)
                      .add();
                  if (context.mounted) {
                    if (result > 0) {
                      ToastMessage.showTaost(context, '✅ 등록했어요');
                      context.pop();
                    }
                  }
                },
              );
            },
          ),
        ),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: context.edgeInsets(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              context.verticalSpace(10),
              currentMenu,
              context.verticalSpace(20),
              name,
              context.verticalSpace(20),
              caffeine,
              context.verticalSpace(20),
              category,
            ],
          ),
        ),
      ),
    );
  }
}
