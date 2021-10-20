import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/progress_hud.dart';
import '../../widgets/styled_text_form_field.dart';
import 'package:formz/formz.dart';

import '../../models/validators/confirm_password_validator.dart';
import '../../models/validators/email_validator.dart';
import '../../models/validators/password_validator.dart';
import '../../models/validators/required_input_validator.dart';
import 'cubit/sign_up_cubit.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        return SafeArea(
          child: Stack(
            children: [
              CustomScrollView(
                physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                slivers: [
                  const SliverAppBar(
                    pinned: false,
                    floating: true,
                    snap: true,
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    // iconTheme: IconThemeData(color: Colors.black),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          const _SignUpInformation(),
                          _TitleInputField(),
                          _FirstNameInputField(),
                          _LastNameInputField(),
                          _EmailInputField(),
                          _PasswordInputField(),
                          _ConfirmPasswordInput(),
                          const _SignUpButton(),
                          const _LoadingHud(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class _LoadingHud extends StatelessWidget {
  const _LoadingHud({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status.isSubmissionInProgress ? const ProgressHud() : Container();
      },
    );
  }
}

class _SignUpInformation extends StatelessWidget {
  const _SignUpInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Sign up on App', style: Theme.of(context).textTheme.headline6),
          Text('Create a free account on App and get started', style: Theme.of(context).textTheme.bodyText1),
        ],
      ),
    );
  }
}

class _TitleInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => previous.title != current.title,
      builder: (context, state) {
        return StyledTextFormField(
          hint: 'Title',
          key: const Key('signUpForm_titleInput_textField'),
          isRequiredField: true,
          keyboardType: TextInputType.text,
          onChanged: context.read<SignUpCubit>().titleChanged,
          error: state.title.error?.name,
        );
      },
    );
  }
}

class _FirstNameInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => previous.firstName != current.firstName,
      builder: (context, state) {
        return StyledTextFormField(
          hint: 'First Name',
          key: const Key('signUpForm_firstNameInput_textField'),
          isRequiredField: true,
          keyboardType: TextInputType.text,
          onChanged: context.read<SignUpCubit>().firstNameChanged,
          error: state.firstName.error?.name,
        );
      },
    );
  }
}

class _LastNameInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => previous.lastName != current.lastName,
      builder: (context, state) {
        return StyledTextFormField(
          hint: 'Last Name',
          key: const Key('signUpForm_lastNameInput_textField'),
          isRequiredField: true,
          keyboardType: TextInputType.text,
          onChanged: (value) => context.read<SignUpCubit>().lastNameChanged(value),
          error: state.lastName.error?.name,
        );
      },
    );
  }
}

class _EmailInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return StyledTextFormField(
          hint: 'Email',
          key: const Key('signUpForm_emailInputField_textField'),
          isRequiredField: true,
          keyboardType: TextInputType.emailAddress,
          onChanged: context.read<SignUpCubit>().emailChanged,
          error: state.email.error?.name,
        );
      },
    );
  }
}

class _PasswordInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return StyledTextFormField(
          hint: 'Password',
          key: const Key('signUpForm_passwordInput_textField'),
          isPasswordField: true,
          isRequiredField: true,
          keyboardType: TextInputType.text,
          onChanged: context.read<SignUpCubit>().passwordChanged,
          error: state.password.error?.name,
        );
      },
    );
  }
}

class _ConfirmPasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) =>
          previous.password != current.password || previous.confirmPassword != current.confirmPassword,
      builder: (context, state) {
        return StyledTextFormField(
          hint: 'Confirm Password',
          isRequiredField: true,
          key: const Key('signUpForm_confirmPasswordInput_textField'),
          isPasswordField: true,
          keyboardType: TextInputType.text,
          onChanged: context.read<SignUpCubit>().confirmPasswordChanged,
          error: state.confirmPassword.error?.name,
        );
      },
    );
  }
}

class _SignUpButton extends StatelessWidget {
  const _SignUpButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return ElevatedButton(
          key: const Key('signUpForm_signUp_button'),
          style: ElevatedButton.styleFrom(),
          onPressed: context.read<SignUpCubit>().signUp,
          child: const Text('SIGN UP'),
        );
      },
    );
  }
}
