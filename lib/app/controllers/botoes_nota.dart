import 'package:hello_world/app/controllers/valores_estaticos.dart';

botaoDiminuir(index) {
  if (listaQuantidadeColetada[index] >= 1) {
    listaQuantidadeColetada[index]--;
    valorTotalPedidos = valorTotalPedidos - listaPrecosBebidas[index];
  }
  return valorTotalPedidos;
}

botaoSomar(index) {
  listaQuantidadeColetada[index]++;

  valorTotalPedidos = valorTotalPedidos + listaPrecosBebidas[index];
  return valorTotalPedidos;
}

exportandoBebidas() {
  for (var i = 0; i < listaNomeBebidas.length; i++) {
    mapExportandoBebidas[listaNomeBebidas[i]] = listaQuantidadeColetada[i];
  }

  for (var index in mapExportandoBebidas.values) {
    if (index == 0) {
      print("print for in ${mapExportandoBebidas[index]}");
      mapExportandoBebidas.remove(index);
    }
  }
  return mapExportandoBebidas;
}

finalizandoNota() {
  listaQuantidadeColetada = [0, 0, 0, 0, 0, 0, 0, 0];
  valorTotalPedidos = 0;

  mapBebidasExportadas[quantidadePedidos] = mapExportandoBebidas;
  quantidadePedidos++;
  print(quantidadePedidos);
}
