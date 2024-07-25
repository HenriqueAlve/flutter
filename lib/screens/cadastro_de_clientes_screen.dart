import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CadastroDeClienteScreen extends StatelessWidget {
  const CadastroDeClienteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("data"),
      ),
      body: Column(
        children: [
          Container(
            child: Lottie.asset('assets/cadastro.json'),
          ),
        ],
      ),
    );
  }
}
