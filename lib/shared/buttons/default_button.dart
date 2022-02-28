import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatefulWidget {
  const DefaultButton({ Key? key, this.width, required this.text, required this.onPressed, this.color }) : super(key: key);

  final String         text;
  final VoidCallback? onPressed;
  final Color?         color;
  final double?        width; 


  @override
  _DefaultButtonState createState() => _DefaultButtonState();
}

class _DefaultButtonState extends State<DefaultButton> {
  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: widget.width ?? _width,
      child: CupertinoButton(
        child: Text(widget.text) , 
        onPressed: widget.onPressed,
        color: widget.color ?? Theme.of(context).colorScheme.tertiary,
        
      ),
    );
  }
}