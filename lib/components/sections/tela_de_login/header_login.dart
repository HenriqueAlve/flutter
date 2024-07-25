import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HeaderLogin extends StatelessWidget {
  const HeaderLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Lottie.asset('assets/AnimatioVerdao.json'),
      ),
    );
  }
}
