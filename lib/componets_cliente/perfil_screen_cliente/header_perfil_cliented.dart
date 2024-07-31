import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meu_tcc/data/produtos.model.dart';
import 'package:provider/provider.dart';
import 'package:meu_tcc/themes/themes_colors.dart';

class HeaderClienteScreen extends StatelessWidget {
  const HeaderClienteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final username =
        authProvider.username ?? 'Usuário'; // Usa 'Usuário' se o nome for null

    return Container(
      width: double.infinity,
      height: 300,
      color: ThemeColors.primaryColor,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Container(
              width: 80,
              height: 80,
              child: Center(
                child: FaIcon(
                  FontAwesomeIcons.breadSlice,
                  size: 55,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            'Bom dia, $username',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 15),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 160,
              height: 35,
              child: Row(
                children: [
                  Icon(
                    Icons.person_outlined,
                  ),
                  Text(
                    'Acessar meu perfil',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              decoration: BoxDecoration(
                color: ThemeColors.colorCard['cartao'],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
