import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import '../presentation/views/app/app.dart';
import '../presentation/views/app/cubit/app_cubit.dart';

import 'injection_container.dart';

void configureApp() {
  runApp(
    App(
      router: sl<FluroRouter>(),
      appCubit: sl<AppCubit>(),
    ),
  );
}
