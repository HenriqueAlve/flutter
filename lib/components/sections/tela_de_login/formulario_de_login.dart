import 'package:flutter/material.dart';
import 'package:meu_tcc/themes/themes_colors.dart';

class FormularioDeLogin extends StatefulWidget {
  const FormularioDeLogin({super.key});

  @override
  _FormularioDeLoginState createState() => _FormularioDeLoginState();
}

class _FormularioDeLoginState extends State<FormularioDeLogin> {
  bool isChecked = false;

  void _toggleCheckbox(bool? value) {
    setState(() {
      isChecked = value ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 320, // Define a largura do campo de texto
          child: TextFormField(
            decoration: InputDecoration(
              labelText: 'Email',
              labelStyle: Theme.of(context)
                  .textTheme
                  .bodyMedium, // Tamanho do texto do rótulo
              hintText: 'Digite seu email',
              hintStyle: TextStyle(fontSize: 14), // Tamanho do texto de dica
              border: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(15.0), // Aumenta o raio da borda
              ),
              suffixIcon: Icon(Icons.email),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              filled: true,
              fillColor: ThemeColors.primaryColor,
            ),
            style: TextStyle(fontSize: 14), // Tamanho do texto digitado
          ),
        ),
        SizedBox(height: 20),
        Container(
          width: 320, // Define a largura do campo de texto
          child: TextFormField(
            decoration: InputDecoration(
              labelText: 'Senha',
              labelStyle: Theme.of(context)
                  .textTheme
                  .bodyMedium, // Tamanho do texto do rótulo
              hintText: 'Digite sua senha',
              hintStyle: TextStyle(fontSize: 14), // Tamanho do texto de dica
              border: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(15.0), // Aumenta o raio da borda
              ),
              suffixIcon: Icon(Icons.lock),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              filled: true,
              fillColor: ThemeColors.primaryColor,
            ),
            style: TextStyle(fontSize: 14), // Tamanho do texto digitado
          ),
        ),
        SizedBox(
          height: 15,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/home');
          },
          child: Text(
            'Logar',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: ThemeColors.primaryColor,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 100),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  _toggleCheckbox(!isChecked);
                },
                child: Row(
                  children: [
                    Checkbox(
                      value: isChecked,
                      onChanged: _toggleCheckbox,
                    ),
                    Text('Lembre de mim', style: TextStyle(fontSize: 14)),
                  ],
                ),
              ),
              // Adiciona espaço flexível entre os elementos
              Text('Esqueceu sua senha?', style: TextStyle(fontSize: 14)),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 2,
              width: 120,
              color: ThemeColors.primaryColor,
            ),
            Text('ou'),
            Container(
              height: 2,
              width: 120,
              color: ThemeColors.primaryColor,
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        ElevatedButton(
          onPressed: () {},
          child: Text(
            'Google',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: ThemeColors.primaryColor,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 100),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          'Novo aqui? Registrar agora',
          style: TextStyle(fontSize: 14),
        )
      ],
    );
  }
}
