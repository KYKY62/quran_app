import 'package:flutter/material.dart';

class FLoatingWidget extends StatelessWidget {
  const FLoatingWidget({
    required this.onTap,
    required this.size,
    required this.color,
    required this.imageAsset,
    super.key,
  });

  final VoidCallback onTap;
  final double size;
  final Color? color;
  final String imageAsset;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      borderRadius: BorderRadius.circular(100),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(100),
        child: SizedBox(
          width: size,
          height: size,
          child: Image.asset(
            imageAsset,
          ),
        ),
      ),
    );
  }
}
