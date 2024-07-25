import 'package:flutter/material.dart';
import 'package:meu_tcc/components/sections/vendas/home_vendas.dart';
import 'package:meu_tcc/components/sections/vendas/middle_vendas.dart';

class VendasScreen extends StatelessWidget {
  const VendasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vendas'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 280, top: 25),
              child:
                  Text('Painel', style: Theme.of(context).textTheme.bodySmall),
            ),
            HomeVendas(),
            SizedBox(
              height: 20,
            ),
            MiddleVendas()
          ],
        ),
      ),
    );
  }
}
