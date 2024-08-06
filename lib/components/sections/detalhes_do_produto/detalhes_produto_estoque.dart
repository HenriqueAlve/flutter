import 'package:flutter/material.dart';
import 'package:meu_tcc/components/cards.dart';
import 'package:meu_tcc/data/produtos.model.dart';

class DetalhesEstoque extends StatefulWidget {
  final ProdutoDTO produto;

  const DetalhesEstoque({Key? key, required this.produto}) : super(key: key);

  @override
  _DetalhesEstoqueState createState() => _DetalhesEstoqueState();
}

class _DetalhesEstoqueState extends State<DetalhesEstoque>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;
  bool _showAlert = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
      reverseDuration: Duration(milliseconds: 500),
    )..repeat(reverse: true);
    _colorAnimation = ColorTween(begin: Colors.red, end: Colors.transparent)
        .animate(_controller);
    _checkStock(widget.produto.quantidadeNoEstoque);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _checkStock(int quantidadeNoEstoque) {
    setState(() {
      _showAlert = quantidadeNoEstoque < 5;
    });
  }

  @override
  void didUpdateWidget(covariant DetalhesEstoque oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.produto.quantidadeNoEstoque !=
        oldWidget.produto.quantidadeNoEstoque) {
      _checkStock(widget.produto.quantidadeNoEstoque);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 10),
          child: Text(
            'Estado do estoque',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              shadows: kElevationToShadow[8],
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
          width: 343,
          height: 96,
          child: Cards(
            boxContent: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Estoque total: ${widget.produto.quantidadeNoEstoque}',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                ),
                SizedBox(height: 10),
                if (_showAlert)
                  AnimatedBuilder(
                    animation: _colorAnimation,
                    builder: (context, child) {
                      return Text(
                        'Alerta baixo de estoque',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: _colorAnimation.value,
                        ),
                      );
                    },
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
