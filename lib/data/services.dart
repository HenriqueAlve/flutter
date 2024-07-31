import 'package:meu_tcc/data/produtos.model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class ProdutoService {
  Future<List<ProdutoDTO>> buscarProdutos() async {
    // Recupera o token de autenticação do SharedPreferences
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('authToken');

    // Configura os headers com o token de autenticação
    final headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };

    final response = await http.get(
      Uri.parse('http://192.168.100.2:8080/api/produtos/listar'),
      headers: headers,
    );

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
  // Recupera o token de autenticação do SharedPreferences ou do AuthProvider
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? token = prefs.getString('authToken');

  // Configura os headers com o token de autenticação
  final headers = {
    'Authorization': 'Bearer $token',
    'Content-Type': 'application/json',
  };

  final response = await http.get(
    Uri.parse('http://192.168.100.2:8080/api/produtos/listar'),
    headers: headers,
  );

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
  // Recupera o token de autenticação do SharedPreferences
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? token = prefs.getString('authToken');

  // Configura os headers com o token de autenticação
  final headers = {
    'Authorization': 'Bearer $token',
    'Content-Type': 'application/json',
  };

  final response = await http.get(
    Uri.parse('http://192.168.100.2:8080/api/categoria/listar'),
    headers: headers,
  );

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

Future<void> registrarVenda(int produtoId, int quantidade) async {
  final url =
      'http://192.168.100.2:8080/api/vendas/vender/$produtoId/$quantidade';

  try {
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      print('Venda registrada com sucesso.');
    } else {
      print('Erro ao registrar venda: ${response.body}');
    }
  } catch (e) {
    print('Exceção ao registrar venda: $e');
  }
}
