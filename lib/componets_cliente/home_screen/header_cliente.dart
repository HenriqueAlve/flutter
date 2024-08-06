import 'package:flutter/material.dart';
import 'package:meu_tcc/cliente_screens/busca_screen.dart';
import 'package:meu_tcc/cliente_screens/carrinho_screen.dart';
import 'package:meu_tcc/cliente_screens/favorite_screen.dart';
import 'package:meu_tcc/data/produtos.model.dart';
import 'package:meu_tcc/themes/themes_colors.dart';
import 'package:provider/provider.dart';

class HeaderCliente extends StatelessWidget {
  const HeaderCliente({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Container(
      decoration: BoxDecoration(
        color: ThemeColors.primaryColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 52, 16, 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Image(
              image:
                  AssetImage('assets/images/paosemfundo-removebg-preview.png'),
              width: 50,
              height: 50,
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BuscaProdutoScreen(),
                  ),
                );
              },
              child: const Icon(
                Icons.search_rounded,
                size: 35,
              ),
            ),
            const SizedBox(width: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FavoriteScreen(
                      produtosFavoritados: cartProvider.produtosFavoritados,
                    ),
                  ),
                );
              },
              child: const Icon(
                Icons.favorite_border,
                size: 35,
              ),
            ),
            const SizedBox(width: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CarrinhoScrren(),
                  ),
                );
              },
              child: const Icon(
                Icons.shopping_bag_rounded,
                size: 35,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
