import 'dart:convert';
import 'dart:typed_data';

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
