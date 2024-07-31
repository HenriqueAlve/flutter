import 'package:flutter/material.dart';
import 'package:meu_tcc/data/produtos.model.dart';
import 'dart:typed_data';

import 'package:meu_tcc/themes/themes_colors.dart';
import 'package:provider/provider.dart';

class HeaderDetalhesProdutos extends StatefulWidget {
  final ProdutoDTO produto; // Use ProdutoDTO em vez de parâmetros separados

  const HeaderDetalhesProdutos({
    super.key,
    required this.produto,
  });

  @override
  _HeaderDetalhesProdutosState createState() => _HeaderDetalhesProdutosState();
}

class _HeaderDetalhesProdutosState extends State<HeaderDetalhesProdutos> {
  int quantidade = 1;
  double get precoTotal => widget.produto.preco * quantidade;

  void _aumentarQuantidade() {
    setState(() {
      quantidade++;
    });
  }

  void _diminuirQuantidade() {
    setState(() {
      if (quantidade > 1) {
        quantidade--;
      }
    });
  }

  void _adicionarAoCarrinho() {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    cartProvider.addItem(
      CartItem(
        produto: widget.produto,
        quantidade: quantidade,
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${widget.produto.nome} adicionado ao carrinho!'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 400,
          child: widget.produto.imagemProduto != null
              ? Image.memory(
                  widget.produto.imagemProduto!,
                  fit: BoxFit.cover,
                )
              : Center(
                  child: Icon(Icons.image_not_supported, size: 50),
                ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.produto.nome,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'R\$ ${widget.produto.preco.toStringAsFixed(2)} cada',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.green,
                ),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                    ),
                    onPressed: _diminuirQuantidade,
                    child: Text(
                      '-',
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                  SizedBox(width: 16),
                  Text(
                    '$quantidade',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 16),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(ThemeColors.primaryColor),
                    ),
                    onPressed: _aumentarQuantidade,
                    child: Text(
                      '+',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Preço Total: ',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: 'R\$ ${precoTotal.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 20,
                        color: ThemeColors.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 25,
        ),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(ThemeColors.primaryColor),
          ),
          onPressed: _adicionarAoCarrinho,
          child: Text(
            'Adicionar ao carrinho',
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }
}
