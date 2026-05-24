import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ai_agent/main.dart';

void main() {
  testWidgets('LearnHub dashboard smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const LearnHubApp());
    expect(find.text('Search courses...'), findsNothing);
  });
}
