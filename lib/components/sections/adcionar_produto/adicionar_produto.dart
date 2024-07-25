import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:meu_tcc/components/cards.dart';
import 'package:meu_tcc/data/produtos.model.dart'; // Importe o modelo de ProdutoDTO
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

  TextEditingController _nomeController = TextEditingController();
  TextEditingController _precoController = TextEditingController();
  TextEditingController _quantidadeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _categoriasFuture = buscarCategorias();
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

      String? imagemBase64;
      if (_image != null) {
        List<int> imageBytes = await _image!.readAsBytes();
        imagemBase64 = base64Encode(imageBytes);
      }

      ProdutoDTO produto = ProdutoDTO(
        id: 0, // Pode ser 0 ou qualquer valor, pois será atribuído pelo backend
        nome: _nomeController.text,
        preco: double.parse(_precoController.text),
        quantiadeEmEstoque: int.parse(_quantidadeController.text),
        imagemBytes: _image != null ? await _image!.readAsBytes() : null,
        categoriaDTO: _categoriaSelecionada!,
      );

      print(produto.toJson());
      final response = await http.post(
        Uri.parse('http://192.168.100.2:8080/api/produtos/cadastrar'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'nome': produto.nome,
          'preco': produto.preco,
          'quantidadeEmEstoque': produto
              .quantiadeEmEstoque, // Verifique se é 'quantidadeEmEstoque' ou 'quantidadeNoEstoque'
          'imagem': imagemBase64, // Deve ser null se _image for null
          'categoria': {
            'id': produto.categoriaDTO.id,
            // Inclua outros campos da categoria, se necessário
          },
        }),
      );

      if (response.statusCode == 201) {
        // Produto cadastrado com sucesso
        print('Produto cadastrado com sucesso!');
        Navigator.of(context).pushNamed('/lista-produtos');
      } else {
        // Algo deu errado ao cadastrar o produto
        throw Exception(
            'Falha ao cadastrar produto: ${response.statusCode} ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Falha ao cadastrar produto: $e');
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
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
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
