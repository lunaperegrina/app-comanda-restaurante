import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import '/app/controller/valores_constantes.dart';

/* ----------- TROCAR ENTRE TEMA CLARO E ESCURO ------------- */

class SwitchTema extends ChangeNotifier {
  bool temaEscuro = false;

  static SwitchTema instance = SwitchTema();

  changeTheme() {
    temaEscuro = !temaEscuro;
    notifyListeners();
  }
}

/* ----------- ATUALIZAR VALOR DO MAP DAS NOTAS ------------- */

class AtualizarNotas extends ChangeNotifier {
  static AtualizarNotas instance = AtualizarNotas();

  Map<int, Map> test_export_bebidas = {};

  atualizarNota() {
    Map<String, int> mapExportandoBebidas = Map();
    for (var i = 0; i < listaNomeBebidas.length; i++) {
      mapExportandoBebidas[listaNomeBebidas[i]] = listaQuantidadeColetada[i];
    }

    test_export_bebidas[qtdDeVezesQuePediu] = mapExportandoBebidas;
    listaQuantidadeColetada.clear();
    for (var i = 0; i <= listaNomeBebidas.length; i++) {
      listaQuantidadeColetada.add(0);
    }
    notifyListeners();
  }
}

/* -------------- ONPRESSED DO BOTÃO SUBTRAIR --------------- */

onPressedSubstrair(index) {
  if (listaQuantidadeColetada[index] >= 1) {
    listaQuantidadeColetada[index]--;
    mostrarValorFinalizar = mostrarValorFinalizar - listaPrecosBebidas[index];
  }
}

/* ------------ ONLONGPRESSED DO BOTÃO SUBTRAIR ------------- */

onLongPressSubtrair(index) {
  mostrarValorFinalizar -=
      listaQuantidadeColetada[index] * listaPrecosBebidas[index];

  if (listaQuantidadeColetada[index] >= 1) {
    listaQuantidadeColetada[index] = 0;

    mostrarValorFinalizar -=
        listaQuantidadeColetada[index] * listaPrecosBebidas[index];
  }
}

/* ------------- ONPRESSED DO BOTÃO ADICIONAR --------------- */

onPressedAdicionar(index) {
  listaQuantidadeColetada[index] += 5;
  mostrarValorFinalizar =
      (mostrarValorFinalizar) + (5 * listaPrecosBebidas[index]);
}

/* ----------- ONLONGPRESSED DO BOTÃO ADICIONAR ------------- */

onLongPressAdicionar(index) {
  listaQuantidadeColetada[index]++;

  mostrarValorFinalizar = mostrarValorFinalizar + listaPrecosBebidas[index];
}

/* ----- TRATAR MAP PARA VISUALIZAÇÃO EM NEWPAGEARRAY ------- */

tratarMapParaVisualizacao(index) {
  print(index);
  List<String> tratarDadosNotasPop = [];
  String exibirListaNewPageArray = "";

  AtualizarNotas.instance.test_export_bebidas[index]!.forEach((key, value) {
    if (value > 0) {
      tratarDadosNotasPop.add("$value  $key \n");
    }
  });

  exibirListaNewPageArray = tratarDadosNotasPop.toString();

  exibirListaNewPageArray = exibirListaNewPageArray.replaceAll("[", " ");
  exibirListaNewPageArray = exibirListaNewPageArray.replaceAll("]", "");
  exibirListaNewPageArray = exibirListaNewPageArray.trimRight();

  exibirListaNewPageArray = exibirListaNewPageArray.replaceAll(",", "");

  return exibirListaNewPageArray;
}

/* ----- TRATAR MAP PARA VISUALIZAÇÃO EM NEWPAGEARRAY ------- */