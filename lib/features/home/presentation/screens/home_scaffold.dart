part of 'home_screen.dart';

class _Scaffold extends StatelessWidget {
  const _Scaffold({
    required this.appBar,
    required this.main,
    required this.drinkList,
    required this.addButton,
  });

  final PreferredSizeWidget appBar;
  final Widget main;
  final Widget drinkList;
  final Widget addButton;

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      appBar: appBar,
      child: SingleChildScrollView(
        child: Padding(
          padding: context.edgeInsets(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              context.verticalSpace(12),
              main,
              context.verticalSpace(30),
              drinkList,
              context.verticalSpace(16),
              context.verticalSpace(120),
            ],
          ),
        ),
      ),
    );
  }
}
