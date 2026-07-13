import 'package:bounce_tapper/bounce_tapper.dart';
import 'package:caffeine_tracker/common/const/colors.dart';
import 'package:caffeine_tracker/common/const/fonts.dart';
import 'package:caffeine_tracker/core/db/secure_storage.dart';
import 'package:caffeine_tracker/features/info/presentation/providers/info_provider.dart';
import 'package:caffeine_tracker/features/info/presentation/screens/info_screen.dart';
import 'package:caffeine_tracker/features/menu/presentation/providers/caffeine_item_provider.dart';
import 'package:caffeine_tracker/features/settings/domain/usecases/delete_data_usecase.dart';
import 'package:caffeine_tracker/features/splash/presentation/screens/splash_screen.dart';
import 'package:caffeine_tracker/shared/presentation/ui/container_deco.dart';
import 'package:caffeine_tracker/shared/presentation/widgets/alert_dialog.dart';
import 'package:caffeine_tracker/shared/presentation/widgets/default_scaffold.dart';
import 'package:caffeine_tracker/shared/presentation/widgets/list_item_card.dart';
import 'package:caffeine_tracker/shared/presentation/widgets/sliver_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:go_router/go_router.dart';

part 'settings_scaffold.dart';
part 'widgets/settings_my.dart';
part 'widgets/settings_data.dart';
part 'widgets/settings_etc.dart';
part 'widgets/settings_version.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  static const routePath = '/settings';
  static const routeName = 'settings';

  @override
  Widget build(BuildContext context) {
    return _Scaffold(
      appBar: DefaultAppBar(
        showBackButton: false,
        title: Text(
          '설정',
          style: AppFonts.h2.copyWith(color: AppColors.primary),
        ),
      ),
      my: _My(),
      data: _Data(),
      etc: _Etc(),
      version: _Version(),
    );
  }
}
