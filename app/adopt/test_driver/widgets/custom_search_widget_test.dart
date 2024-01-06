import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:adopt/widgets/custom_search_widget.dart';

void main() {
  group('CustomSearchWidget', () {
    testWidgets('should display search hint text', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: CustomSearchWidget(),
      ));

      final hintTextFinder = find.text('Search');
      expect(hintTextFinder, findsOneWidget);
    });

    testWidgets('should not be selectable', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: CustomSearchWidget(),
      ));

      final textFieldFinder = find.byType(TextField);
      final textField = tester.widget<TextField>(textFieldFinder);

      expect(textField.enableInteractiveSelection, isFalse);
    });
  });
}
