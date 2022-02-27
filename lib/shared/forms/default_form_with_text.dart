import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class DefaultFormFieldWithText extends StatefulWidget {
  const DefaultFormFieldWithText({ 
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
    this.radiusValue = 16,
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
  _DefaultFormFieldWithTextState createState() => _DefaultFormFieldWithTextState();
}

class _DefaultFormFieldWithTextState extends State<DefaultFormFieldWithText> {
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
          child: TextFormField(
            onSaved: widget.onSaved,
            onTap: () => widget.onTap != null ? widget.onTap!() : null,
            onEditingComplete: () => widget.onEditingComplete != null ? widget.onEditingComplete!() : null,
            controller: widget.controller,
            inputFormatters: widget.mask == null ? [] : [widget.mask!],
            initialValue: widget.initialValue,
            keyboardType: widget.textInputType,
            textInputAction: widget.textInputAction,
            enabled: widget.enabled,
            obscureText: widget.obscure,
              maxLines: widget.maxLines,
              validator: widget.validator,
              decoration: InputDecoration(
                filled: true,
                fillColor: Theme.of(context).colorScheme.tertiaryContainer,
                icon: widget.icon != null ? IconButton(
                  icon: Icon(
                    widget.icon,
                    color: Theme.of(context).colorScheme.secondary,
                    size: 30,
                  ),
                  onPressed: widget.onPressedIcon,
                ) : null,
                errorText: widget.activateError ? widget.errorText : null,
                suffixIcon: widget.suffixIcon,
                prefixIcon: widget.prefixIcon,
                contentPadding: widget.maxLines == 1
                    ? EdgeInsets.only(left: widget.leftPadding)
                    : const EdgeInsets.all(15),
                labelText: widget.label,
                hintText: widget.hint,
                labelStyle: widget.textStyle /*?? ProjectTexts().inputText*/,
                hintStyle: widget.textStyle /*?? ProjectTexts().inputText*/,
                
                enabledBorder: 
                  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(widget.radiusValue),
                    borderSide:
                      BorderSide(color: widget.borderColor ?? Theme.of(context).colorScheme.secondary, width: 1)),
                
                focusedBorder: 
                  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(widget.radiusValue),
                    borderSide:
                      BorderSide(color: widget.borderColor ?? Theme.of(context).colorScheme.secondary, width: 1)),
                
                errorBorder:
                  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(widget.radiusValue),
                    borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.error, width: 1),
                  ),
                ),
            ),
        ),
      ],
    );
  }
}