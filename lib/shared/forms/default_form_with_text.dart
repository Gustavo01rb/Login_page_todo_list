import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:todolist_flutter/shared/forms/default_form.dart';

class FormDefaultWithText extends StatefulWidget {
  const FormDefaultWithText({ 
    Key? key,
    required this.titleText,
    this.label,
    this.onPressedIcon,
    this.icon,
    this.onTap,
    this.activateError = false,
    this.hint,
    this.controller,
    this.initialValue,
    this.textInputType,
    this.obscure = false,
    this.leftPadding = 5,
    this.sapacingValue = 10,
    this.radiusValue = 8,
    this.suffixIcon,
    this.prefixIcon,
    this.validator,
    this.onSaved,
    this.mask,
    this.maxLines = 1,
    this.onEditingComplete,
    this.errorText,
    this.borderColor,
    this.enabled = true,
    this.spacing = false,
    this.textInputAction = TextInputAction.done,
    this.textStyle
  }) : super(key: key);

  final TextEditingController? controller;

  final bool obscure;
  final bool enabled;
  final bool spacing;
  final bool activateError;
  
  final double radiusValue;
  final double leftPadding;
  final double sapacingValue;

  final String? hint;
  final String? label;
  final String? errorText;
  final String? initialValue;
  final String  titleText;

  final Widget? suffixIcon;
  final Widget? prefixIcon;

  final Function? onTap;
  final Function(String?)? onSaved;
  final Function? onEditingComplete;
  final void Function()? onPressedIcon;
  final String? Function(String?)? validator;

  final int maxLines;
  final IconData? icon;
  final Color? borderColor;
  final TextStyle? textStyle;
  final TextInputType? textInputType;
  final MaskTextInputFormatter? mask;
  final TextInputAction textInputAction;

  @override
  _FormDefaultWithTextState createState() => _FormDefaultWithTextState();
}

class _FormDefaultWithTextState extends State<FormDefaultWithText> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(widget.titleText, textAlign: TextAlign.left, textDirection: TextDirection.rtl,),
        
        Padding(
          padding: const EdgeInsets.only(top: 5, left: 5),
          child: FormDefault(
            mask: widget.mask,
            icon: widget.icon,
            hint: widget.hint,
            label: widget.label,
            onTap: widget.onTap,
            spacing: widget.spacing,
            obscure: widget.obscure,
            enabled: widget.enabled,
            onSaved: widget.onSaved,
            maxLines: widget.maxLines,
            errorText: widget.errorText,
            validator: widget.validator,
            textStyle: widget.textStyle,
            suffixIcon: widget.suffixIcon,
            prefixIcon: widget.prefixIcon,
            controller: widget.controller,
            borderColor: widget.borderColor,
            radiusValue: widget.radiusValue,
            leftPadding: widget.leftPadding,
            initialValue: widget.initialValue,
            sapacingValue: widget.sapacingValue,
            textInputType: widget.textInputType,
            onPressedIcon: widget.onPressedIcon,
            activateError: widget.activateError,
            textInputAction: widget.textInputAction,
            onEditingComplete: widget.onEditingComplete,

          )
        ),
      ],
    );
  }
}