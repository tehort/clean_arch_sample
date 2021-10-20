import 'package:formz/formz.dart';

enum RequiredInputValidationError { empty }

class RequiredInputValidator extends FormzInput<String, RequiredInputValidationError> {
  const RequiredInputValidator.pure() : super.pure('');
  const RequiredInputValidator.dirty({String value = ''}) : super.dirty(value);

  @override
  RequiredInputValidationError? validator(String value) {
    if (pure) {
      return null;
    }
    return value.isNotEmpty == true ? null : RequiredInputValidationError.empty;
  }
}

extension Explanation on RequiredInputValidationError {
  String? get name {
    switch (this) {
      case RequiredInputValidationError.empty:
        return 'This field can\'t be empty';
    }
  }
}
