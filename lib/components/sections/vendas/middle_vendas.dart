import 'package:flutter/material.dart';
import 'package:meu_tcc/components/cards.dart';
import 'package:meu_tcc/themes/themes_colors.dart';

class MiddleVendas extends StatelessWidget {
  const MiddleVendas({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Vendas realizadas'),
        Cards(
            boxContent: Container(
          width: 340,
          height: 400,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Lista de vendas'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 35,
                    width: 240,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Pesquisar vendas...',
                        hintStyle: TextStyle(
                          color: Colors.white,
                        ),
                        border: InputBorder.none,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.clear,
                            color: Colors.white,
                          ),
                          onPressed: () {},
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                      ),
                      style: TextStyle(color: Colors.white, fontSize: 14),
                      textAlignVertical: TextAlignVertical.center,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Filtrar",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ThemeColors.primaryColor,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Column(
                  children: [
                    Container(
                      width: 311,
                      height: 108,
                      color: Color.fromRGBO(29, 33, 27, 1),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: 311,
                      height: 108,
                      color: Color.fromRGBO(29, 33, 27, 1),
                    ),
                  ],
                ),
              )
            ],
          ),
        ))
      ],
    );
  }
}
