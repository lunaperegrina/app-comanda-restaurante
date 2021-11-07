// @dart=2.9

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hello_world/app/controllers/valores_estaticos.dart';
import 'package:hello_world/app/controllers/botoes_comanda.dart';

class NovaListaComandas extends StatefulWidget {
  @override
  _NovaListaComandasState createState() => _NovaListaComandasState();
}

class _NovaListaComandasState extends State<NovaListaComandas> {
  TextEditingController addTarefa = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Lista de Comandas"),
          actions: [
            GestureDetector(
              onTap: () {
                print("oioioioi");

                appBarComanda1();
                Navigator.pushNamed(context, "/ListOptions");
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Icon(Icons.bungalow_outlined),
              ),
            ),
            GestureDetector(
              onTap: () {
                appBarComanda2();

                return showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("$mapComandasClientes"),
                    );
                  },
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Icon(Icons.bug_report),
              ),
            )
          ],
        ),
        body: Column(
          children: [
            ListView.builder(
              itemCount: mapComandasClientes.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ExpansionTile(
                      title: Text("${mapComandasClientes[index]}"),
                      children: [
                        ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemCount: mapComandasClientes.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Text(
                                  "${mapComandasClientes[index].toString()}");
                            })
                      ],
                    ),
                  ],
                );
              },
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          label: Text("Adicionar Comanda"),
          icon: Icon(Icons.note_add),
          elevation: 10,
          onPressed: () {
            setState(() {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    actions: [
                      TextField(
                        controller: addTarefa,
                        decoration: InputDecoration(
                            labelText: "Digite o nome da comanda"),
                        onChanged: (value) {},
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("Cancelar")),
                          TextButton(
                              onPressed: () {
                                print(addTarefa.text);

                                setState(() {
                                  if (addTarefa.text != "") {
                                    mapComandas[qtdComandas] = addTarefa.text;
                                    qtdComandas++;
                                  }
                                  addTarefa.clear();
                                });
                                Navigator.pop(context);
                                print(qtdComandas);
                                print(mapComandas);
                              },
                              child: Text("Adicionar")),
                        ],
                      )
                    ],
                  );
                },
              );
            });
          },
        ));
  }
}
