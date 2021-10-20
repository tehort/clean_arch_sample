import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../app/cubit/app_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    required appCubit,
    Key? key,
  })  : _appCubit = appCubit,
        super(key: key);

  final AppCubit _appCubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _appCubit,
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('HOME PAGE'),
              ElevatedButton(
                child: const Text('GO HOME'),
                onPressed: () {
                  context.read<AppCubit>().changeStack(PageStack.home);
                },
              ),
              ElevatedButton(
                child: const Text('GO LOGIN'),
                onPressed: () {
                  context.read<AppCubit>().changeStack(PageStack.login);
                },
              ),
              ElevatedButton(
                child: const Text('GO SPLASH'),
                onPressed: () {
                  context.read<AppCubit>().changeStack(PageStack.splash);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
