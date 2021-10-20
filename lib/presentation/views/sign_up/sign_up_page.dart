import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/utils.dart';
import 'package:formz/formz.dart';

import '../app/cubit/app_cubit.dart';
import 'cubit/sign_up_cubit.dart';
import 'sign_up_form.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({
    required appCubit,
    required signUpCubit,
    Key? key,
  })  : _appStateCubit = appCubit,
        _signUpCubit = signUpCubit,
        super(key: key);

  final AppCubit _appStateCubit;
  final SignUpCubit _signUpCubit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider.value(value: _appStateCubit),
          BlocProvider.value(value: _signUpCubit),
        ],
        child: MultiBlocListener(
          listeners: [
            BlocListener<SignUpCubit, SignUpState>(
              listenWhen: (_, c) => c.errorMessage != null,
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
          child: BlocBuilder<SignUpCubit, SignUpState>(
            builder: (context, state) {
              return WillPopScope(
                onWillPop: state.status.isPure
                    ? () async => true
                    : () => Utils.onWillPop(
                          context,
                          title: 'Pending changes',
                          content: 'There are pending changes. Are you sure you wanna go back?',
                        ),
                child: const SignUpForm(),
              );
            },
          ),
        ),
      ),
    );
  }
}
