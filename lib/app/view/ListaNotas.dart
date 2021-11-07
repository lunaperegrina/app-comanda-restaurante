import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/app/controllers/botoes_nota.dart';
import 'package:hello_world/app/controllers/valores_estaticos.dart';

class NovaListaNotas extends StatefulWidget {
  @override
  _NovaListaNotasState createState() => _NovaListaNotasState();
}

class _NovaListaNotasState extends State<NovaListaNotas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context); // Botao de voltar
            },
            child: Icon(Icons.arrow_back)),
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
                              margin: EdgeInsets.only(left: 6, right: 6),
                              child: OutlinedButton(
                                onPressed: () {},
                                child: Text(
                                    "${listaPrecosBebidas[index].toString()}0 RS",
                                    style: TextStyle(fontSize: 18)),
                              ),
                            ),
                          ),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  botaoDiminuir(index);
                                });
                              },
                              child: Text("-", style: TextStyle(fontSize: 18)),
                            ),
                          ),
                          Expanded(
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                  listaQuantidadeColetada[index].toString(),
                                  style: TextStyle(fontSize: 18)),
                            ),
                          ),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  botaoSomar(index);
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
          label: Text("Finalizar ${valorTotalPedidos}0 RS",
              style: TextStyle(fontSize: 16)),
          icon: Icon(Icons.checklist),
          onPressed: () {
            exportandoBebidas();

            setState(() {
              finalizandoNota();
              Navigator.pop(context);
            });
          }),
    );
  }
}
