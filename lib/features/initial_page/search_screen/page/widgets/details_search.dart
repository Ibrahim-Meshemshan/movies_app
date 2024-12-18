import 'package:flutter/material.dart';

import '../../../../../core/Theme/Theme_manager.dart';

class DetailsSearch extends StatelessWidget {
  const DetailsSearch({super.key, required this.icon, required this.text, this.color});

  final IconData icon;
  final String text;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon,color: color,),
        const SizedBox(width: 10),
        Text(text,style: const TextStyle(color: ThemeManager.whiteColor),),

      ],
    );
  }
}
