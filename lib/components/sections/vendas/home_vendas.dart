import 'package:flutter/material.dart';
import 'package:meu_tcc/components/cards.dart';
import 'package:meu_tcc/data/services.dart';
import 'package:meu_tcc/main.dart';

class HomeVendas extends StatelessWidget {
  const HomeVendas({super.key});

  @override
  Widget build(BuildContext context) {
    final VendaService vendaService = VendaService();

    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Container(
        height: 120,
        child: Cards(
          boxContent: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Column(
                      children: [
                        Text('Total de vendas'),
                        SizedBox(height: 8),
                        FutureBuilder<double>(
                          future: vendaService.getTotalVendas(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return CircularProgressIndicator();
                            } else if (snapshot.hasError) {
                              return Text('Erro');
                            } else {
                              return Text(
                                '${snapshot.data}',
                                style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 50.0),
                    child: Column(
                      children: [
                        Text('Pedidos'),
                        SizedBox(height: 8),
                        FutureBuilder<int>(
                          future: vendaService.getTotalPedidos(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return LoadingIndicator();
                            } else if (snapshot.hasError) {
                              return Text('Erro');
                            } else {
                              return Text(
                                '${snapshot.data}',
                                style: TextStyle(color: Colors.green),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
