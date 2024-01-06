import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import 'package:flutter_driver/flutter_driver.dart';

class ThenWidgetPresent extends Then1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String widgetKey) async {
    final widgetFinder = find.byValueKey(widgetKey);
    final isPresent =
        await FlutterDriverUtils.isPresent(world.driver, widgetFinder);
    expect(isPresent, true,
        reason: 'Widget with key "$widgetKey" is not present');
  }

  @override
  Pattern get pattern =>
      RegExp(r'I expect the widget with key {string} to be present');
}
