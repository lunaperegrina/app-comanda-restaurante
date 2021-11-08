import 'package:flutter/cupertino.dart';

class SwitchTema extends ChangeNotifier {
  bool temaEscuro = false;

  static SwitchTema instance = SwitchTema();

  changeTheme() {
    temaEscuro = !temaEscuro;
    notifyListeners();
  }
}
