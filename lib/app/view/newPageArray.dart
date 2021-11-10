import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../controller/classes_e_funcoes.dart';

Map<int, Map> mapVisualizandoNotas = Map();

class NewPageArray extends StatefulWidget {
  String nomeUnicoCliente = "";
  NewPageArray(this.nomeUnicoCliente);

  @override
  _NewPageArrayState createState() => _NewPageArrayState();
}

class _NewPageArrayState extends State<NewPageArray> {
  @override
  Widget build(BuildContext context) {
/*
    teste_valor_conta_appbar() {
      int teste_exibir_valor_appbar = 0;
      List teste_valores_appbar = [];
      mapBebidasExportadas[0]!.forEach((key, value) {
        teste_valores_appbar.add(int.parse(value.toString()));
      });

      for (var index in teste_valores_appbar) {
        print(teste_valores_appbar);
        teste_exibir_valor_appbar =
            int.parse(teste_valores_appbar[index].toString());
      }

      return teste_exibir_valor_appbar;
    }
*/

    return Scaffold(
      appBar: AppBar(
        title: Text("Notas ${widget.nomeUnicoCliente}"),
        actions: [
          // Container(
          //   padding: EdgeInsets.only(right: 20),
          //   child: Center(
          //     child: Text(
          //       "5.00 R\$",
          //       style: TextStyle(fontSize: 20),
          //     ),
          //   ),
          // )
        ],
      ),
      body: AnimatedBuilder(
        animation: AtualizarNotas.instance,
        builder: (context, child) {
          return Container(
            padding: EdgeInsets.only(top: 5),
            child: Column(
              children: [
                Expanded(
                    child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: AtualizarNotas.instance.test_export_bebidas.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: ListTile(
                                title: Text(
                                  "${tratarMapParaVisualizacao(index)}",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ),
                            Expanded(
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.delete),
                              ),
                            ),
                          ],
                        ),
                        Divider(),
                      ],
                    );
                  },
                )),
                Container(
                  padding: EdgeInsets.only(bottom: 25, left: 10, right: 10),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 0.9 * MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            'FECHAR CONTA',
                            style: TextStyle(fontSize: 16),
                          ),
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                                RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30.0),
                              ),
                            )),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 0.8 * MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Serviço 10%",
                              style: TextStyle(fontSize: 20),
                            ),
                            Switch(
                              value: false,
                              onChanged: (value) {},
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.calculate),
                                Text(
                                  " R\$ 82,60",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.credit_card),
                                Text(
                                  " R\$ 00,00",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.shopping_bag),
                                Text(
                                  " R\$ 82,60",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, "/ListOptions");
        },
        icon: Icon(Icons.note_add_outlined),
        label: Text("Tomar nota"),
      ),
    );
  }
}
