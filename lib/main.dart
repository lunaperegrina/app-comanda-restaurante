// @dart=2.9

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'app/controller/classes_e_funcoes.dart';
import 'app/view/ListOptions.dart';
import 'app/view/lista_comandas.dart';

Map<String, Map> mapComandasClientes = Map();

main() {
  runApp(AppWidget());
}

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: SwitchTema.instance,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              brightness: SwitchTema.instance.temaEscuro
                  ? Brightness.dark
                  : Brightness.light),
          initialRoute: "/ListaComandas",
          routes: {
            "/ListaComandas": (context) => ListaComandas(),
            "/ListOptions": (context) => ListOptions(),
            // "/NewPageArray": (context) => NewPageArray(),
          },
        );
      },
    );
  }
}
