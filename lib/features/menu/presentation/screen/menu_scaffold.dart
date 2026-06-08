part of 'menu_screen.dart';

class _Scaffold extends StatelessWidget {
  const _Scaffold({
    required this.appBar,
    required this.searchBar,
    required this.toggleResult,
    required this.customButton,
  });

  final PreferredSizeWidget appBar;
  final Widget searchBar;
  final Widget toggleResult;
  final Widget customButton;

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      appBar: appBar,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            searchBar,
            context.verticalSpace(12),
            toggleResult,
            // context.verticalSpace(12),
            customButton,
            context.verticalSpace(40),
          ],
        ),
      ),
    );
  }
}
