import 'package:caffeine_tracker/common/const/colors.dart';
import 'package:flutter/material.dart';

class DefaultScaffold extends StatelessWidget {
  const DefaultScaffold({
    super.key,
    this.backgroundColor = AppColors.bg,
    this.resizeToAvoidBottomInset = true,
    required this.child,
    this.appBar,
    this.bottomWidget,
  });

  final Color backgroundColor;
  final bool resizeToAvoidBottomInset;
  final Widget child;
  final PreferredSizeWidget? appBar;
  final Widget? bottomWidget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 키보드가 보였을 때 밀리거나 안 밀리거나
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      backgroundColor: backgroundColor,
      bottomNavigationBar: bottomWidget,
      appBar: appBar,
      body: child,
    );
  }
}
