import 'package:flutter/material.dart';

class ContainerTopRounded extends StatelessWidget {
  const ContainerTopRounded({ 
    Key? key, 
    this.width,
    this.height,
    this.color,
    this.radius = 30,
    this.child 
  }) : super(key: key);
  
  final double? width;
  final double? height;
  final Color?  color;
  final double  radius;
  final Widget? child;

  @override 
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color ?? Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(radius),
          topLeft: Radius.circular(radius)
        ),
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