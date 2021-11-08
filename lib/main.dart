// @dart=2.9

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'app/view/ListaComandas.dart';
import 'app/view/ListaNotas.dart';
import 'ListOptions.dart';
import 'newPageArray.dart';
import 'switch_tema.dart';

Map<String, Map> mapComandasClientes = Map();

var aplicarTemaEscuto = ThemeData.light();
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
            "/NovaListaNotas": (context) => NovaListaNotas(),
            "/NovaListaComandas": (context) => NovaListaComandas(),
            "/ListaComandas": (context) => ListaComandas(),
            "/ListOptions": (context) => ListOptions(),
            // "/NewPageArray": (context) => NewPageArray()
          },
        );
      },
    );
  }
}

class ListaComandas extends StatefulWidget {
  @override
  _ListaComandasState createState() => _ListaComandasState();
}

class _ListaComandasState extends State<ListaComandas> {
  TextEditingController addTarefa = TextEditingController();

  Map<int, dynamic> mapComandas = Map();
  int qtdComandas = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Lista de Comandas"),
          actions: [
            Switch(
              value: SwitchTema.instance.temaEscuro,
              onChanged: (value) {
                SwitchTema.instance.changeTheme();
              },
            ),
            IconButton(
              icon: Icon(Icons.bungalow_outlined),
              onPressed: () {
                // mapBebidasExportadas.clear();

                Navigator.pushNamed(context, "/ListOptions");
              },
            ),
            IconButton(
              icon: Icon(Icons.bug_report),
              onPressed: () {
                return showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("$mapComandasClientes"),
                    );
                  },
                );
              },
            ),
          ],
        ),
        body: Container(
          child: Column(
            children: [
              Expanded(
                  child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: mapComandas.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    NewPageArray(mapComandas[index].toString()),
                              ));
                          print("object");
                        },
                        title: Text(
                          "${mapComandas[index].toString()}",
                          style: TextStyle(fontSize: 20),
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text(
                                    "Quer deletar a nota de ${mapComandas[index].toString()}?",
                                  ),
                                  actions: [
                                    ElevatedButton(
                                      style: ButtonStyle(),
                                      onPressed: () {},
                                      child: Text(
                                        "DELETAR",
                                        style: TextStyle(),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          icon: Icon(Icons.delete),
                        ),
                      ),
                    ],
                  );
                },
              )),
            ],
          ),
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
                        keyboardType: TextInputType.text,
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
