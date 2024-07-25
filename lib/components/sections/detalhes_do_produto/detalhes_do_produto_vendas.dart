import 'package:flutter/material.dart';
import 'package:meu_tcc/components/cards.dart';
import 'package:meu_tcc/data/produtos.model.dart';

class DetalhesVendas extends StatelessWidget {
  final ProdutoDTO produto;

  const DetalhesVendas({super.key, required this.produto});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('Venda tansações',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            shadows: kElevationToShadow[8],
          )),
      SizedBox(
        height: 10,
      ),
      Container(
        width: 343,
        height: 96,
        child: Cards(
            boxContent: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Vendas de hoje',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.normal)),
                Text('\$ ${produto.preco}'),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Transações totais',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.normal)),
                Text('45',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.normal)),
              ],
            )
          ],
        )),
      )
    ]);
  }
}
