import 'package:caffeine_tracker/core/db/secure_storage.dart';
import 'package:caffeine_tracker/features/home/presentation/screens/home_screen.dart';
import 'package:caffeine_tracker/features/onboard/presentation/screens/onboard_screen.dart';
import 'package:caffeine_tracker/features/splash/presentation/screens/providers/progress_provider.dart';
import 'package:caffeine_tracker/shared/data/models/error_model.dart';
import 'package:caffeine_tracker/shared/presentation/providers/error_provider.dart';
import 'package:caffeine_tracker/shared/presentation/widgets/app_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:caffeine_tracker/common/const/colors.dart';
import 'package:caffeine_tracker/common/const/fonts.dart';
import 'package:caffeine_tracker/shared/presentation/widgets/default_scaffold.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:go_router/go_router.dart';

part 'splash_scaffold.dart';
part 'widgets/splash_text.dart';
part 'widgets/splash_progress.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static const routePath = '/';
  static const routeName = 'splash';

  @override
  Widget build(BuildContext context) {
    return const _Scaffold(
      icon: AppIcon(),
      texts: _Text(),
      progress: _Progress(),
    );
  }
}
