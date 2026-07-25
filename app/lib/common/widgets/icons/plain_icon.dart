import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TPlainIcon extends StatelessWidget {
  const TPlainIcon({
    super.key,
    this.color,
    this.size = TSizes.lg,
    this.onPressed,
    this.icon,
  });

  final IconData? icon;
  final Color? color;
  final double? size;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Icon(icon, color: color, size: size),
    );
  }
}
