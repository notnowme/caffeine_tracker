import 'package:caffeine_tracker/common/const/colors.dart';
import 'package:caffeine_tracker/common/const/fonts.dart';
import 'package:caffeine_tracker/features/menu/data/models/caffeine_model.dart';
import 'package:caffeine_tracker/features/menu/presentation/providers/custom_item_provider.dart';
import 'package:caffeine_tracker/shared/presentation/ui/container_deco.dart';
import 'package:caffeine_tracker/shared/presentation/widgets/bounce_button.dart';
import 'package:caffeine_tracker/shared/presentation/widgets/category_icon.dart';
import 'package:caffeine_tracker/shared/presentation/widgets/default_scaffold.dart';
import 'package:caffeine_tracker/shared/presentation/widgets/sliver_app_bar.dart';
import 'package:caffeine_tracker/shared/presentation/widgets/text_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:go_router/go_router.dart';

part 'menu_custom_scaffold.dart';
part 'widgets/custom_current.dart';
part 'widgets/custom_name.dart';
part 'widgets/custom_caffeine.dart';
part 'widgets/custom_category.dart';

class MenuCustomScreen extends StatelessWidget {
  const MenuCustomScreen({super.key});

  static const routePath = '/custom';
  static const routeName = 'custom';

  @override
  Widget build(BuildContext context) {
    return _Scaffold(
      appBar: DefaultAppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '음료 직접 등록하기',
              style: AppFonts.h3.copyWith(color: AppColors.primary),
            ),
            Text(
              '원하는 음료를 등록해요',
              style: AppFonts.tiny.copyWith(color: AppColors.fg04),
            ),
          ],
        ),
      ),
      currentMenu: _CurrentMenu(),
      name: _Name(),
      caffeine: _Caffeine(),
      category: _Category(),
    );
  }
}
