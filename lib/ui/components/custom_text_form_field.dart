import 'package:flutter/material.dart';

import '../styles/styles.dart';


class CustomTextFormField extends StatelessWidget {

  final bool enabled;
  final String hintText;
  final String? labelText;
  final TextEditingController? controller;
  final TextStyle? labelStyle;
  final RegExp? regExp;
  final bool? isDense;
  final FocusNode? focusNode;
  final Function(String)? onChanged;
  final TextInputType? textInputType;
  final bool email;

  const CustomTextFormField({
    Key? key,
    this.enabled = true,
    required this.controller,
    required this.hintText,
    this.labelText,
    this.labelStyle,
    this.regExp,
    this.isDense,
    this.focusNode,
    this.onChanged,
    this.textInputType,
    this.email = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        disabledColor: Styles.black,
      ),
      child: TextFormField(
        textCapitalization: TextCapitalization.sentences,
        enabled: enabled,
        controller: controller,
        focusNode: focusNode,
        onChanged: onChanged,
        keyboardType: textInputType,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: labelStyle,
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Styles.grey1
          ),
          contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          isDense: isDense,
        ),
      ),
    );
  }
}