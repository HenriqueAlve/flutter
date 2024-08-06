import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meu_tcc/components/cards.dart';
import 'package:meu_tcc/data/produtos.model.dart';
import 'package:meu_tcc/themes/themes_colors.dart';
import 'package:provider/provider.dart';
//172.100.127.125

class HeaderPerfilCliente extends StatelessWidget {
  const HeaderPerfilCliente({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 60, top: 25),
          child: Text(
            'Sua conta O Pão Manager',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 165, top: 25),
          child: Text('Dados pessoais'),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, top: 15, right: 15),
          child: Cards(
            boxContent: Container(
              width: 320,
              height: 200,
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nome: ${authProvider.nome ?? 'Desconhecido'}'),
                  Text('E-mail: ${authProvider.username ?? 'Desconhecido'}'),
                  Text('CPF: ${authProvider.cpf ?? 'Desconhecido'}'),
                  Text('Telefone: ${authProvider.telefone ?? 'Desconhecido'}'),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 20,
            right: 180,
          ),
          child: Text(
            'Endereços',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            width: 320,
            height: 60,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 45),
                  child: Text('Adicionar novo endereço'),
                ),
                Icon(Icons.add),
              ],
            ),
            decoration: BoxDecoration(
              color: ThemeColors.colorCard['cartao'],
              boxShadow: kElevationToShadow[3],
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 20,
            right: 210,
          ),
          child: Text(
            'Cartóes',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            width: 320,
            height: 60,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Text('Adicionar novo cartão'),
                ),
                Icon(Icons.add),
              ],
            ),
            decoration: BoxDecoration(
              color: ThemeColors.colorCard['cartao'],
              boxShadow: kElevationToShadow[3],
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        )
      ],
    );
  }
}
