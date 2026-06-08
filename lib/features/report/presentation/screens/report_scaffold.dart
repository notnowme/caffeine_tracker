part of 'report_screen.dart';

class _Scaffold extends StatelessWidget {
  const _Scaffold({
    required this.appBar,
    required this.tabs,
    required this.tabList,
    required this.summary,
    required this.timeChart,
    required this.favorite,
  });

  final PreferredSizeWidget appBar;
  final Widget tabs;
  final Widget tabList;
  final Widget summary;
  final Widget timeChart;
  final Widget favorite;

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      appBar: appBar,
      child: DefaultTabController(
        length: 3,
        child: SingleChildScrollView(
          child: Padding(
            padding: context.edgeInsets(horizontal: 10),
            child: Column(
              children: [
                tabs,
                context.verticalSpace(10),
                tabList,
                context.verticalSpace(16),
                summary,
                context.verticalSpace(16),
                timeChart,
                context.verticalSpace(16),
                favorite,
                // context.verticalSpace(16),
                context.verticalSpace(116),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
