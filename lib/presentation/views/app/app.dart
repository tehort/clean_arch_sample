import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/routes.dart';
import '../../core/themes.dart';

import 'cubit/app_cubit.dart';

class App extends StatelessWidget {
  App({
    required router,
    required appCubit,
    Key? key,
  })  : _router = router,
        _appCubit = appCubit,
        super(key: key);

  final FluroRouter _router;
  final AppCubit _appCubit;
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _appCubit,
      child: BlocListener<AppCubit, AppState>(
        listenWhen: (previous, current) => previous.pageStack != current.pageStack,
        listener: (context, state) {
          switch (state.pageStack) {
            case PageStack.splash:
              _router.navigateTo(_navigatorKey.currentContext!, RoutePaths.splash, replace: true);
              break;
            case PageStack.login:
              _router.navigateTo(_navigatorKey.currentContext!, RoutePaths.signIn, replace: true);
              break;
            case PageStack.home:
              _router.navigateTo(_navigatorKey.currentContext!, RoutePaths.home, replace: true);
              break;
            default:
              break;
          }
        },
        child: MaterialApp(
          navigatorKey: _navigatorKey,
          onGenerateRoute: _router.generator,
          theme: AppTheme.dark,
        ),
      ),
    );
  }
}
