import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/utils.dart';

import '../app/cubit/app_cubit.dart';
import 'cubit/sign_in_cubit.dart';
import 'sign_in_form.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({
    required appCubit,
    required signInCubit,
    Key? key,
  })  : _appStateCubit = appCubit,
        _signInCubit = signInCubit,
        super(key: key);

  final AppCubit _appStateCubit;
  final SignInCubit _signInCubit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider.value(value: _appStateCubit),
          BlocProvider.value(value: _signInCubit),
        ],
        child: MultiBlocListener(
          listeners: [
            BlocListener<SignInCubit, SignInState>(
              listenWhen: (_, c) {
                return c.errorMessage != null;
              },
              listener: (context, state) {
                if (state.errorMessage != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.errorMessage!),
                      duration: const Duration(seconds: 5),
                      action: SnackBarAction(
                        label: 'Dismiss',
                        onPressed: () {},
                      ),
                    ),
                  );
                }
              },
            ),
          ],
          child: WillPopScope(
            onWillPop: () => Utils.onWillPop(
              context,
              title: 'Are you sure?',
              content: 'Do you want to exit the app?',
            ),
            child: const SignInForm(),
          ),
        ),
      ),
    );
  }
}
