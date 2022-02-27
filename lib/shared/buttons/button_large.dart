import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonLarge extends StatefulWidget {
  const ButtonLarge({ Key? key, required this.text, required this.onPressed, this.color }) : super(key: key);

  final String         text;
  final VoidCallback? onPressed;
  final Color?         color;


  @override
  _ButtonaArgeState createState() => _ButtonaArgeState();
}

class _ButtonaArgeState extends State<ButtonLarge> {
  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: _width,
      child: CupertinoButton(
        child: Text(widget.text) , 
        onPressed: widget.onPressed,
        color: widget.color ?? Theme.of(context).colorScheme.tertiary,
        
      ),
    );
  }
}