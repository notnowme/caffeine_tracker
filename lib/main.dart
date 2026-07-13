import 'package:caffeine_tracker/core/db/local_database.dart';
import 'package:caffeine_tracker/core/routes/routers.dart';
import 'package:caffeine_tracker/core/supabase/supabase_config.dart';
import 'package:caffeine_tracker/shared/data/models/error_model.dart';
import 'package:caffeine_tracker/shared/presentation/providers/offline_provider.dart';
import 'package:caffeine_tracker/shared/presentation/widgets/error_app.dart';
import 'package:caffeine_tracker/shared/presentation/widgets/error_boundery.dart';
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
    final ErrorModel error = e is ErrorModel
        ? e
        : ErrorModel(
            title: '알 수 없는 에러',
            message: '예상치 못한 에러가 발생했습니다.',
            path: '',
          );
    runApp(ErrorApp(error: error));
    return;
  }

  await _startApp();
}

// 공통 초기화 후 앱 실행. offline=true면 네트워크 없이(로컬 데이터로) 진입한다.
Future<void> _startApp({bool offline = false}) async {
  // 로컬 DB는 네트워크와 무관하게 사용 가능. 오프라인 진입 시 아직 준비 안 됐을 수 있어 보장한다.
  await LocalDataBase().database;

  tz.initializeTimeZones();
  tz.setLocalLocation(tz.getLocation(tz.local.name));
  await initializeDateFormatting();

  runApp(
    ProviderScope(
      overrides: [if (offline) offlineModeProvider.overrideWithValue(true)],
      child: const MyApp(),
    ),
  );
}

// ErrorApp의 "네트워크 없이 실행"에서 호출: 네트워크 없이 메인 앱으로 진입한다.
Future<void> runMainAppOffline() => _startApp(offline: true);

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
                child: ErrorBoundery(child: child),
              );
            }
            throw StateError('Wiget is Null');
          },
        );
      },
    );
  }
}
