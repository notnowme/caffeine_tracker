part of 'splash_screen.dart';

class _Scaffold extends StatelessWidget {
  const _Scaffold({
    required this.icon,
    required this.texts,
    required this.progress,
  });

  final Widget icon;
  final Widget texts;
  final Widget progress;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) return;
        debugPrint('splash에서는 뒤로 갈 수 없음.');
      },
      child: DefaultScaffold(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            context.verticalSpace(218),
            icon,
            context.verticalSpace(36),
            texts,
            const Spacer(),

            progress,
            context.verticalSpace(60),
          ],
        ),
      ),
    );
  }
}
