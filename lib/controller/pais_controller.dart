import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:diariodeviagens/model/pais_model.dart';
import 'package:diariodeviagens/service/api_service.dart';

class PaisesController extends ChangeNotifier {
  final PaisesService _paisesService = PaisesService();
  List<Pais>? _paises;
  String? _mensagemErro;
  bool _estaCarregando = false;

  List<Pais>? get paises => _paises;
  String? get mensagemErro => _mensagemErro;
  bool get estaCarregando => _estaCarregando;

  Future<void> carregarpaises() async {
    _estaCarregando = true;
    notifyListeners();

    try {
      _paises = await _paisesService.obterpaisesdelinguaportuguesa();
      _mensagemErro = null;
    } catch (e) {
      _mensagemErro = 'Erro: $e';
      _paises = null;
    } finally {
      _estaCarregando = false;
      notifyListeners();
    }
  }
}