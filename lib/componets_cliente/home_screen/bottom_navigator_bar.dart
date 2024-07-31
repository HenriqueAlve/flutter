import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:meu_tcc/cliente_screens/apresentacao_screen.dart';
import 'package:meu_tcc/cliente_screens/busca_screen.dart';
import 'package:meu_tcc/cliente_screens/categorias_screen.dart';
import 'package:meu_tcc/cliente_screens/home_screen.dart';
import 'package:meu_tcc/cliente_screens/perfil_screen.dart';

import 'package:meu_tcc/themes/themes_colors.dart';

class CurvedBottomNavigationBar extends StatefulWidget {
  @override
  _CurvedBottomNavigationBarState createState() =>
      _CurvedBottomNavigationBarState();
}

class _CurvedBottomNavigationBarState extends State<CurvedBottomNavigationBar> {
  int _selectedIndex = 0;
  final List<IconData> iconList = [
    Icons.home,
    Icons.store,
    Icons.menu,
    Icons.person,
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          // Suas telas vão aqui
          HomeScreenCliente(),
          ApresentacaoScreen(),
          CategoriaScreenCliente(),
          PerfilScreenCliente()
        ],
      ),
      floatingActionButton: Container(
        width: 50,
        height: 50,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => BuscaProdutoScreen()));
          },
          child: Icon(Icons.search_rounded),
          backgroundColor: ThemeColors.primaryColor,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        activeIndex: _selectedIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: _onItemTapped,
        // Personalize o design conforme necessário
        activeColor: ThemeColors.primaryColor,
        inactiveColor: Colors.grey,
        iconSize: 30,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
      ),
    );
  }
}
