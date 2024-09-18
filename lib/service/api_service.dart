import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:diariodeviagens/model/pais_model.dart';

class PaisesService {
 // final String _apiKey = 'mABAPDf9y6yf5VxJ5an2N4kq7HMJWS11';  
 // final String _apiBaseUrl = 'https://restcountries.com/v3.1/lang/portuguese';

  Future<List<Pais>> obterpaisesdelinguaportuguesa() async {
    final response = await http.get(Uri.parse('https:restcountries.com/v3.1/lang/portuguese'));


    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> paisesJson = data['results']['paises'];
      return paisesJson.map((json) => Pais.fromJson(json)).toList();
    } else {
      throw Exception('Falha ao carregar dados: ${response.reasonPhrase}');
    }
  }
}

/* class PaisesService {
  Future<List<Pais>> obterpaisesdelinguaportuguesa() async {
    final response = await http.get(Uri.parse('https://restcountries.com/v3.1/all'));
if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> paisesJson = data['results']['paises'];
      return paisesJson.map((json) => Pais.fromJson(json)).toList();
    } else {
      throw Exception('Falha ao carregar dados: ${response.reasonPhrase}');
    }
  }
}
*/