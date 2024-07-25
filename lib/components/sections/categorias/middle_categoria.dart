import 'package:flutter/material.dart';
import 'package:meu_tcc/helpers/confirmation_dialog_helper.dart';
import 'package:meu_tcc/themes/themes_colors.dart';

class MiddleCategoria extends StatelessWidget {
  const MiddleCategoria({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        width: 357,
        height: 250,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5.0, bottom: 5, right: 185),
              child: Text('Nome da categoria'),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30, bottom: 10),
              child: SizedBox(
                width: 320,
                height: 50, // Defina a largura desejada aqui
                child: TextFormField(
                  decoration: InputDecoration(
                    fillColor: ThemeColors.colorCard['cartao'],
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0, bottom: 5, right: 150),
              child: Text('Descrição da categoria'),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30, bottom: 10),
              child: SizedBox(
                width: 320,
                height: 50, // Defina a largura desejada aqui
                child: TextFormField(
                  decoration: InputDecoration(
                    fillColor: ThemeColors.colorCard['cartao'],
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 100),
                  child: ElevatedButton(
                    onPressed: () {
                      // Implemente a navegação para a tela de edição aqui
                      // Navigator.of(context).push(MaterialPageRoute(builder: (context) => MinhaTelaDeEdicao()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ThemeColors.primaryColor,
                      minimumSize: Size(70, 33),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                    child: Text(
                      'Cancelar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Implemente a navegação para a tela de edição aqui
                    // Navigator.of(context).push(MaterialPageRoute(builder: (context) => MinhaTelaDeEdicao()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ThemeColors.primaryColor,
                    minimumSize: Size(70, 33),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                  child: Text(
                    'Salvar',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
