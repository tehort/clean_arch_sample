import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/core/themes.dart';

class StyledTextFormField extends StatelessWidget {
  const StyledTextFormField({
    required this.onChanged,
    required this.keyboardType,
    Key? key,
    this.hint = '',
    this.isPasswordField = false,
    this.isRequiredField = false,
    this.error,
    this.validator,
    this.autoValidateMode,
  }) : super(key: key);

  final String hint;
  final ValueChanged<String> onChanged;
  final FormFieldValidator<String>? validator;
  final TextInputType keyboardType;
  final bool isPasswordField;
  final bool isRequiredField;
  final String? error;
  final AutovalidateMode? autoValidateMode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        decoration: InputDecoration(
          // labelStyle: TextStyle(
          //   color: Colors.black,
          //   fontWeight: FontWeight.w500,
          // ),
          labelText: hint,
          filled: true,
          fillColor: AppPalette.inputBackground,
          // fillColor: Color(0xFF33333D),
          // focusedBorder: InputBorder.none,
        ),
        // decoration: InputDecoration(
        //   border: OutlineInputBorder(
        //     borderRadius: BorderRadius.circular(12),
        //     gapPadding: 2,
        //   ),
        //   enabledBorder: OutlineInputBorder(
        //     borderRadius: BorderRadius.circular(12),
        //     borderSide: const BorderSide(color: Colors.white, width: 2.0),
        //     gapPadding: 0,
        //   ),
        //   errorText: error,
        //   labelText: hint,
        //   // hintText: hint,

        //   // contentPadding: const EdgeInsets.symmetric(horizontal: 4),
        // ),
        keyboardType: keyboardType,
        autocorrect: false,
        textInputAction: TextInputAction.done,
        obscureText: isPasswordField,
        maxLines: 1,
        onChanged: onChanged,
        validator: validator,
        autovalidateMode: autoValidateMode,
      ),
    );
  }
}
