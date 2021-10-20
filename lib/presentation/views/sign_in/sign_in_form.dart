import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/routes.dart';
import '../../widgets/progress_hud.dart';
import '../../widgets/styled_text_form_field.dart';
import 'package:formz/formz.dart';

import '../../models/validators/email_validator.dart';
import '../../models/validators/password_validator.dart';
import 'cubit/sign_in_cubit.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInCubit, SignInState>(
      builder: (context, state) {
        return Stack(
          children: [
            Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(38.0, 0, 38.0, 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const _WelcomeText(),
                      _EmailInputField(),
                      _PasswordInputField(),
                      const _LoginButton(),
                      const _ForgotPasswordButton(),
                      const _SignUpText(),
                      const _SignUpButton(),
                    ],
                  ),
                ),
              ),
            ),
            state.status.isSubmissionInProgress ? const ProgressHud() : Container(),
          ],
        );
      },
    );
  }
}

class _WelcomeText extends StatelessWidget {
  const _WelcomeText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(bottom: 30.0, top: 30.0),
      child: Text(
        'Welcome',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class _EmailInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInCubit, SignInState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return StyledTextFormField(
          hint: 'Email',
          key: const Key('loginForm_emailInput_textField'),
          keyboardType: TextInputType.emailAddress,
          error: state.email.error?.name,
          onChanged: (email) => context.read<SignInCubit>().emailChanged(email),
        );
      },
    );
  }
}

class _PasswordInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInCubit, SignInState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return StyledTextFormField(
          // padding: const EdgeInsets.symmetric(vertical: 20),
          hint: 'Password',
          isPasswordField: true,
          key: const Key('loginForm_passwordInput_textField'),
          keyboardType: TextInputType.text,
          error: state.password.error?.name,
          onChanged: (password) => context.read<SignInCubit>().passwordChanged(password),
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInCubit, SignInState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return ElevatedButton(
          onPressed: context.read<SignInCubit>().logInWithCredentials,
          child: const Text('Login'),
        );
      },
    );
  }
}

class _SignUpText extends StatelessWidget {
  const _SignUpText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(bottom: 30.0, top: 30.0),
      child: Text(
        'Don\'t have an account yet?',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class _SignUpButton extends StatelessWidget {
  const _SignUpButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInCubit, SignInState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return TextButton(
          onPressed: () => Navigator.pushNamed(context, RoutePaths.signUp),
          child: const Text(
            'Sign up',
            // style: TextStyle(color: Colors.black),
          ),
        );

        return Padding(
          padding: const EdgeInsets.only(top: 30),
          child: ElevatedButton(
            child: const Text(
              'Sign up',
              style: TextStyle(color: Colors.black),
            ),
            onPressed: () {
              Navigator.pushNamed(context, RoutePaths.signUp);
            },
          ),
        );
      },
    );
  }
}

class _ForgotPasswordButton extends StatelessWidget {
  const _ForgotPasswordButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInCubit, SignInState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(top: 30),
          child: TextButton(
            child: const Text(
              'Forgot Password?',
              style: TextStyle(color: Colors.black),
            ),
            onPressed: () {},
          ),
        );
      },
    );
  }
}
