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

double valorTotalPedidos = 0; // visualização de valor do "Finalizar Pedido"

String testeNomeCLiente = ""; //

int qtdComandas = 0;
int quantidadePedidos = 0;

Map<int, dynamic> mapComandas = Map(); //Map de Comandas completas
Map<String, Map> mapComandasClientes = Map(); //Map dos pedidos de cleintes
Map<int, Map> mapBebidasExportadas = Map(); //Map de pedidos de bebidas
Map<String, int> mapExportandoBebidas = Map(); //Map de bebidas
