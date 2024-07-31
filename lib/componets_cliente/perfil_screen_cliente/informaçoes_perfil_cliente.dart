import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meu_tcc/components/cards.dart';
import 'package:meu_tcc/themes/themes_colors.dart';

class InformacoesPerfilCliente extends StatelessWidget {
  const InformacoesPerfilCliente({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 500,
      decoration: BoxDecoration(
        color: Color.fromRGBO(29, 33, 27, 1),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Text(
            'Acessos rápidos',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 15),
                child: Column(
                  children: [
                    Container(
                      width: 150,
                      height: 100,
                      child: Center(
                        child: Icon(
                          Icons.text_snippet_rounded,
                          size: 40,
                        ),
                      ),
                      decoration: BoxDecoration(
                          boxShadow: kElevationToShadow[3],
                          borderRadius: BorderRadius.circular(10),
                          color: ThemeColors.colorCard['cartao']),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Meus pedidos',
                      style: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 15),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30, top: 15),
                child: Column(
                  children: [
                    Container(
                      width: 150,
                      height: 100,
                      child: Center(
                        child: FaIcon(
                          FontAwesomeIcons.commentDots,
                          size: 40,
                        ),
                      ),
                      decoration: BoxDecoration(
                          boxShadow: kElevationToShadow[3],
                          borderRadius: BorderRadius.circular(10),
                          color: ThemeColors.colorCard['cartao']),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Ajuda',
                      style: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 15),
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            width: 350,
            height: 1,
            color: Colors.green,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Auxílio de compra',
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 35.0),
                child: Column(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      child: Center(
                        child: FaIcon(
                          FontAwesomeIcons.whatsapp,
                        ),
                      ),
                      decoration: BoxDecoration(
                        boxShadow: kElevationToShadow[3],
                        borderRadius: BorderRadius.circular(10),
                        color: ThemeColors.colorCard['cartao'],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Compre pelo',
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(
                      'WhatsApp',
                      style: TextStyle(fontSize: 14),
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    child: Center(
                      child: FaIcon(
                        FontAwesomeIcons.store,
                      ),
                    ),
                    decoration: BoxDecoration(
                      boxShadow: kElevationToShadow[3],
                      borderRadius: BorderRadius.circular(10),
                      color: ThemeColors.colorCard['cartao'],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Encontre',
                    style: TextStyle(fontSize: 14),
                  ),
                  Text(
                    ' nossa loja',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 35.0),
                child: Column(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      child: Center(
                        child: FaIcon(
                          FontAwesomeIcons.clipboard,
                        ),
                      ),
                      decoration: BoxDecoration(
                        boxShadow: kElevationToShadow[3],
                        borderRadius: BorderRadius.circular(10),
                        color: ThemeColors.colorCard['cartao'],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Os produto',
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(
                      ' mais pedidos',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
