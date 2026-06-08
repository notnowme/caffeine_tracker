part of 'info_screen.dart';

class _Scaffold extends StatelessWidget {
  const _Scaffold({
    required this.appBar,
    required this.text,
    required this.name,
    required this.weight,
    required this.sensitive,
    required this.sleepTime,
    required this.target,
    required this.submit,
    required this.gender,
  });

  final PreferredSizeWidget appBar;
  final Widget text;
  final Widget name;
  final Widget weight;
  final Widget sensitive;
  final Widget sleepTime;
  final Widget target;
  final Widget submit;
  final Widget gender;

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      appBar: appBar,
      child: SingleChildScrollView(
        child: Padding(
          padding: context.edgeInsets(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              text,
              context.verticalSpace(20),
              name,
              context.verticalSpace(18),
              weight,
              context.verticalSpace(18),
              gender,
              context.verticalSpace(18),
              sensitive,
              context.verticalSpace(18),
              sleepTime,
              context.verticalSpace(18),
              target,
              context.verticalSpace(46),
              submit,
              context.verticalSpace(32),
            ],
          ),
        ),
      ),
    );
  }
}
