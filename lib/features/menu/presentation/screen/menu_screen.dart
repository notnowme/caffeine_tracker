import 'package:bounce_tapper/bounce_tapper.dart';
import 'package:caffeine_tracker/common/const/colors.dart';
import 'package:caffeine_tracker/common/const/fonts.dart';
import 'package:caffeine_tracker/features/menu/data/models/caffeine_model.dart';
import 'package:caffeine_tracker/features/menu/presentation/providers/caffeine_item_provider.dart';
import 'package:caffeine_tracker/features/menu/presentation/providers/record_provider.dart';
import 'package:caffeine_tracker/features/menu/presentation/providers/search_text_provider.dart';
import 'package:caffeine_tracker/features/menu/presentation/screen/widgets/menu_custom/menu_custom_screen.dart';
import 'package:caffeine_tracker/shared/presentation/ui/container_deco.dart';
import 'package:caffeine_tracker/shared/presentation/widgets/alert_dialog.dart';
import 'package:caffeine_tracker/shared/presentation/widgets/bounce_button.dart';
import 'package:caffeine_tracker/shared/presentation/widgets/category_icon.dart';
import 'package:caffeine_tracker/shared/presentation/widgets/default_scaffold.dart';
import 'package:caffeine_tracker/shared/presentation/widgets/list_item_card.dart';
import 'package:caffeine_tracker/shared/presentation/widgets/sliver_app_bar.dart';
import 'package:caffeine_tracker/shared/presentation/widgets/text_input.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:go_router/go_router.dart';

part 'menu_scaffold.dart';
part 'widgets/menu_search_bar.dart';
part 'widgets/menu_favorite.dart';
part 'widgets/menu_recent.dart';
part 'widgets/menu_custom_button.dart';
part 'widgets/menu_add_bottom_sheet.dart';
part 'widgets/menu_toggle_result.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  static const routePath = '/menu';
  static const routeName = 'menu';
  @override
  Widget build(BuildContext context) {
    return _Scaffold(
      appBar: DefaultAppBar(
        showBackButton: true,
        title: Column(
          children: [
            Text('기록하기', style: AppFonts.h3.copyWith(color: AppColors.primary)),
          ],
        ),
      ),
      searchBar: _Searchbar(),
      toggleResult: _ToggleResult(),
      customButton: _CustomButton(),
    );
  }
}
