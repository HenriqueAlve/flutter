import 'package:flutter/material.dart';
import 'package:meu_tcc/componets_cliente/apresentacao_screen/header_apresentacao.dart';
import 'package:meu_tcc/componets_cliente/apresentacao_screen/maps.dart';

class ApresentacaoScreen extends StatelessWidget {
  const ApresentacaoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Pão Manager'),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            HeaderApresentacao(),
            SizedBox(
              height: 20,
            ),
            Maps()
          ],
        ),
      ),
    );
  }
}
