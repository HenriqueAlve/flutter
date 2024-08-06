import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextoAnimado extends StatelessWidget {
  const TextoAnimado({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const SizedBox(width: 20.0, height: 100.0),
        DefaultTextStyle(
          style: GoogleFonts.luckiestGuy(
            fontSize: 22,
            color: Colors.white,
          ),
          child: AnimatedTextKit(
            animatedTexts: [
              RotateAnimatedText('Encontre os melhores produtos'),
              RotateAnimatedText('em nosso'),
              RotateAnimatedText('aplicativo'),
            ],
            repeatForever: true,
            onTap: () {
              print("Tap Event");
            },
          ),
        ),
      ],
    );
  }
}
