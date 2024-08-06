import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:meu_tcc/cliente_screens/detalhes_produto_cliente_screen.dart';
import 'package:meu_tcc/components/cards.dart';
import 'package:meu_tcc/data/produtos.model.dart';
import 'package:meu_tcc/themes/themes_colors.dart';
import 'package:meu_tcc/cliente_screens/favorite_screen.dart'; // Importar a tela de favoritos

class CartaoProduto extends StatefulWidget {
  final ProdutoDTO produto;

  const CartaoProduto({super.key, required this.produto});

  @override
  _CartaoProdutoState createState() => _CartaoProdutoState();
}

class _CartaoProdutoState extends State<CartaoProduto> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetalhesDoProdutoScreen(
              nomeProduto: widget.produto.nome,
              imagemProduto: widget.produto.imagemBytes,
              precoProduto: widget.produto.preco,
            ),
          ),
        );
      },
      child: Container(
        width: 200,
        height: 280,
        child: Cards(
          boxContent: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 30,
                height: 30,
                child: Center(
                  child: IconButton(
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: ThemeColors.primaryColor,
                        size: 24,
                      ),
                      onPressed: () {
                        setState(() {
                          isFavorite = !isFavorite;

                          if (isFavorite) {
                            cartProvider.addToFavorites(widget.produto);
                          } else {
                            cartProvider.removeFromFavorites(widget.produto);
                          }
                        });
                      }),
                ),
              ),
              widget.produto.imagemBytes != null
                  ? Center(
                      child: Image.memory(
                        widget.produto.imagemBytes!,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Container(
                      width: 200,
                      height: 150,
                      color: Colors.grey,
                      child: Icon(Icons.image_not_supported),
                    ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  widget.produto.categoriaDTO?.nome ??
                      'Categoria não disponível',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  widget.produto.nome,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'R\$ ${widget.produto.preco.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        cartProvider.addItem(CartItem(
                          produto: widget.produto,
                          quantidade: 1,
                        ));
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                '${widget.produto.nome} adicionado ao carrinho!'),
                          ),
                        );
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Icon(
                          Icons.shopping_bag,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
