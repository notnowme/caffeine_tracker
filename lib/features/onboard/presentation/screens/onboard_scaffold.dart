part of 'onboard_screen.dart';

class _Scaffold extends StatelessWidget {
  const _Scaffold({
    required this.icon,
    required this.text,
    required this.chips,
  });

  final Widget icon;
  final Widget text;
  final Widget chips;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              backgroundColor: Colors.transparent,
              insetPadding: context.edgeInsets(horizontal: 24),
              child: CustomAlertDialog(
                icon: Icons.hail_rounded,
                iconColor: AppColors.primary,
                title: '앱을 종료할까요?',
                body: '카페인을 기록해서 관리해 보세요',
                actionTitle: '종료',
                action: () async {
                  SystemNavigator.pop();
                },
              ),
            );
          },
        );
      },
      child: DefaultScaffold(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              context.verticalSpace(110),
              Center(child: icon),
              context.verticalSpace(40),
              text,
              context.verticalSpace(26),
              chips,
              context.verticalSpace(26),
              Padding(
                padding: context.edgeInsets(horizontal: 20),
                child: BounceButton(
                  action: () {
                    context.pushNamed(InfoScreen.routeName);
                  },
                  buttonColor: AppColors.primary,
                  child: Text(
                    '시작하기 →',
                    style: AppFonts.h3.copyWith(color: AppColors.onPrimary),
                  ),
                ),
              ),
              context.verticalSpace(10),
              Text(
                '계속하면 서비스 이용약관 및 개인정보 처리방침에 동의합니다.',
                style: AppFonts.tiny.copyWith(color: AppColors.fg04),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
