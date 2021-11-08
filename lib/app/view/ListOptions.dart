import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../controller/classes_e_funcoes.dart';
import '/app/controller/valores_constantes.dart';

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
                            child: OutlinedButton(
                              //Botão para subtrair a quantidade de
                              onLongPress: () {
                                setState(() {
                                  onLongPressSubtrair(index);
                                });
                              },
                              onPressed: () {
                                setState(() {
                                  onPressedSubstrair(index);
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
                            child: OutlinedButton(
                              onLongPress: () {
                                setState(() {
                                  onPressedAdicionar(index);
                                });
                              },
                              onPressed: () {
                                setState(() {
                                  onLongPressAdicionar(index);
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
              AtualizarNotas.instance.atualizarNota();

              setState(() {
                Navigator.pop(context);
              });

              mostrarValorFinalizar = 0;
              qtdDeVezesQuePediu++;
            }
          }),
    );
  }
}
