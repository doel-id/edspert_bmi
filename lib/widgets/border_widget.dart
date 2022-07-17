import 'package:bmi/config.dart';
import 'package:flutter/material.dart';

class BorderWidget extends StatelessWidget {
  const BorderWidget({
    Key? key,
    this.child, this.color,
  }) : super(key: key);

  final Widget? child;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color ?? secondaryColor,
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.all(4),
      
      child: child,
    );
  }
}
