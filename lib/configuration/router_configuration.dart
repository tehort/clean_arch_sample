import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import '../presentation/core/routes.dart';
import '../presentation/views/app/cubit/app_cubit.dart';
import '../presentation/views/home/home_page.dart';
import '../presentation/views/sign_in/cubit/sign_in_cubit.dart';
import '../presentation/views/sign_in/sign_in_page.dart';
import '../presentation/views/sign_up/cubit/sign_up_cubit.dart';
import '../presentation/views/sign_up/sign_up_page.dart';
import '../presentation/views/splash/splash_page.dart';

import 'injection_container.dart';

void configureRoutes() {
  final router = sl<FluroRouter>();

  router.notFoundHandler = _noRouteFoundRouteHandler;

  router.define(
    RoutePaths.splash,
    handler: _splashRouteHandler,
    transitionType: TransitionType.inFromLeft,
  );

  router.define(
    RoutePaths.signIn,
    handler: _authLoginRouteHandler,
  );

  router.define(
    RoutePaths.signUp,
    handler: _authCreateUserRouteHandler,
    transitionType: TransitionType.inFromRight,
  );

  router.define(
    RoutePaths.home,
    handler: _homeRouteHandler,
    transitionType: TransitionType.inFromRight,
  );
}

var _noRouteFoundRouteHandler = Handler(
  handlerFunc: (BuildContext? context, params) {
    return Container();
  },
);

var _splashRouteHandler = Handler(
  handlerFunc: (BuildContext? context, params) {
    return const SplashPage();
  },
);

var _authLoginRouteHandler = Handler(
  handlerFunc: (BuildContext? context, params) {
    return SignInPage(
      appCubit: sl<AppCubit>(),
      signInCubit: sl<SignInCubit>(),
    );
  },
);

var _authCreateUserRouteHandler = Handler(
  handlerFunc: (BuildContext? context, params) {
    return SignUpPage(
      appCubit: sl<AppCubit>(),
      signUpCubit: sl<SignUpCubit>(),
    );
  },
);

var _homeRouteHandler = Handler(
  handlerFunc: (BuildContext? context, params) {
    return HomePage(
      appCubit: sl<AppCubit>(),
    );
  },
);
