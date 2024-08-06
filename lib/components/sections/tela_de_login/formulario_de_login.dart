import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meu_tcc/data/produtos.model.dart';
import 'package:meu_tcc/themes/themes_colors.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class FormularioDeLogin extends StatefulWidget {
  const FormularioDeLogin({super.key});

  @override
  _FormularioDeLoginState createState() => _FormularioDeLoginState();
}

class _FormularioDeLoginState extends State<FormularioDeLogin> {
  bool isChecked = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  String? _errorMessage;

  void _toggleCheckbox(bool? value) {
    setState(() {
      isChecked = value ?? false;
    });
  }

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final response = await http.post(
        Uri.parse('http://192.168.100.2:8080/auth/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'username': _emailController.text,
          'password': _passwordController.text,
        }),
      );

      if (response.statusCode == 200) {
        final loginResponse = jsonDecode(response.body);

        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('authToken', loginResponse['token']);

        final authProvider = Provider.of<AuthProvider>(context, listen: false);
        await authProvider.login(context, _emailController.text,
            _passwordController.text, isChecked.toString());

        if (authProvider.role == 'ROOT') {
          Navigator.of(context).pushReplacementNamed('/home');
        } else if (authProvider.role == 'USER') {
          Navigator.of(context).pushReplacementNamed('/bar');
        }
      } else {
        setState(() {
          _errorMessage = 'Erro: ${response.body}';
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Erro ao fazer login: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 320,
          child: TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: 'Email',
              labelStyle: Theme.of(context).textTheme.bodyMedium,
              hintText: 'Digite seu email',
              hintStyle: TextStyle(fontSize: 14),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              suffixIcon: Icon(Icons.email),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              filled: true,
              fillColor: ThemeColors.primaryColor,
            ),
            style: TextStyle(fontSize: 14, color: Colors.white),
          ),
        ),
        SizedBox(height: 20),
        Container(
          width: 320,
          child: TextFormField(
            controller: _passwordController,
            decoration: InputDecoration(
              labelText: 'Senha',
              labelStyle: Theme.of(context).textTheme.bodyMedium,
              hintText: 'Digite sua senha',
              hintStyle: TextStyle(fontSize: 14),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              suffixIcon: Icon(Icons.lock),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              filled: true,
              fillColor: ThemeColors.primaryColor,
            ),
            style: TextStyle(fontSize: 14, color: Colors.white),
            obscureText: true,
          ),
        ),
        SizedBox(height: 15),
        ElevatedButton(
          onPressed: _login,
          child: _isLoading
              ? CircularProgressIndicator(
                  color: Colors.white,
                )
              : Text(
                  'Logar',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
          style: ElevatedButton.styleFrom(
            backgroundColor: ThemeColors.primaryColor,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 100),
          ),
        ),
        if (_errorMessage != null)
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              _errorMessage!,
              style: TextStyle(color: Colors.red),
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
        SizedBox(height: 15),
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
        SizedBox(height: 15),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/cadastro-usuario');
          },
          child: Text(
            'Novo aqui? Registrar agora',
            style: TextStyle(fontSize: 14),
          ),
        ),
      ],
    );
  }
}
