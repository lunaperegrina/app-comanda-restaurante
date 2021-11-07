import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/main.dart';

Map<String, int> mapExportandoBebidas = Map();
Map<int, Map> mapBebidasExportadas = Map();

int qtdDeVezesQuePediu =
    0; //Numero de pedidos do cliente pra manter a organização

List listaNomeBebidas = [
  //Editar essa lista pra adicionar ou tirar bebidas
  "Agua sem gás",
  "Agua com gás",
  "Coca-Cola",
  "Coca-Cola Zero",
  "Guaraná",
  "Guaraná Zero",
  "Heineken",
  "Bohemia",
];
List<double> listaPrecosBebidas = [
  //Editar preços das bebidas. Precisa ter a mesma quantidade q a anterior
  2.5,
  3.5,
  5.00,
  5.00,
  5.00,
  5.00,
  9.00,
  7.00
];
List<int> listaQuantidadeColetada = [
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0
]; // PRECISA ter a MESMA quantidade de itens q os outros (cria uma função pra deixar isso automatico pfv q sofrimento)

double mostrarValorFinalizar = 0; // visualização de valor em "Finalizar"

class ListOptions extends StatefulWidget {
  @override
  _ListOptionsState createState() => _ListOptionsState();
}

class _ListOptionsState extends State<ListOptions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bebidas"),
      ),
      body: Container(
        child: Row(
          children: [
            Expanded(
                flex: 4,
                child: ListView.builder(
                  //Bebidas, preços, botoes visualização de quantidade
                  itemCount: listaNomeBebidas.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.only(left: 20, right: 15, top: 5),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: Text(
                                  listaNomeBebidas[
                                      index], //Nome das bebidas definidos aqui
                                  style: TextStyle(fontSize: 16))),
                          Expanded(
                            flex: 2,
                            child: Container(
                              child: Text(
                                  "${listaPrecosBebidas[index].toString()}0 R\$", //Preços das bebidas mostrados aqui
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 18, color: Color(0xFF00AAFF))),
                            ),
                          ),
                          Expanded(
                            child: ElevatedButton(
                              //Botão para subtrair a quantidade de
                              onLongPress: () {
                                setState(() {
                                  mostrarValorFinalizar -=
                                      listaQuantidadeColetada[index] *
                                          listaPrecosBebidas[index];

                                  if (listaQuantidadeColetada[index] >= 1) {
                                    listaQuantidadeColetada[index] = 0;

                                    mostrarValorFinalizar -=
                                        listaQuantidadeColetada[index] *
                                            listaPrecosBebidas[index];

                                    print(listaQuantidadeColetada[index]);
                                  }
                                });
                              },
                              onPressed: () {
                                setState(() {
                                  if (listaQuantidadeColetada[index] >= 1) {
                                    listaQuantidadeColetada[index]--;
                                    mostrarValorFinalizar =
                                        mostrarValorFinalizar -
                                            listaPrecosBebidas[index];
                                  }
                                });
                              },
                              child: Text("-", style: TextStyle(fontSize: 18)),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              child: Text(
                                  listaQuantidadeColetada[index].toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 18, color: Color(0xFF00AAFF))),
                            ),
                          ),
                          Expanded(
                            child: ElevatedButton(
                              onLongPress: () {
                                setState(() {
                                  listaQuantidadeColetada[index] += 5;
                                  mostrarValorFinalizar =
                                      (mostrarValorFinalizar) +
                                          (5 * listaPrecosBebidas[index]);
                                });
                              },
                              onPressed: () {
                                setState(() {
                                  listaQuantidadeColetada[index]++;

                                  mostrarValorFinalizar =
                                      mostrarValorFinalizar +
                                          listaPrecosBebidas[index];
                                  print("ANTES:  $mapBebidasExportadas");
                                });
                              },
                              child: Text("+", style: TextStyle(fontSize: 18)),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                )),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
          label: Text("Finalizar ${mostrarValorFinalizar}0 R\$",
              style: TextStyle(fontSize: 16)),
          icon: Icon(Icons.checklist),
          onPressed: () {
            if (mostrarValorFinalizar > 0) {
              for (var i = 0; i < listaNomeBebidas.length; i++) {
                mapExportandoBebidas[listaNomeBebidas[i]] =
                    listaQuantidadeColetada[i];
              }
              print("ANTES:  $mapBebidasExportadas");
              setState(() {
                print("ANTES:  $mapBebidasExportadas");
                print(qtdDeVezesQuePediu);
                mapBebidasExportadas[qtdDeVezesQuePediu] = mapExportandoBebidas;
                // print(mapExportandoBebidas);

                print("DEPOIS:  $mapBebidasExportadas");
                // print(mapBebidasExportadas[qtdDeVezesQuePediu]);
                qtdDeVezesQuePediu++;
                print(qtdDeVezesQuePediu);

                listaQuantidadeColetada = [0, 0, 0, 0, 0, 0, 0, 0];
                mostrarValorFinalizar = 0;
                Navigator.pop(context);
              });
            }
          }),
    );
  }
}
