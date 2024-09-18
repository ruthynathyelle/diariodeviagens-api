import 'package:diariodeviagens/service/firebase_service.dart';
import 'package:diariodeviagens/view/cadastro_page.dart';
import 'package:diariodeviagens/view/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:diariodeviagens/view/pagina_inicial.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseService.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Paises de lingua portugesa para visitar',
      theme: ThemeData(
      
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink.shade100),
        useMaterial3: true,
      ),
      initialRoute: '/login', 

      routes: {
      '/home': (context) => PaginaInicial(),
      '/login': (context) =>  LoginPage(),
      '/register': (context) => RegisterPage(), 
      },
    );
  }
}