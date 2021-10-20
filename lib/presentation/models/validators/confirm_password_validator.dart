import 'package:formz/formz.dart';

enum ConfirmPasswordValidationError {
  invalid,
  mismatch,
  empty,
}

class ConfirmPasswordValidator extends FormzInput<String, ConfirmPasswordValidationError> {
  const ConfirmPasswordValidator.pure({this.password = ''}) : super.pure('');

  const ConfirmPasswordValidator.dirty({required this.password, String value = ''}) : super.dirty(value);

  final String password;

  @override
  ConfirmPasswordValidationError? validator(String value) {
    if (pure) {
      return null;
    } else if (value.isEmpty) {
      return ConfirmPasswordValidationError.invalid;
    } else {
      return password == value ? null : ConfirmPasswordValidationError.mismatch;
    }
  }
}

extension Explanation on ConfirmPasswordValidationError {
  String? get name {
    switch (this) {
      case ConfirmPasswordValidationError.mismatch:
        return 'passwords must match';
      case ConfirmPasswordValidationError.invalid:
        return 'Invalid condition';
      case ConfirmPasswordValidationError.empty:
        return 'This field can\'t be empty';
    }
  }
}
