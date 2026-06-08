import 'package:caffeine_tracker/common/const/colors.dart';
import 'package:caffeine_tracker/common/const/fonts.dart';
import 'package:caffeine_tracker/features/home/presentation/screens/home_screen.dart';
import 'package:caffeine_tracker/features/info/data/models/info_model.dart';
import 'package:caffeine_tracker/features/info/presentation/providers/info_provider.dart';
import 'package:caffeine_tracker/shared/presentation/widgets/bounce_button.dart';
import 'package:caffeine_tracker/shared/presentation/widgets/default_scaffold.dart';
import 'package:caffeine_tracker/shared/presentation/widgets/sliver_app_bar.dart';
import 'package:caffeine_tracker/shared/presentation/widgets/text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:go_router/go_router.dart';

part 'info_scaffold.dart';
part 'widgets/info_text.dart';
part 'widgets/info_name.dart';
part 'widgets/info_weight.dart';
part 'widgets/info_sensitive.dart';
part 'widgets/info_smoking.dart';
part 'widgets/info_target.dart';
part 'widgets/info_submit.dart';
part 'widgets/info_gender.dart';

class InfoScreen extends ConsumerStatefulWidget {
  const InfoScreen({super.key, this.isEdit = false});

  final bool isEdit;

  static const routePath = '/info';
  static const routeName = 'info';

  @override
  ConsumerState<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends ConsumerState<InfoScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.isEdit) {
        ref.read(infoProvider.notifier).init();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return _Scaffold(
      appBar: DefaultAppBar(
        title: Text(
          '정보 입력',
          style: AppFonts.h3.copyWith(color: AppColors.primary),
        ),
      ),
      text: _Text(),
      name: _Name(),
      weight: _Weight(),
      gender: _Gender(),
      sensitive: _Sensitive(),
      sleepTime: _Smoking(),
      target: _Target(),
      submit: _Submit(isEdit: widget.isEdit),
    );
  }
}
