import 'package:flutter/material.dart';
import 'package:meu_tcc/componets_cliente/buscar_produto_scrren/header_buscar_produto.dart';
import 'package:meu_tcc/themes/themes_colors.dart';

class BuscaProdutoScreen extends StatefulWidget {
  const BuscaProdutoScreen({super.key});

  @override
  State<BuscaProdutoScreen> createState() => _BuscaProdutoScreenState();
}

class _BuscaProdutoScreenState extends State<BuscaProdutoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HeaderBuscarProduto(),
          SizedBox(
            height: 25,
          ),
          Container(
            decoration: BoxDecoration(
              color: ThemeColors.colorCard['cartao'],
              borderRadius: BorderRadius.circular(10),
            ),
            width: 250,
            height: 130,
            child: Column(
              children: [
                Text(
                  'Meus pedidos',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.shopping_bag_outlined,
                      size: 45,
                    ),
                    Text(
                      'Acompanhe o andamento dos',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    'seus pedidos realizados',
                    style: TextStyle(fontSize: 14),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
