import 'package:flutter/material.dart';
import 'package:meu_tcc/themes/themes_colors.dart';

class Invetario extends StatelessWidget {
  const Invetario({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15.0, top: 5),
          child: Text(
            "Controle de estoque",
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
        Container(
          width: 365,
          height: 134,
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Image.asset(
                        'assets/images/boxxxx-removebg-preview.png',
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Estoque atual',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Acompanhe os níveis de estoque',
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
                const Spacer(),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/estoque');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ThemeColors.primaryColor,
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 80),
                    ),
                    child: Text(
                      'Visualizar estoque',
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
