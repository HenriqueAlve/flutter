import 'package:flutter/material.dart';
import 'package:meu_tcc/components/cards.dart';
import 'package:meu_tcc/data/produtos.model.dart';
import 'package:meu_tcc/themes/themes_colors.dart';
import 'package:provider/provider.dart';

class HeaderCarrinho extends StatefulWidget {
  const HeaderCarrinho({super.key});

  @override
  _HeaderCarrinhoState createState() => _HeaderCarrinhoState();
}

class _HeaderCarrinhoState extends State<HeaderCarrinho> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, cartProvider, child) {
        return Center(
          child: Column(
            children: [
              Cards(
                boxContent: Container(
                  width: 300,
                  height: 80,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 2.0, left: 25),
                        child: Row(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              child: Icon(
                                Icons.store_mall_directory,
                                size: 40,
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                'Retirar na loja',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(width: 10),
                            InkWell(
                              onTap: () {
                                cartProvider.setSelectedIndex(0);
                              },
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: cartProvider.selectedIndex == 0
                                      ? Colors.green
                                      : Colors.grey,
                                  shape: BoxShape.circle,
                                ),
                                child: cartProvider.selectedIndex == 0
                                    ? Center(
                                        child: Icon(
                                          Icons.check,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      )
                                    : null,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4.0, right: 15),
                        child: Text(
                          'Retire em até 1 dia útil',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.normal),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Cards(
                boxContent: Container(
                  width: 300,
                  height: 80,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 2.0, left: 25),
                        child: Row(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              child: Icon(
                                Icons.delivery_dining_rounded,
                                size: 40,
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                'Entrega',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(width: 10),
                            InkWell(
                              onTap: () {
                                cartProvider.setSelectedIndex(1);
                              },
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: cartProvider.selectedIndex == 1
                                      ? Colors.green
                                      : Colors.grey,
                                  shape: BoxShape.circle,
                                ),
                                child: cartProvider.selectedIndex == 1
                                    ? Center(
                                        child: Icon(
                                          Icons.check,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      )
                                    : null,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4.0, right: 15),
                        child: Text(
                          'Receba em poucas horas',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.normal),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 2,
                    width: 150,
                    color: ThemeColors.primaryColor,
                  ),
                  Container(
                    height: 2,
                    width: 150,
                    color: ThemeColors.primaryColor,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
