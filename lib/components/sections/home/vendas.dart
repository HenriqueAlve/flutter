import 'package:flutter/material.dart';
import 'package:meu_tcc/screens/vendas_screen.dart';
import 'package:meu_tcc/themes/themes_colors.dart';

class Vendas extends StatelessWidget {
  const Vendas({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15.0, top: 5),
          child: Text(
            "Transações de vendas",
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
        Container(
          width: 365,
          height: 134, // Ajuste a altura conforme necessário
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: ThemeColors.colorCard['cartao'],
            boxShadow: kElevationToShadow[3],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Linha contendo a imagem e os textos
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Imagem com espaçamento à esquerda
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Image.asset(
                        'assets/images/graficoMoney-removebg-preview.png',
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 10),
                    // Textos centralizados verticalmente
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Vendas recentes',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Veja transações de vendas recentes.',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Spacer(), // Adiciona um espaço flexível entre a linha e o botão
                // Botão
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              VendasScreen(), // Tela que lista todos os produtos
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ThemeColors.primaryColor, // Cor do botão
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 70),
                    ),
                    child: Text(
                      'Visualizar suas vendas',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
