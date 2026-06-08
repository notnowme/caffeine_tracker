import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

void _setupView(WidgetTester tester) {
  tester.view.physicalSize = const Size(390 * 3, 1200 * 3);
  tester.view.devicePixelRatio = 3.0;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);
}

/// 위젯 테스트 공통 래퍼.
/// 실제 앱(main.dart)과 동일하게 ScreenUtilPlusInit(390x844)로 감싼다.
/// 화면 크기를 넉넉히 잡아 SingleChildScrollView 오버플로우를 방지한다.
Future<void> pumpApp(WidgetTester tester, Widget widget) async {
  _setupView(tester);

  await tester.pumpWidget(
    ProviderScope(
      child: ScreenUtilPlusInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        autoRebuild: false,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(body: widget),
          );
        },
      ),
    ),
  );
}

/// go_router가 필요한 위젯/화면용 래퍼.
/// 시작 라우트('/')에서 [child]를 렌더링한다.
Future<void> pumpAppWithRouter(WidgetTester tester, Widget child) async {
  _setupView(tester);

  final router = GoRouter(
    initialLocation: '/',
    routes: [GoRoute(path: '/', builder: (context, state) => child)],
  );

  await tester.pumpWidget(
    ProviderScope(
      child: ScreenUtilPlusInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        autoRebuild: false,
        builder: (context, child) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: router,
          );
        },
      ),
    ),
  );
}
