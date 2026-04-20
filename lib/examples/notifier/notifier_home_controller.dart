import 'package:flutter/material.dart';

class NotifierHomeController extends ChangeNotifier {
  // Criando uma lista privada para armazenar os nomes
  final List<String> _names = [];

  // Método para adicionar um nome à lista e notificar quem estiver ouvindo
  List<String> get names => _names;

  void addName({required String name}) {
    _names.add(name);

    // Notifica os ouvintes que a lista foi atualizada
    notifyListeners();
  }
}
