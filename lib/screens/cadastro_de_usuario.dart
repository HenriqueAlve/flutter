import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:lottie/lottie.dart';
import 'package:meu_tcc/data/produtos.model.dart';
import 'package:provider/provider.dart';

class CadastroDeUsuario extends StatefulWidget {
  const CadastroDeUsuario({super.key});

  @override
  _CadastroDeUsuarioState createState() => _CadastroDeUsuarioState();
}

class _CadastroDeUsuarioState extends State<CadastroDeUsuario> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _telefoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _cadastrar() async {
    if (_formKey.currentState?.validate() ?? false) {
      final response = await http.post(
        Uri.parse('http://192.168.100.2:8080/auth/registerUser'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': _usernameController.text,
          'nome': _nomeController.text,
          'cpf': _cpfController.text,
          'telefone': _telefoneController.text,
          'password': _passwordController.text,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        // Acessa o AuthProvider e configura o estado após o cadastro
        final authProvider = Provider.of<AuthProvider>(context, listen: false);
        authProvider
            .setRole(data['role']); // Assumindo que a resposta inclui a role
        authProvider
            .setToken(data['token']); // Assumindo que a resposta inclui o token
        authProvider.setUsername(_usernameController.text);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Cadastro realizado com sucesso!')),
        );

        Navigator.pushReplacementNamed(context, '/login');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content:
                Text('Falha ao realizar o cadastro: ${response.statusCode}'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Center(
                  child: Container(
                    width: 300,
                    height: 350,
                    child: Lottie.asset('assets/cadastro.json'),
                  ),
                ),
                Text(
                  'Cadastro',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                SizedBox(height: 15),
                _buildTextFormField(
                  controller: _usernameController,
                  hintText: 'E-mail',
                ),
                SizedBox(height: 15),
                _buildTextFormField(
                  controller: _nomeController,
                  hintText: 'Nome',
                ),
                SizedBox(height: 15),
                _buildTextFormField(
                  controller: _cpfController,
                  hintText: 'CPF',
                ),
                SizedBox(height: 15),
                _buildTextFormField(
                  controller: _telefoneController,
                  hintText: 'Telefone',
                ),
                SizedBox(height: 15),
                _buildTextFormField(
                  controller: _passwordController,
                  hintText: 'Senha',
                  obscureText: true,
                ),
                SizedBox(height: 35),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                  ),
                  onPressed: _cadastrar,
                  child: Text(
                    'Cadastrar',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField({
    required TextEditingController controller,
    required String hintText,
    bool obscureText = false,
  }) {
    return SizedBox(
      height: 50,
      width: 340,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        style: TextStyle(color: Colors.white, fontSize: 15),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 15, color: Colors.white54),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Este campo é obrigatório';
          }
          return null;
        },
      ),
    );
  }
}
