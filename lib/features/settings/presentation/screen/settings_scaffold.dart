part of 'settings_screen.dart';

class _Scaffold extends StatelessWidget {
  const _Scaffold({
    required this.appBar,
    required this.my,
    required this.data,
    required this.etc,
    required this.version,
  });

  final PreferredSizeWidget appBar;
  final Widget my;
  final Widget data;
  final Widget etc;
  final Widget version;

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      appBar: appBar,
      child: SingleChildScrollView(
        child: Padding(
          padding: context.edgeInsets(horizontal: 10),
          child: Column(
            children: [
              my,
              context.verticalSpace(30),
              data,
              context.verticalSpace(30),
              etc,
              context.verticalSpace(30),
              version,
            ],
          ),
        ),
      ),
    );
  }
}
