// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
/*
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:hello_world/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
*/

// void main() {
//   int valor = 5;
//   String novo = valor.toString();
//   print(novo);
// }

Map<int, List> listaDeListas = Map();
Map<int, List> listaDeListas2 = {};

List<String> lista_1 = ["Fulano", "Beltrano", "Ciclano", "Flavia", "Bruno"];
List<String> lista_2 = [
  "Fulano",
  "Beltrano",
];
List<String> lista_3 = [
  "Fulano",
  "Beltrano",
  "Ciclano",
];

lista(i) {
  switch (i) {
    case 1:
      return lista_1;
    case 2:
      return lista_2;
    case 3:
      return lista_3;
  }
}

void main() {
  for (var i = 1; i == 3; i++) {
    listaDeListas[i] = lista(i);
  }

  print(listaDeListas);
}
