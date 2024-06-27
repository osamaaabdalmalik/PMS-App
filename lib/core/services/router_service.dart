import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pms_app/core/constants/app_keys.dart';
import 'package:pms_app/core/constants/app_routes.dart';
import 'package:pms_app/core/services/caching_service.dart';
import 'package:pms_app/features/main/presentation/screens/main_screen.dart';

class RouterService {
  final CacheService _cacheService;
  late GoRouter router;

  RouterService({required CacheService cacheService}) : _cacheService = cacheService {
    String initialLocation = _cacheService.getData<String>(
          key: AppKeys.initialLocationRoute,
        ) ??
        AppRoutes.mainScreen;
    router = GoRouter(
      routes: [
        //-------------------------------------------
        // Main Routes
        //-------------------------------------------
        GoRoute(
          path: AppRoutes.mainScreen,
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: MainScreen(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              final tween = Tween(begin: const Offset(0, 1), end: Offset.zero);
              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            },
          ),
        ),
        //-------------------------------------------
        // Other Feature Routes
        //-------------------------------------------
      ],
      initialLocation: initialLocation,
    );
  }
}
