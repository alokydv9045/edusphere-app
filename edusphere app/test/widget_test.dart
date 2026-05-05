// This is a basic Flutter widget test.
import 'package:flutter_test/flutter_test.dart';

import 'package:edusphere/main.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const EduSphereApp());

    // Verify that our app renders successfully.
    expect(find.byType(EduSphereApp), findsOneWidget);
  });
}
