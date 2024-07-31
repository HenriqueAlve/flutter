import 'package:flutter/material.dart';

class Maps extends StatefulWidget {
  const Maps({super.key});

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 150),
          child: Text(
            'Nossa localização',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
        Container(
          width: double.infinity,
          height: 250,
          color: Colors.amber,
        ),
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 195),
          child: Text(
            'Quem somos',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
              'Bem-vindo à nossa padaria! Somos uma equipe apaixonada por panificação, dedicada a trazer os melhores pães e doces frescos para nossa comunidade. Utilizamos ingredientes de alta qualidade e técnicas tradicionais para garantir que cada mordida seja deliciosa e memorável. Venha nos visitar e experimente a diferença!'),
        ),
        SizedBox(
          height: 30,
        )
      ],
    );
  }
}
