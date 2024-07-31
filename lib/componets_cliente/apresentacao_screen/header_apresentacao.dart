import 'package:flutter/material.dart';

class HeaderApresentacao extends StatelessWidget {
  const HeaderApresentacao({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 350,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: AssetImage('assets/images/miniPaoQuente.png'),
          ),
        ),
      ),
    );
  }
}
