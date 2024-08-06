import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meu_tcc/themes/themes_colors.dart';

class HeaderAjudaScreen extends StatelessWidget {
  const HeaderAjudaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 280,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'Perguntas frequentes',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Text('Ficou com alguma dúvida? Acesse as'),
              Text('principais dúvidas sobre a nossa loja'),
              Text('e os nossos produtos.'),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: SizedBox(
                  height: 55,
                  child: TextField(
                      decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    suffixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(),
                  )),
                ),
              ),
            ],
          ),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(35.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 150,
                    height: 100,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 25,
                        ),
                        FaIcon(
                          FontAwesomeIcons.user,
                          size: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            'Cadastro',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22),
                          ),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                        boxShadow: kElevationToShadow[3],
                        borderRadius: BorderRadius.circular(10),
                        color: ThemeColors.colorCard['cartao']),
                  ),
                  Container(
                    width: 150,
                    height: 100,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 25,
                        ),
                        FaIcon(
                          FontAwesomeIcons.box,
                          size: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            'Meus pedidos',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                        boxShadow: kElevationToShadow[3],
                        borderRadius: BorderRadius.circular(10),
                        color: ThemeColors.colorCard['cartao']),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(35.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 150,
                    height: 100,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 25,
                        ),
                        FaIcon(
                          FontAwesomeIcons.truck,
                          size: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            'Entregas',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22),
                          ),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                        boxShadow: kElevationToShadow[3],
                        borderRadius: BorderRadius.circular(10),
                        color: ThemeColors.colorCard['cartao']),
                  ),
                  Container(
                    width: 150,
                    height: 100,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 25,
                        ),
                        FaIcon(
                          FontAwesomeIcons.dollarSign,
                          size: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            'Pagamentos',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22),
                          ),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                        boxShadow: kElevationToShadow[3],
                        borderRadius: BorderRadius.circular(10),
                        color: ThemeColors.colorCard['cartao']),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(35.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 150,
                    height: 100,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 25,
                        ),
                        FaIcon(
                          FontAwesomeIcons.store,
                          size: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            'Nossa loja',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22),
                          ),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                        boxShadow: kElevationToShadow[3],
                        borderRadius: BorderRadius.circular(10),
                        color: ThemeColors.colorCard['cartao']),
                  ),
                  Container(
                    width: 150,
                    height: 100,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 25,
                        ),
                        FaIcon(
                          FontAwesomeIcons.tag,
                          size: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            'Descontos',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22),
                          ),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                        boxShadow: kElevationToShadow[3],
                        borderRadius: BorderRadius.circular(10),
                        color: ThemeColors.colorCard['cartao']),
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
