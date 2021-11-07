import 'package:flutter/material.dart';
// import 'package:hello_world/app/controllers/valores_estaticos.dart';
// import 'package:hello_world/app/controllers/valores_estaticos.dart';
import 'ListOptions.dart';

Map<int, Map> mapVisualizandoNotas = Map();

class NewPageArray extends StatefulWidget {
  // const NewPageArray({Key? key}) : super(key: key);

  String nomeUnicoCliente = "";
  NewPageArray(this.nomeUnicoCliente);

  @override
  _NewPageArrayState createState() => _NewPageArrayState();
}

class _NewPageArrayState extends State<NewPageArray> {
  @override
  Widget build(BuildContext context) {
/*
    teste_funcao(index) {
      print(index);
      List<String> mostrarDadosNotas = [];

      mapBebidasExportadas[index]!.forEach((key, value) {
        if (value > 0) {
          mostrarDadosNotas.add("$key $value \n");
        }
      });
      return mostrarDadosNotas;
    }
    */

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
          Container(
            padding: EdgeInsets.only(right: 20),
            child: Center(
              child: Text(
                "5.00 R\$",
                style: TextStyle(fontSize: 20),
              ),
            ),
          )
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: mapBebidasExportadas.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: ListTile(
                        title: Text(
                          "${mapBebidasExportadas[index]}",
                          style: TextStyle(),
                        ),
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
        onPressed: () {
          Navigator.pushNamed(context, "/ListOptions");
        },
        icon: Icon(Icons.note_add_outlined),
        label: Text("Tomar nota"),
      ),
    );
  }
}
