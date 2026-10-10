import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class BrandMark extends StatelessWidget {
  final double size;
  const BrandMark({super.key, this.size = 54});

  @override
  Widget build(BuildContext context) => Center(
    child: Container(
      width: size, height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size * .30),
        gradient: const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight,
          colors: [Color(0xFFC7B0FF), AppColors.purple, Color(0xFF5530A5)]),
        boxShadow: [BoxShadow(color: AppColors.purple.withOpacity(.24), blurRadius: 26, spreadRadius: 1)],
      ),
      child: Icon(Icons.auto_awesome, color: Colors.white, size: size * .52),
    ),
  );
}
