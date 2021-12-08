import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:art_shack/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('tap tests, verify components on screen',
        (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      expect(find.text('ArtShack'), findsOneWidget);

      final Finder nav = find.byTooltip('NavBar');

      await tester.tap(nav);

      // Trigger a frame.
      await tester.pumpAndSettle();

      expect(find.text('Vea las nuevas tendencias y publicaciones debajo'),
          findsOneWidget);
    });
  });
}
