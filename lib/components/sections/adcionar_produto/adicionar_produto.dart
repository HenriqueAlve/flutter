import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'package:meu_tcc/components/cards.dart';
import 'package:meu_tcc/data/produtos.model.dart';
import 'package:meu_tcc/data/services.dart';
import 'package:meu_tcc/themes/themes_colors.dart';

class HeaderAdicionarProduto extends StatefulWidget {
  const HeaderAdicionarProduto({Key? key}) : super(key: key);

  @override
  _HeaderAdicionarProdutoState createState() => _HeaderAdicionarProdutoState();
}

class _HeaderAdicionarProdutoState extends State<HeaderAdicionarProduto> {
  File? _image;
  CategoriaDTO? _categoriaSelecionada;
  late Future<List<CategoriaDTO>> _categoriasFuture;

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _precoController = TextEditingController();
  final TextEditingController _quantidadeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _categoriasFuture = CategoriaService().buscarCategorias();
  }

  Future<void> selecionarImagem() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? imagemSelecionada =
        await _picker.pickImage(source: ImageSource.gallery);

    if (imagemSelecionada != null) {
      setState(() {
        _image = File(imagemSelecionada.path);
      });
    }
  }

  Future<void> cadastrarProduto() async {
    try {
      if (_categoriaSelecionada == null) {
        throw Exception('Selecione uma categoria para o produto.');
      }

      Uint8List? imagemBytes;
      if (_image != null) {
        imagemBytes = await _image!.readAsBytes();
      }

      ProdutoDTO produto = ProdutoDTO(
        id: 0,
        nome: _nomeController.text,
        preco: double.parse(_precoController.text),
        quantidadeNoEstoque: int.parse(_quantidadeController.text),
        imagemBytes: imagemBytes,
        categoriaDTO: _categoriaSelecionada!,
      );

      print('Categoria selecionada: ${_categoriaSelecionada?.nome}');
      await cadastrarProdutos(produto);

      print('Produto cadastrado com sucesso!');
      Navigator.of(context).pushNamed('/lista-produtos');
    } catch (e) {
      print('Falha ao cadastrar produto: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Falha ao cadastrar produto: $e')),
      );
    }
  }

  Future<void> cadastrarProdutos(ProdutoDTO produto) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('authToken');

    final headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };

    final body = jsonEncode(produto.toJson());

    final response = await http.post(
      Uri.parse('http://192.168.100.2:8080/api/produtos/cadastrar'),
      headers: headers,
      body: body,
    );

    if (response.statusCode == 201) {
      // Sucesso
      print('Produto cadastrado com sucesso!');
    } else {
      // Erro
      print('Falha ao cadastrar produto: ${response.statusCode}');
      print('Resposta: ${response.body}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 20),
          Center(
            child: GestureDetector(
              onTap: selecionarImagem,
              child: Container(
                width: 350,
                height: 250,
                child: Cards(
                  boxContent: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: _image != null
                        ? Image.file(
                            _image!,
                            width: 350,
                            height: 250,
                            fit: BoxFit.cover,
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.camera_alt,
                                  size: 50, color: Colors.green),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                  'Adicione sua imagem',
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                            ],
                          ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(right: 250.0),
            child: Text(
              'Nome',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 5),
            child: Container(
              height: 50,
              child: TextFormField(
                controller: _nomeController,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.normal),
                decoration: InputDecoration(
                  fillColor: Color.fromRGBO(16, 20, 15, 1),
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 250.0),
            child: Text(
              'Preço',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 5),
            child: Container(
              height: 50,
              child: TextFormField(
                controller: _precoController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                style: TextStyle(color: Colors.white, fontSize: 14),
                decoration: InputDecoration(
                  fillColor: Color.fromRGBO(16, 20, 15, 1),
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 125.0),
            child: Text(
              'Quantidade em estoque',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 5),
            child: Container(
              height: 50,
              child: TextFormField(
                controller: _quantidadeController,
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.white, fontSize: 14),
                decoration: InputDecoration(
                  fillColor: Color.fromRGBO(16, 20, 15, 1),
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 65.0),
            child: Text(
              'Selecione a categoria do produto',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
            ),
          ),
          Container(
            height: 68,
            child: FutureBuilder<List<CategoriaDTO>>(
              future: _categoriasFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Erro ao carregar categorias');
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Text('Nenhuma categoria disponível');
                } else {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 35, vertical: 5),
                    child: DropdownButtonFormField<CategoriaDTO>(
                      value: _categoriaSelecionada,
                      items: snapshot.data!.map((CategoriaDTO categoria) {
                        return DropdownMenuItem<CategoriaDTO>(
                          value: categoria,
                          child: Text(categoria.nome,
                              style: TextStyle(color: Colors.white)),
                        );
                      }).toList(),
                      onChanged: (CategoriaDTO? novaCategoria) {
                        setState(() {
                          _categoriaSelecionada = novaCategoria!;
                        });
                        print(
                            'Categoria selecionada: ${_categoriaSelecionada?.nome}');
                      },
                      decoration: InputDecoration(
                        fillColor: Color.fromRGBO(16, 20, 15, 1),
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      dropdownColor: Color.fromRGBO(16, 20, 15, 1),
                    ),
                  );
                }
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              cadastrarProduto();
            },
            child: Text(
              'Salvar',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: ThemeColors.primaryColor,
              padding: EdgeInsets.symmetric(vertical: 1, horizontal: 40),
            ),
          ),
        ],
      ),
    );
  }
}
