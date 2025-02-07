import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class ProdutoDTO {
  final int id;
  final String nome;
  final double preco;
  final int quantidadeNoEstoque;
  final Uint8List? imagemBytes;
  final CategoriaDTO categoriaDTO;

  ProdutoDTO({
    required this.id,
    required this.nome,
    required this.preco,
    required this.quantidadeNoEstoque,
    this.imagemBytes,
    required this.categoriaDTO,
  });

  factory ProdutoDTO.fromJson(Map<String, dynamic> json) {
    return ProdutoDTO(
      id: json['id'],
      nome: json['nome'],
      preco: json['preco'] != null ? json['preco'].toDouble() : 0.0,
      quantidadeNoEstoque: json['quantiadeEmEstoque'] ?? 0,
      imagemBytes: json['imagem'] != null ? base64Decode(json['imagem']) : null,
      categoriaDTO: CategoriaDTO.fromJson(json['categoriaDTO'] ??
          {}), // Valor padrão para 'categoriaDTO' se for null
    );
  }

  Object? toJson() {}
}

class CategoriaDTO {
  int? id;
  String nome;

  CategoriaDTO({
    this.id,
    required this.nome,
  });

  factory CategoriaDTO.fromJson(Map<String, dynamic> json) {
    return CategoriaDTO(
      id: json['id'],
      nome: json['nome'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
    };
  }
}

class LoginResponse {
  final String token;

  LoginResponse({required this.token});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      token: json['token'],
    );
  }
}

class AuthProvider with ChangeNotifier {
  String? _role;
  String? _token;
  String? _username;
  String? _nome;
  String? _cpf;
  String? _telefone;

  String? get role => _role;
  String? get token => _token;
  String? get username => _username;
  String? get nome => _nome;
  String? get cpf => _cpf;
  String? get telefone => _telefone;

  void setRole(String role) {
    _role = role;
    notifyListeners();
  }

  void setToken(String token) {
    _token = token;
    notifyListeners();
  }

  void setUsername(String username) {
    _username = username;
    notifyListeners();
  }

  void setNome(String nome) {
    _nome = nome;
    notifyListeners();
  }

  void setCpf(String cpf) {
    _cpf = cpf;
    notifyListeners();
  }

  void setTelefone(String telefone) {
    _telefone = telefone;
    notifyListeners();
  }

  Future<void> login(BuildContext context, String username, String password,
      String string) async {
    final response = await http.post(
      Uri.parse('http://192.168.100.2:8080/auth/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': username, 'password': password}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      final String role = data['role'] ?? 'Desconhecido';
      final String token = data['token'] ?? '';
      final String nome = data['nome'] ?? 'Desconhecido';
      final String cpf = data['cpf'] ?? 'Desconhecido';
      final String telefone = data['telefone'] ?? 'Desconhecido';

      setRole(role);
      setToken(token);
      setUsername(username);
      setNome(nome);
      setCpf(cpf);
      setTelefone(telefone);

      if (role == 'ROOT') {
        Navigator.pushReplacementNamed(context, '/home');
      } else if (role == 'USER') {
        Navigator.pushReplacementNamed(context, '/bar');
      }
    } else {
      print('Erro ao fazer login: ${response.statusCode}');
    }
  }
}

class CartProvider with ChangeNotifier {
  List<CartItem> _cartItems = [];
  List<ProdutoDTO> _produtosFavoritados = [];
  int? _selectedIndex;

  List<CartItem> get cartItems => _cartItems;
  List<ProdutoDTO> get produtosFavoritados => _produtosFavoritados;
  int? get selectedIndex => _selectedIndex;

  void addItem(CartItem item) {
    int index = _cartItems
        .indexWhere((cartItem) => cartItem.produto.id == item.produto.id);
    if (index >= 0) {
      _cartItems[index] = CartItem(
        produto: _cartItems[index].produto,
        quantidade: _cartItems[index].quantidade + item.quantidade,
      );
    } else {
      _cartItems.add(item);
    }
    notifyListeners();
  }

  void updateItem(CartItem item) {
    int index = _cartItems
        .indexWhere((cartItem) => cartItem.produto.id == item.produto.id);
    if (index >= 0) {
      _cartItems[index] = item;
    } else {
      _cartItems.add(item);
    }
    notifyListeners();
  }

  void removeItem(CartItem item) {
    _cartItems
        .removeWhere((cartItem) => cartItem.produto.id == item.produto.id);
    notifyListeners();
  }

  void setSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  void addToFavorites(ProdutoDTO produto) {
    if (!_produtosFavoritados.contains(produto)) {
      _produtosFavoritados.add(produto);
      notifyListeners();
    }
  }

  void removeFromFavorites(ProdutoDTO produto) {
    if (_produtosFavoritados.contains(produto)) {
      _produtosFavoritados.remove(produto);
      notifyListeners();
    }
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}

class CartItem {
  final ProdutoDTO produto;
  int quantidade;

  CartItem({
    required this.produto,
    required this.quantidade,
  });

  double get precoTotal => produto.preco * quantidade;

  String get nome => produto.nome;

  double get preco => produto.preco;

  int? get id => produto.id;
}

class Pedido {
  final String id;
  final DateTime data;
  final List<ProdutoDTO> itens;
  final String status;

  Pedido({
    required this.id,
    required this.data,
    required this.itens,
    required this.status,
  });
}

class PedidoProvider with ChangeNotifier {
  List<Pedido> _pedidos = [];

  List<Pedido> get pedidos => _pedidos;

  void adicionarPedido(Pedido pedido) {
    _pedidos.add(pedido);
    notifyListeners();
  }
}
