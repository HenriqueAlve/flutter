import 'package:flutter/material.dart';
import 'package:meu_tcc/data/produtos.model.dart';

import 'package:flutter/material.dart';
import 'package:meu_tcc/data/produtos.model.dart';

class MeusPedidosScreen extends StatelessWidget {
  final List<Pedido> pedidos;

  MeusPedidosScreen({required this.pedidos});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meus Pedidos'),
      ),
      body: ListView.builder(
        itemCount: pedidos.length,
        itemBuilder: (context, index) {
          final pedido = pedidos[index];
          return ListTile(
            title: Text('Pedido ${pedido.id}'),
            subtitle: Text('Data: ${pedido.data}'),
            trailing: Text('${pedido.status}'),
          );
        },
      ),
    );
  }
}

class DetalhesPedidoScreen extends StatelessWidget {
  final Pedido pedido;

  const DetalhesPedidoScreen({Key? key, required this.pedido})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes do Pedido ${pedido.id}'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Data: ${pedido.data}'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Status: ${pedido.status}'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: pedido.itens.length,
              itemBuilder: (context, index) {
                final item = pedido.itens[index];
                return ListTile(
                  title: Text(item.nome),
                  subtitle: Text('R\$ ${item.preco.toStringAsFixed(2)}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
