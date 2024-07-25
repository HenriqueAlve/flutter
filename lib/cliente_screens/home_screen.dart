import 'package:flutter/material.dart';
import 'package:meu_tcc/componets_cliente/home_screen/bottom_navigator_bar.dart';
import 'package:meu_tcc/componets_cliente/home_screen/carrosel.dart';
import 'package:meu_tcc/componets_cliente/home_screen/cartao.dart';
import 'package:meu_tcc/componets_cliente/home_screen/header_cliente.dart';
import 'package:meu_tcc/componets_cliente/home_screen/texto_animado.dart';
import 'package:meu_tcc/data/produtos.model.dart';
import 'package:meu_tcc/data/services.dart';

class HomeScreenCliente extends StatelessWidget {
  const HomeScreenCliente({super.key});

  get produto => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderCliente(),
            TextoAnimado(),
            Carrosel(),
            Padding(
              padding: const EdgeInsets.only(right: 190, top: 25),
              child: Text(
                "Produtos",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            FutureBuilder<List<ProdutoDTO>>(
              future: ProdutoService().buscarProdutos(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Erro ao carregar produtos'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('Nenhum produto encontrado'));
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 280, // Ajuste a altura para caber seus cartões
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          final produto = snapshot.data![index];
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: CartaoProduto(produto: produto),
                          );
                        },
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
