import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class ProdutoDTO {
  int id;
  String nome;
  double preco;
  int quantiadeEmEstoque;
  Uint8List? imagemBytes;
  CategoriaDTO categoriaDTO;

  ProdutoDTO({
    required this.id,
    required this.nome,
    required this.preco,
    required this.quantiadeEmEstoque,
    this.imagemBytes,
    required this.categoriaDTO,
  });

  factory ProdutoDTO.fromJson(Map<String, dynamic> json) {
    return ProdutoDTO(
      id: json['id'],
      nome: json['nome'],
      preco: json['preco'] != null ? json['preco'].toDouble() : 0.0,
      quantiadeEmEstoque: json['quantiadeEmEstoque'] ?? 0,
      imagemBytes: json['imagem'] != null ? base64Decode(json['imagem']) : null,
      categoriaDTO: CategoriaDTO.fromJson(json['categoriaDTO']),
    );
  }

  get imagemProduto => null;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'preco': preco,
      'quantidadeNoEstoque': quantiadeEmEstoque,
      'imagem': imagemBytes != null ? base64Encode(imagemBytes!) : null,
      'categoriaDTO': categoriaDTO.toJson(),
    };
  }
}

class CartProvider with ChangeNotifier {
  List<CartItem> _cartItems = [];
  int? _selectedIndex;

  List<CartItem> get cartItems => _cartItems;
  int? get selectedIndex => _selectedIndex;

  void addItem(CartItem item) {
    // Verificar se o produto já está no carrinho
    int index = _cartItems
        .indexWhere((cartItem) => cartItem.produto.id == item.produto.id);
    if (index >= 0) {
      // Atualizar a quantidade do produto existente
      _cartItems[index] = CartItem(
        produto: _cartItems[index].produto,
        quantidade: _cartItems[index].quantidade + item.quantidade,
      );
    } else {
      // Adicionar novo item ao carrinho
      _cartItems.add(item);
    }
    notifyListeners();
  }

  void updateItem(CartItem item) {
    // Verificar se o produto já está no carrinho
    int index = _cartItems
        .indexWhere((cartItem) => cartItem.produto.id == item.produto.id);
    if (index >= 0) {
      // Atualizar o item existente no carrinho
      _cartItems[index] = item;
    } else {
      // Caso o item não exista, adiciona o item ao carrinho
      _cartItems.add(item);
    }
    notifyListeners();
  }

  void setSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}

class CartItem {
  final ProdutoDTO produto;
  int quantidade; // Removido 'final'

  CartItem({
    required this.produto,
    required this.quantidade,
  });

  double get precoTotal => produto.preco * quantidade;

  String get nome => produto.nome;

  double get preco => produto.preco;

  int get id => produto.id; // Supondo que ProdutoDTO tem um campo 'id'
}

class CategoriaDTO {
  int id;
  String nome;

  CategoriaDTO({
    required this.id,
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
  String? _username; // Adicionando uma propriedade para o nome do usuário

  String? get role => _role;
  String? get token => _token;
  String? get username => _username; // Getter para o nome do usuário

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

  Future<void> login(BuildContext context, String username, String password,
      String string) async {
    final response = await http.post(
      Uri.parse('http://192.168.100.2:8080/auth/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': username, 'password': password}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final String role = data['role'];
      final String token = data['token'];

      // Armazene o token, o tipo de perfil e o nome de usuário no provider
      setRole(role);
      setToken(token);
      setUsername(username); // Armazenando o nome do usuário

      // Navegue para a tela apropriada
      if (role == 'ROOT') {
        Navigator.pushReplacementNamed(context, '/home');
      } else if (role == 'USER') {
        Navigator.pushReplacementNamed(context, '/bar');
      }
    } else {
      // Trate o erro de login
      print('Erro ao fazer login: ${response.statusCode}');
    }
  }
}
