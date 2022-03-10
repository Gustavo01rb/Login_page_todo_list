import 'package:flutter/material.dart';

class ContainerBackground1 extends StatelessWidget {
  const ContainerBackground1({ 
    Key? key, 
    this.height,
    this.color,
    this.width    = double.infinity,
    this.maxWidth = double.infinity,
    this.maxHeght = double.infinity,
    this.radius   = 30,
    this.child,
    this.borderRadius
  }) : super(key: key);
  
  final double? width;
  final double? height;
  final Color?  color;
  final double  radius;
  final double  maxWidth;
  final double  maxHeght; 
  final Widget? child;
  final BorderRadiusGeometry? borderRadius;

  @override 
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: maxWidth,
        maxHeight: maxHeght
      ),
      clipBehavior: Clip.hardEdge,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color ?? Theme.of(context).colorScheme.background,
        borderRadius: borderRadius ?? BorderRadius.circular(radius),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.background.withOpacity(0.6),
            offset: const Offset(0.0, 5.0),
            blurRadius: 5.0,
            spreadRadius: 6
        )]
      ),
      child: child
    );
  }
}