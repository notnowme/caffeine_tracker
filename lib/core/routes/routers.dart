import 'package:caffeine_tracker/features/home/presentation/screens/home_screen.dart';
import 'package:caffeine_tracker/features/info/presentation/screens/info_screen.dart';
import 'package:caffeine_tracker/features/menu/presentation/screen/menu_screen.dart';
import 'package:caffeine_tracker/features/menu/presentation/screen/widgets/menu_custom/menu_custom_screen.dart';
import 'package:caffeine_tracker/features/onboard/screens/onboard_screen.dart';
import 'package:caffeine_tracker/features/report/presentation/screens/report_screen.dart';
import 'package:caffeine_tracker/features/settings/presentation/screen/settings_screen.dart';
import 'package:caffeine_tracker/features/splash/screens/splash_screen.dart';
import 'package:caffeine_tracker/shared/presentation/widgets/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> rootNavigator = GlobalKey(debugLabel: 'root');
final GlobalKey<NavigatorState> featureNavigator = GlobalKey(
  debugLabel: 'feature',
);

final routerProvider = Provider((ref) {
  return GoRouter(
    navigatorKey: rootNavigator,
    initialLocation: SplashScreen.routePath,
    routes: [
      // Splash
      GoRoute(
        path: SplashScreen.routePath,
        name: SplashScreen.routeName,
        builder: (context, state) {
          return const SplashScreen();
        },
      ),

      // onboard
      GoRoute(
        path: OnboardScreen.routePath,
        name: OnboardScreen.routeName,
        pageBuilder: (context, state) {
          return NoTransitionPage(child: OnboardScreen());
        },
        routes: [
          //
        ],
      ),

      // info
      GoRoute(
        path: InfoScreen.routePath,
        name: InfoScreen.routeName,
        pageBuilder: (context, state) {
          final isEdit = state.extra as bool? ?? false;
          return CustomTransitionPage(
            key: state.pageKey,
            child: InfoScreen(isEdit: isEdit),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  return SlideTransition(
                    position: animation.drive(
                      Tween(
                        begin: const Offset(1.0, 0.0),
                        end: Offset.zero,
                      ).chain(CurveTween(curve: Curves.easeInOut)),
                    ),
                    child: child,
                  );
                },
          );
        },
      ),
      GoRoute(
        path: MenuScreen.routePath,
        name: MenuScreen.routeName,
        pageBuilder: (context, state) {
          return NoTransitionPage(child: MenuScreen());
        },
        routes: [
          GoRoute(
            path: MenuCustomScreen.routePath,
            name: MenuCustomScreen.routeName,
            pageBuilder: (context, state) {
              return CustomTransitionPage(
                key: state.pageKey,
                child: MenuCustomScreen(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                      return SlideTransition(
                        position: animation.drive(
                          Tween(
                            begin: const Offset(0.0, 1.0),
                            end: Offset.zero,
                          ).chain(CurveTween(curve: Curves.easeInOut)),
                        ),
                        child: child,
                      );
                    },
              );
            },
          ),
        ],
      ),
      _featuerRoutes(),
    ],
  );
});

ShellRoute _featuerRoutes() {
  return ShellRoute(
    navigatorKey: featureNavigator,
    builder: (context, state, child) {
      return BottomNav(child: child);
    },
    routes: [
      // home
      GoRoute(
        path: HomeScreen.routePath,
        name: HomeScreen.routeName,
        pageBuilder: (context, state) {
          return NoTransitionPage(child: HomeScreen());
        },
      ),
      GoRoute(
        path: ReportScreen.routePath,
        name: ReportScreen.routeName,
        pageBuilder: (context, state) {
          return NoTransitionPage(child: ReportScreen());
        },
      ),
      GoRoute(
        path: SettingsScreen.routePath,
        name: SettingsScreen.routeName,
        pageBuilder: (context, state) {
          return NoTransitionPage(child: SettingsScreen());
        },
      ),
    ],
  );
}
