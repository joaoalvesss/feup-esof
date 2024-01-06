import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:adopt/widgets/widgets.dart';

void main() {
  group('TextElement widget', () {
    testWidgets('renders text with default font size and weight', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TextElement(text: 'Hello, World!'),
          ),
        ),
      );
      expect(find.text('Hello, World!'), findsOneWidget);
      final textStyle = tester.widget<Text>(find.byType(Text)).style;
      expect(textStyle?.fontSize, equals(16.0));
      expect(textStyle?.fontWeight, equals(FontWeight.normal));
    });

    testWidgets('renders text with custom font size and weight', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TextElement(
              text: 'Hello, World!',
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
      expect(find.text('Hello, World!'), findsOneWidget);
      final textStyle = tester.widget<Text>(find.byType(Text)).style;
      expect(textStyle?.fontSize, equals(20.0));
      expect(textStyle?.fontWeight, equals(FontWeight.bold));
    });
  });
}
