import 'package:formz/formz.dart';

enum RequiredBooleanValidationError { empty, invalid }

class RequiredBooleanValidator extends FormzInput<bool, RequiredBooleanValidationError> {
  const RequiredBooleanValidator.pure() : super.pure(false);
  const RequiredBooleanValidator.dirty({required bool value}) : super.dirty(value);

  @override
  RequiredBooleanValidationError? validator(bool? value) {
    if (value == null) {
      return RequiredBooleanValidationError.empty;
    }
    return value == true ? null : RequiredBooleanValidationError.invalid;
  }
}
