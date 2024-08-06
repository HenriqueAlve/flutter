import 'package:flutter/material.dart';

import '../componets_cliente/ajuda_screen/header_ajuda_screen.dart';

class AjudaScreen extends StatelessWidget {
  const AjudaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajuda'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderAjudaScreen(),
          ],
        ),
      ),
    );
  }
}
