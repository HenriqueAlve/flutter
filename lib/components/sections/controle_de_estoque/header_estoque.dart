import 'package:flutter/material.dart';
import 'package:meu_tcc/screens/adicionar_produto.dart';
import 'package:meu_tcc/themes/themes_colors.dart';

class HeaderEstoque extends StatelessWidget {
  final ValueChanged<String> onSearch;

  const HeaderEstoque({super.key, required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Estoque atual',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AdicionarProdutos()));
                },
                child: Text(
                  'Adicionar novo produto',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: ThemeColors.primaryColor,
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 350,
          height: 50,
          decoration: BoxDecoration(
            color: Color.fromRGBO(16, 20, 15, 1), // Cor de fundo
            borderRadius: BorderRadius.circular(30.0), // Bordas arredondadas
            // Cor da borda
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Buscar...',
              hintStyle: TextStyle(color: Colors.white), // Cor do texto de dica
              border: InputBorder.none,
              prefixIcon: Icon(Icons.search,
                  color: Colors.white), // Cor do ícone de busca
              suffixIcon: IconButton(
                icon: Icon(Icons.clear,
                    color: Colors.white), // Cor do ícone de limpar
                onPressed: () {},
              ),
              contentPadding: EdgeInsets.only(top: 11),
            ),
            style: TextStyle(
                color: Colors.white, fontSize: 14), // Cor do texto digitado
            onChanged: onSearch,
          ),
        ),
      ],
    );
  }
}
