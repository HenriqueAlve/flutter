import 'package:flutter/material.dart';
import 'package:meu_tcc/components/sections/home/categoria.dart';

import 'package:meu_tcc/components/sections/home/header.dart';
import 'package:meu_tcc/components/sections/home/inventario.dart';
import 'package:meu_tcc/components/sections/home/middle.dart';

import 'package:meu_tcc/components/sections/home/vendas.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Header(),
            SizedBox(
              height: 5,
            ),
            Middle(),
            SizedBox(
              height: 5,
            ),
            Invetario(),
            SizedBox(
              height: 5,
            ),
            Vendas(),
            SizedBox(
              height: 5,
            ),
            Categoria()
          ],
        ),
      ),
    );
  }
}
