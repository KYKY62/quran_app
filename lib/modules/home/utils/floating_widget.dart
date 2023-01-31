import 'package:flutter/material.dart';

class FLoatingWidget extends StatelessWidget {
  const FLoatingWidget({
    required this.size,
    required this.color,
    required this.imageAsset,
    super.key,
  });

  final double size;
  final Color? color;
  final String imageAsset;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Image.asset(
        imageAsset,
      ),
    );
  }
}
