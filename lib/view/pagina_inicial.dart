//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:diariodeviagens/controller/pais_controller.dart';
//import 'package:livrosmaisvendidos/view/detalheslivro.dart';

class PaginaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PaisesController()..carregarpaises(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink[100],
          title: Text(
            'Livros Mais Vendidos',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Consumer<PaisesController>(
          builder: (context, controller, child) {
            if (controller.estaCarregando) {
              return Center(child: CircularProgressIndicator());
            }

            if (controller.mensagemErro != null) {
              return Center(child: Text('Erro: ${controller.mensagemErro}'));
            }

            if (controller.paises == null || controller.paises!.isEmpty) {
              return Center(child: Text('Nenhum Pais encontrado.'));
            }
            

            return ListView.builder(
            
              //itemCount: controller.paises.length,
              itemBuilder: (context, index) {
                final pais = controller.paises![index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(pais.name),
                    subtitle: Text('pais: ${pais.name}'),
                    leading: Image.network(
                      pais.imagesUrl
                    ),
                    /*
                    tileColor: Colors.grey[100],                  
                    isThreeLine: true,
                    onTap: () {
                      
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                         builder: (context) => DetalhesLivroPage(livro: livro),
                        ),
                      );
                    },
                   */
                  ),

                );
              
              },
            );
            
          },
        ),
      ),
    );
  }
}