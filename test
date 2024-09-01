import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Tap the "+" icon', (WidgetTester tester) async {
    // Build our app
    await tester.pumpWidget(const MyApp());

    // Tap the "+" icon
    await tester.tap(find.byIcon(Icons.add));

    // Verify that something changed
    await tester.pump();
  });
}
