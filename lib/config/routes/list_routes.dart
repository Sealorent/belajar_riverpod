

import 'package:go_router/go_router.dart';
import 'package:belajar_riverpod/config/routes/name_routes.dart';
import 'package:belajar_riverpod/shared/widgets/v_deferred_route.dart';
import 'package:belajar_riverpod/features/splash/presentation/screens/splash_screen.dart' deferred as splashScreen;
import 'package:belajar_riverpod/features/authentication/presentation/screens/login_screen.dart' deferred as loginScreen;
import 'package:belajar_riverpod/features/authentication/presentation/screens/sign_up_screen.dart' deferred as signUpScreen;
import 'package:belajar_riverpod/shared/screen/not_found_screen.dart' deferred as notFoundScreen;

var coreRoutes = [

  GoRoute(
    name: routerName.splashScreen,
    path: '/intro',
    builder: (context, state) => DeferredRoute(
        splashScreen.loadLibrary, () => splashScreen.SplashScreen()),
  ),

  GoRoute(
    name: routerName.loginScreen,
    path: '/login',
    builder: (context, state) => DeferredRoute(
        loginScreen.loadLibrary, () => loginScreen.LoginScreen()),
  ),

  GoRoute(
    name: routerName.signUpScreen,
    path: '/sign-up',
    builder: (context, state) => DeferredRoute(
        signUpScreen.loadLibrary, () => signUpScreen.SignUpScreen()),
  ),

  GoRoute(
    name: routerName.notFound,
    path: '/not-found',
    builder: (context, state) => DeferredRoute(
        notFoundScreen.loadLibrary, () => notFoundScreen.NotFoundPage()),
  ),

];