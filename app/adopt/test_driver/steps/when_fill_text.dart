import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import 'package:flutter_driver/flutter_driver.dart';

class AndFillTextWidgetStep
    extends Given2WithWorld<String, String, FlutterWorld> {
  @override
  Future<void> executeStep(String widgetKey, String text) async {
    final textWidgetFinder = find.byValueKey(widgetKey);

    // Simulate typing into the text widget
    await FlutterDriverUtils.enterText(
      world.driver,
      textWidgetFinder,
      text,
    );
  }

  @override
  RegExp get pattern =>
      RegExp(r'I fill the {string} text widget with {string}');
}
