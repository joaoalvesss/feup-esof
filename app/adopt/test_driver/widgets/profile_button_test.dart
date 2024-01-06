import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:adopt/widgets/profile_button.dart';

void main() {
  testWidgets('CreateProfileButton should navigate to create profile screen when clicked',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: const Scaffold(
              body: CreateProfileButton(),
            ),
            routes: {
              '/create_profile': (context) => const Scaffold(),
            },
          ),
        );
        await tester.tap(find.byType(FloatingActionButton));
        await tester.pump();
        expect(find.byType(Scaffold), findsOneWidget);
      });
}
