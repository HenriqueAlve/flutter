import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:meu_tcc/componets_cliente/CarrinhoScrren/header_carrinho.dart';
import 'package:meu_tcc/data/produtos.model.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class CarrinhoScrren extends StatefulWidget {
  const CarrinhoScrren({super.key});

  @override
  State<CarrinhoScrren> createState() => _CarrinhoScrrenState();
}

class _CarrinhoScrrenState extends State<CarrinhoScrren> {
  Future<void> _registrarVenda() async {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);

    for (var item in cartProvider.cartItems) {
      final url =
          'http://192.168.100.2:8080/api/vendas/vender/${item.id}/${item.quantidade}';

      final response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        // Venda registrada com sucesso
        print('Venda registrada com sucesso para o item ${item.nome}');
      } else {
        // Erro ao registrar venda
        print(
            'Erro ao registrar venda para o item ${item.nome}: ${response.statusCode}');
        print('Resposta: ${response.body}');
      }
    }
  }

  Future<void> _finalizarCompra() async {
    // Registrar a venda no backend
    await _registrarVenda();

    // Navegar para a tela de "Processando o Pedido"
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => ProcessandoPedidoScreen(),
    ));

    // Simula o processamento do pedido
    await Future.delayed(Duration(seconds: 3));

    // Navegar para a tela de "Processando o Pagamento"
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => ProcessandoPagamentoScreen(),
    ));

    // Simula o processamento do pagamento
    await Future.delayed(Duration(seconds: 3));

    // Exibe confirmação de sucesso ou falha
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Pagamento realizado com sucesso!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Sacola de compras'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 25,
          ),
          HeaderCarrinho(),
          Expanded(
            child: ListView.builder(
              itemCount: cartProvider.cartItems.length,
              itemBuilder: (context, index) {
                final item = cartProvider.cartItems[index];
                return ListTile(
                  title: Text(item.nome!),
                  subtitle: Text('R\$ ${item.preco.toStringAsFixed(2)}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          // Decrementar a quantidade
                          setState(() {
                            if (item.quantidade > 1) {
                              item.quantidade--;
                              // Atualizar o provider ou estado do carrinho
                              cartProvider.updateItem(item);
                            }
                          });
                        },
                      ),
                      Text('${item.quantidade}'),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          // Incrementar a quantidade
                          setState(() {
                            item.quantidade++;
                            // Atualizar o provider ou estado do carrinho
                            cartProvider.updateItem(item);
                          });
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          // Remover o item do carrinho
                          setState(() {
                            cartProvider.removeItem(item);
                          });
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.green)),
            onPressed: _finalizarCompra,
            child: Text(
              'Finalizar compra',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

class ProcessandoPedidoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset(
              'assets/loading.json',
              width: 350,
              height: 400,
            ),
            SizedBox(height: 20),
            Text('Processando o pedido...'),
          ],
        ),
      ),
    );
  }
}

class ProcessandoPagamentoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset(
              'assets/pagamento.json',
              width: 400,
              height: 400,
            ),
            SizedBox(height: 20),
            Text('Processando o pagamento...'),
          ],
        ),
      ),
    );
  }
}
