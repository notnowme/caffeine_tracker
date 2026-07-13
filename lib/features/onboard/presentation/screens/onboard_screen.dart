import 'package:caffeine_tracker/common/const/colors.dart';
import 'package:caffeine_tracker/common/const/fonts.dart';
import 'package:caffeine_tracker/features/info/presentation/screens/info_screen.dart';
import 'package:caffeine_tracker/shared/presentation/widgets/alert_dialog.dart';
import 'package:caffeine_tracker/shared/presentation/widgets/app_icon.dart';
import 'package:caffeine_tracker/shared/presentation/widgets/bounce_button.dart';
import 'package:caffeine_tracker/shared/presentation/widgets/chip_card.dart';
import 'package:caffeine_tracker/shared/presentation/widgets/default_scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:go_router/go_router.dart';

part 'onboard_scaffold.dart';
part 'widgets/onboard_text.dart';
part 'widgets/onboard_chips.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({super.key});

  static const routePath = '/onboard';
  static const routeName = 'onboard';

  @override
  Widget build(BuildContext context) {
    return _Scaffold(icon: AppIcon(), text: _Text(), chips: _Chips());
  }
}
