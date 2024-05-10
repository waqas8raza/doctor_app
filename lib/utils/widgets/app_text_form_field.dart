import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppTextFormField extends StatefulWidget {
  const AppTextFormField(
      {super.key,
      this.hintText,
      this.lableText,
      this.prefixIcon,
      this.readOnly = false,
      this.validator,
      this.controller,
      this.textInputAction,
      this.keyboardType = TextInputType.text,
      this.onChange,
      this.onTap,
      this.initialValue,
      this.hintTextColor,
      this.inputTextColor,
      this.maxLines = 1});
  final int? maxLines;
  final Color? hintTextColor;
  final Color? inputTextColor;
  final bool readOnly;
  final FormFieldValidator<String?>? validator;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;

  final Function(String value)? onChange;
  final Function()? onTap;

  final String? initialValue;
  final String? hintText;
  final String? lableText;
  final IconData? prefixIcon;

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  final InputBorder inputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: BorderSide.none,
  );

  final InputBorder errorInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: const BorderSide(color: Colors.red),
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: widget.maxLines,
      readOnly: widget.readOnly,
      onTap: widget.onTap,
      validator: widget.validator,
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      initialValue: widget.initialValue,
      onChanged: widget.onChange,
      textInputAction: widget.textInputAction,
      style: TextStyle(color: widget.inputTextColor ?? Colors.black),
      decoration: InputDecoration(
        filled: true,
        isDense: true,
        contentPadding: const EdgeInsets.all(15),
        fillColor: const Color.fromARGB(255, 110, 241, 182).withOpacity(0.2),
        prefixIcon: widget.prefixIcon != null
            ? Icon(
                widget.prefixIcon,
                size: 22,
              )
            : null,
        labelText: widget.lableText,
        hintText: widget.hintText,
        hintStyle: TextStyle(color: widget.hintTextColor ?? Colors.black),
        enabledBorder: inputBorder,
        focusedBorder: inputBorder,
        border: inputBorder,
        errorBorder: errorInputBorder,
      ),
    );
  }
}
