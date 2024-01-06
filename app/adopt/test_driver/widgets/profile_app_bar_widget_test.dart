import 'package:adopt/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('ProfileAppBar displays animal name', (WidgetTester tester) async {
    const animalName = 'Fluffy';
    const widget = ProfileAppBar(name: animalName);
    await tester.pumpWidget(const MaterialApp(home: Scaffold(appBar: widget)));
    expect(find.text(animalName), findsOneWidget);
  });

  testWidgets('ProfileAppBar has correct height', (WidgetTester tester) async {
    const widget = ProfileAppBar(name: 'Test Animal');
    final preferredSize = widget.preferredSize;
    expect(preferredSize.height, 90);
  });
}
