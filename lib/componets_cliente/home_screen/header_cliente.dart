import 'package:flutter/material.dart';
import 'package:meu_tcc/themes/themes_colors.dart';

class HeaderCliente extends StatelessWidget {
  const HeaderCliente({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ThemeColors.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 52, 16, 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            // Imagem no lado esquerdo
            Image.asset(
              'assets/images/paosemfundo-removebg-preview.png',
              width: 50,
              height: 50,
            ),
            // Spacer para empurrar os ícones para a direita
            Spacer(),
            // Ícones no lado direito
            Icon(
              Icons.search_rounded,
              size: 35,
            ),
            SizedBox(width: 20), // Espaçamento entre os ícones
            Icon(
              Icons.favorite_border,
              size: 35,
            ),
            SizedBox(width: 20), // Espaçamento entre os ícones
            Icon(
              Icons.shopping_bag_rounded,
              size: 35,
            ),
          ],
        ),
      ),
    );
  }
}
