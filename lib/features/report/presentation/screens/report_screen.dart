import 'package:caffeine_tracker/common/const/colors.dart';
import 'package:caffeine_tracker/common/const/fonts.dart';
import 'package:caffeine_tracker/features/info/presentation/providers/info_provider.dart';
import 'package:caffeine_tracker/features/menu/data/models/caffeine_model.dart';
import 'package:caffeine_tracker/features/report/data/models/report_hits_model.dart';
import 'package:caffeine_tracker/features/report/domain/entities/chart_date.dart';
import 'package:caffeine_tracker/features/report/presentation/providers/report_chart_provider.dart';
import 'package:caffeine_tracker/features/report/presentation/providers/report_tab_provider.dart';
import 'package:caffeine_tracker/shared/presentation/ui/container_deco.dart';
import 'package:caffeine_tracker/shared/presentation/widgets/category_icon.dart';
import 'package:caffeine_tracker/shared/presentation/widgets/default_scaffold.dart';
import 'package:caffeine_tracker/shared/presentation/widgets/list_item_card.dart';
import 'package:caffeine_tracker/shared/presentation/widgets/sliver_app_bar.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

part 'report_scaffold.dart';
part 'widgets/report_tabs.dart';
part 'widgets/report_tab_list.dart';
part 'widgets/report_summary.dart';
part 'widgets/report_time_chart.dart';
part 'widgets/report_favorite.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  static const routePath = '/report';
  static const routeName = 'report';

  @override
  Widget build(BuildContext context) {
    return _Scaffold(
      appBar: DefaultAppBar(
        showBackButton: false,
        title: Text(
          '리포트',
          style: AppFonts.h2.copyWith(color: AppColors.primary),
        ),
      ),
      tabs: _Tabs(),
      tabList: _TabList(),
      summary: _Summary(),
      timeChart: _TimeChart(),
      favorite: _Favorite(),
    );
  }
}
