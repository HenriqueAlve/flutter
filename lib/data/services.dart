import 'package:meu_tcc/data/produtos.model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProdutoService {
  Future<List<ProdutoDTO>> buscarProdutos() async {
    final response = await http
        .get(Uri.parse('http://192.168.100.2:8080/api/produtos/listar'));

    if (response.statusCode == 200) {
      final List<dynamic> responseMap = jsonDecode(response.body);
      return responseMap
          .map<ProdutoDTO>((json) => ProdutoDTO.fromJson(json))
          .toList();
    } else {
      throw Exception('Falha ao carregar produtos: ${response.statusCode}');
    }
  }
}

Future<List<ProdutoDTO>> buscarProdutos() async {
  final response = await http
      .get(Uri.parse('http://192.168.100.2:8080/api/produtos/listar'));

  if (response.statusCode == 200) {
    final List<dynamic> responseMap = jsonDecode(response.body);
    return responseMap
        .map<ProdutoDTO>((json) => ProdutoDTO.fromJson(json))
        .toList();
  } else {
    throw Exception('Falha ao carregar produtos: ${response.statusCode}');
  }
}

Future<List<CategoriaDTO>> buscarCategorias() async {
  final response = await http
      .get(Uri.parse('http://192.168.100.2:8080/api/categoria/listar'));

  if (response.statusCode == 200) {
    final List<dynamic> responseMap = jsonDecode(response.body);
    return responseMap
        .map<CategoriaDTO>((json) => CategoriaDTO.fromJson(json))
        .toList();
  } else {
    throw Exception('Falha ao carregar categoria: ${response.statusCode}');
  }
}

Future<void> excluirProduto(int id) async {
  final response = await http
      .delete(Uri.parse('http://192.168.100.2:8080/api/produtos/deletar/$id'));

  if (response.statusCode != 204) {
    throw Exception('Falha ao excluir produto: ${response.statusCode}');
  }
}

Future<void> adicionarProduto(ProdutoDTO produto) async {
  final response = await http.post(
    Uri.parse('http://192.168.100.2:8080/api/produtos/cadastrar'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(produto.toJson()),
  );

  if (response.statusCode != 201) {
    throw Exception('Falha ao adicionar produto: ${response.statusCode}');
  }
}

Future<void> atualizarProduto(ProdutoDTO produto) async {
  final response = await http.put(
    Uri.parse('http://192.168.100.2:8080/api/produtos/atualizar/${produto.id}'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(produto.toJson()),
  );

  if (response.statusCode != 200) {
    throw Exception('Falha ao atualizar produto: ${response.statusCode}');
  }
}

class VendaService {
  static const String baseUrl =
      'http://192.168.100.2:8080/api/vendas'; // Atualize com a URL do seu backend

  Future<double> getTotalVendas() async {
    final response = await http.get(Uri.parse('$baseUrl/total-vendas'));
    if (response.statusCode == 200) {
      return double.parse(response.body);
    } else {
      throw Exception('Failed to load total vendas');
    }
  }

  Future<int> getTotalPedidos() async {
    final response = await http.get(Uri.parse('$baseUrl/total-pedidos'));
    if (response.statusCode == 200) {
      return int.parse(response.body);
    } else {
      throw Exception('Failed to load total pedidos');
    }
  }
}
