import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:meu_tcc/cliente_screens/carrinho_screen.dart';
import 'package:meu_tcc/cliente_screens/home_screen.dart';
import 'package:meu_tcc/componets_cliente/home_screen/bottom_navigator_bar.dart';
import 'package:meu_tcc/data/produtos.model.dart';
import 'package:meu_tcc/screens/adicionar_produto.dart';
import 'package:meu_tcc/screens/cadastro_de_clientes_screen.dart';
import 'package:meu_tcc/screens/cadastro_de_usuario.dart';
import 'package:meu_tcc/screens/categoria_screen.dart';
import 'package:meu_tcc/screens/controle_de_estoque.dart';
import 'package:meu_tcc/screens/detalhes_do_produtos.dart';
import 'package:meu_tcc/screens/home.dart';
import 'package:meu_tcc/screens/listagem_produtos.dart';
import 'package:meu_tcc/screens/tela_de_login.dart';
import 'package:meu_tcc/screens/vendas_screen.dart';
import 'package:meu_tcc/themes/my_themes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (context) => AuthProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu tcc',
      debugShowCheckedModeBanner: false,
      theme: MyTheme,
      routes: {
        '/login': (context) => TelaDeLogin(),
        '/home': (context) => Home(),
        '/lista-produtos': (context) => TodosProdutosScreen(),
        '/detalhes-produtos': (context) => DetalhesDoProdutos(
              produto: ModalRoute.of(context)!.settings.arguments as ProdutoDTO,
            ),
        '/adcionar-produtos': (context) => AdicionarProdutos(),
        '/estoque': (context) => ControleDeEstoque(),
        '/categoria': (context) => CategoriaScreen(),
        '/vendas': (context) => VendasScreen(),
        '/cadastro-clientes': (context) => CadastroDeClienteScreen(),
        '/home-cliente': (context) => HomeScreenCliente(),
        '/bar': (context) => CurvedBottomNavigationBar(),
        '/cadastro-usuario': (context) => CadastroDeUsuario(),
      },
      initialRoute: '/cadastro-usuario',
    );
  }
}

class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        'assets/loading.json',
        width: 150,
        height: 150,
        fit: BoxFit.contain,
      ),
    );
  }
}
