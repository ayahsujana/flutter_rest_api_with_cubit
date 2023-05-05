import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final Color backgroundColor;
  final double radius;

  const CustomCard({
    required this.margin, 
    required this.padding, 
    required this.backgroundColor, 
    required this.child, 
    required this.radius});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
        boxShadow: [
          BoxShadow(
                blurRadius: 15,
                color: Colors.black.withOpacity(0.1),
                offset: const Offset(0, 5),
              )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: Material(
          child: child,
        ),
      ),
    );
  }
}
