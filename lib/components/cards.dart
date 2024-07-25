import 'package:flutter/material.dart';

import 'package:meu_tcc/themes/themes_colors.dart';

class Cards extends StatelessWidget {
  final Widget boxContent;
  const Cards({
    super.key,
    required this.boxContent,
  });

  @override
  Widget build(BuildContext context) {
    return Ink(
      child: boxContent,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          boxShadow: kElevationToShadow[3],
          borderRadius: BorderRadius.circular(10),
          color: ThemeColors.colorCard['cartao']),
    );
  }
}
