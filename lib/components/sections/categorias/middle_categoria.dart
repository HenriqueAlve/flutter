import 'package:flutter/material.dart';
import 'package:meu_tcc/data/produtos.model.dart';
import 'package:meu_tcc/data/services.dart';
import 'package:meu_tcc/themes/themes_colors.dart';

class MiddleCategoria extends StatefulWidget {
  const MiddleCategoria({super.key});

  @override
  _MiddleCategoriaState createState() => _MiddleCategoriaState();
}

class _MiddleCategoriaState extends State<MiddleCategoria> {
  final TextEditingController nomeController = TextEditingController();

  Future<void> adicionarCategoria() async {
    try {
      CategoriaDTO categoria = CategoriaDTO(
        nome: nomeController.text,
      );

      await CategoriaService().adicionarCategoria(categoria);
      setState(() {
        nomeController.clear();
      });
    } catch (sucesso) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Categoria adicionada com sucesso!'),
        backgroundColor: Colors.green,
      ));
    }
  }

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
                height: 50,
                child: TextFormField(
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                  controller: nomeController,
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
                ElevatedButton(
                  onPressed: adicionarCategoria,
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
