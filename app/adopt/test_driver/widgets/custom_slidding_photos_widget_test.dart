/*
import 'package:adopt/widgets/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class MockNavigatorObserver extends NavigatorObserver {
  final List<Route<dynamic>> routes = [];

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    routes.add(route);
    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    routes.remove(route);
    super.didPop(route, previousRoute);
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    routes.remove(route);
    super.didRemove(route, previousRoute);
  }
}

void main() {
  group('Carousel', () {
    final mockNavigatorObserver = MockNavigatorObserver();

    testWidgets('should display images in carousel', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: Carousel(),
      ));

      final images = find.byType(Image);

      expect(images, findsWidgets);
      expect(images.evaluate().length, 6);
    });

    testWidgets('should navigate to correct page on tap', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Navigator(
          onGenerateRoute: (settings) => MaterialPageRoute(
            settings: settings,
            builder: (context) => const Scaffold(body: Carousel()),
          ),
          observers: [mockNavigatorObserver],
        ),
      ));

      final carousel = find.byType(CarouselSlider);
      final image = find.byType(Image).first;
      const route = '/shelter';

      await tester.tap(image);
      await tester.pumpAndSettle();

      expect(mockNavigatorObserver.routes.length, 2);
      expect(mockNavigatorObserver.routes.last.settings.name, route);
    });
  });
}
*/