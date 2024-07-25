import 'package:flutter/material.dart';
import 'package:meu_tcc/components/sections/home/inventario.dart';
import 'package:meu_tcc/components/sections/home/vendas.dart';
import 'package:meu_tcc/screens/home.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class NavigatorBar extends StatefulWidget {
  const NavigatorBar({super.key});

  @override
  State<NavigatorBar> createState() => _NavigatorBarState();
}

class _NavigatorBarState extends State<NavigatorBar> {
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  List<Widget> _buildScreens() {
    return [
      Home(),
      Invetario(),
      Vendas(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title: ("Home"),
        activeColorPrimary: Colors.amber[800]!,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.inventory),
        title: ("Inventário"),
        activeColorPrimary: Colors.amber[800]!,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.shopping_cart),
        title: ("Vendas"),
        activeColorPrimary: Colors.amber[800]!,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineToSafeArea: true,
      backgroundColor: Colors.white, // Cor de fundo do bottom nav bar
      handleAndroidBackButtonPress: true, // Botão de volta do Android
      resizeToAvoidBottomInset: true, // Evitar a sobreposição do teclado
      stateManagement: true,
      navBarStyle: NavBarStyle.style6, // Estilo do bottom nav bar
    );
  }
}
