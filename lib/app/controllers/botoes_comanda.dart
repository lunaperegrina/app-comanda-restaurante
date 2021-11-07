import 'package:hello_world/app/controllers/valores_estaticos.dart';

appBarComanda1() {
  mapBebidasExportadas.clear();
  testeNomeCLiente = "Beltrano";
}

appBarComanda2() {
  mapComandasClientes["$testeNomeCLiente"] = mapBebidasExportadas;
}
