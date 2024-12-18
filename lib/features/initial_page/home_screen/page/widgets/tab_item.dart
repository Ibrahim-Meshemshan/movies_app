import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/Theme/Theme_manager.dart';

class TabItem extends StatelessWidget {
  const TabItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        color: const Color(0xff252836),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        'categoris',
        style: ThemeManager.nightTheme.textTheme.titleSmall
            ?.copyWith(color: Colors.blue),
      ),
    );
  }
}