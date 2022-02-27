import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({ Key? key, this.text = "ou" }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 0.5,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary.withOpacity(0.8),
              borderRadius: BorderRadius.circular(20)
            ),
          )
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(text,
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontFamily: "Lobster" 
              ),
          ),
        ),
        Expanded(
          child: Container(
            height: 0.5,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary.withOpacity(0.8),
              borderRadius: BorderRadius.circular(20)
            ),
          )
        ),

      ],
    );
  }
}