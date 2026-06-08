import 'package:caffeine_tracker/core/db/local_database.dart';
import 'package:caffeine_tracker/core/routes/routers.dart';
import 'package:caffeine_tracker/core/supabase/supabase_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');

  try {
    await Future.wait([initSupabase(), LocalDataBase().database]);
  } catch (e) {
    throw Exception(e);
  }

  tz.initializeTimeZones();

  tz.setLocalLocation(tz.getLocation(tz.local.name));

  initializeDateFormatting().then(
    (_) => runApp(const ProviderScope(child: MyApp())),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return ScreenUtilPlusInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      // 문서를 보니 false + context.w / context.h이 성능이 좋다고 함
      autoRebuild: false,
      builder: (context, child) {
        return MaterialApp.router(
          routerConfig: router,
          debugShowCheckedModeBanner: false,
          builder: (context, child) {
            if (child != null) {
              return MediaQuery(
                data: MediaQuery.of(
                  context,
                ).copyWith(textScaler: const TextScaler.linear(1.0)),
                child: child,
              );
            }
            throw StateError('Wiget is Null');
          },
        );
      },
    );
  }
}
