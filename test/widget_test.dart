import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:proyecto_2dam/main.dart';

void main() {
  testWidgets('muestra Inicio como pestaña inicial', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Inicio'), findsOneWidget);
    expect(find.text('Chat'), findsOneWidget);
    expect(find.text('Búsqueda'), findsOneWidget);
    expect(find.text('Perfil'), findsOneWidget);
    expect(find.byIcon(Icons.home_outlined), findsOneWidget);
  });

  testWidgets('permite cambiar de pestaña', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('Perfil'));
    await tester.pumpAndSettle();

    final navigationBar = tester.widget<NavigationBar>(find.byType(NavigationBar));
    expect(navigationBar.selectedIndex, 3);
  });
}
