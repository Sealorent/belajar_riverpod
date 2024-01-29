import 'package:go_router/go_router.dart';
import 'package:belajar_riverpod/config/routes/list_routes.dart';
import 'package:belajar_riverpod/shared/widgets/v_deferred_route.dart';
import 'package:belajar_riverpod/shared/screen/not_found_screen.dart' deferred as notFoundScreen;



class CoreRoute {

  late final coreRoute = GoRouter(
  // refreshListenable: authState,
    initialLocation: '/dashboard',
    debugLogDiagnostics: true,
    errorBuilder: (context, state) => DeferredRoute(
        notFoundScreen.loadLibrary, () => notFoundScreen.NotFoundPage()),
    redirect: (_context, GoRouterState state) {
      return null;
    },
    routes: coreRoutes
  );
}

final coreRouter = GoRouter(
  // refreshListenable: authState,
  initialLocation: '/login',
  debugLogDiagnostics: true,
  errorBuilder: (context, state) => DeferredRoute(
      notFoundScreen.loadLibrary, () => notFoundScreen.NotFoundPage()),
  redirect: (_context, GoRouterState state) {
    return null;
  },
  routes: [
    ShellRoute(
      // navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return child;
      },
      routes: coreRoutes,
    )
  ],
);