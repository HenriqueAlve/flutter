import 'package:flutter/material.dart';
import 'package:meu_tcc/themes/themes_colors.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ThemeColors.primaryColor,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15))),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 52, 16, 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Image.asset(
              'assets/images/paosemfundo-removebg-preview.png',
              width: 50,
              height: 50,
            ),
            Text(
              'Pao Manager',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 100),
              child: Icon(
                Icons.account_circle,
                size: 30,
              ),
            )
          ],
        ),
      ),
    );
  }
}
