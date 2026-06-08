import 'package:caffeine_tracker/common/const/colors.dart';
import 'package:caffeine_tracker/common/const/fonts.dart';
import 'package:caffeine_tracker/features/home/presentation/providers/home_caffeine_provider.dart';
import 'package:caffeine_tracker/features/info/data/models/info_model.dart';
import 'package:caffeine_tracker/features/info/presentation/providers/info_provider.dart';
import 'package:caffeine_tracker/features/menu/data/models/caffeine_model.dart';
import 'package:caffeine_tracker/shared/presentation/ui/container_deco.dart';
import 'package:caffeine_tracker/shared/presentation/widgets/bounce_button.dart';
import 'package:caffeine_tracker/shared/presentation/widgets/category_icon.dart';
import 'package:caffeine_tracker/shared/presentation/widgets/default_scaffold.dart';
import 'package:caffeine_tracker/shared/presentation/widgets/list_item_card.dart';
import 'package:caffeine_tracker/shared/presentation/widgets/sliver_app_bar.dart';
import 'package:caffeine_tracker/shared/presentation/widgets/toast.dart';
import 'package:caffeine_tracker/shared/utils/caffeine_calculator.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:intl/intl.dart';

part 'home_scaffold.dart';
part 'widgets/home_main.dart';
part 'widgets/home_list.dart';
part 'widgets/home_add_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const routePath = '/home';
  static const routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return _Scaffold(
      appBar: DefaultAppBar(
        showBackButton: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Consumer(
              builder: (context, ref, child) {
                final name = ref.watch(
                  myInfoProvider.select((e) => e.value?.name),
                );
                return Text(
                  '안녕하세요, $name 님',
                  style: AppFonts.tiny.copyWith(
                    color: AppColors.fg04,
                    fontWeight: FontWeight.w800,
                  ),
                );
              },
            ),
            context.verticalSpace(2),
            Text(
              '카페인 스테이',
              style: AppFonts.h2.copyWith(color: AppColors.primary),
            ),
          ],
        ),
      ),
      main: _Main(),
      drinkList: _DrinkList(),
      addButton: _AddButton(),
    );
  }
}
