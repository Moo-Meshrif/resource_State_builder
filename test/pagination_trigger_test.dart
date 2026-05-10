import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:resource_state_builder/src/pagination_trigger.dart';

void main() {
  group('PaginationTrigger', () {
    testWidgets('triggers when scroll reaches threshold', (tester) async {
      int triggerCount = 0;
      final controller = ScrollController();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomScrollView(
              controller: controller,
              slivers: [
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 1000,
                    child: Center(child: Text('Content')),
                  ),
                ),
                SliverToBoxAdapter(
                  child: PaginationTrigger(
                    threshold: 200,
                    onTrigger: () => triggerCount++,
                  ),
                ),
              ],
            ),
          ),
        ),
      );

      // Viewport is 600px tall. Content is 1000px.
      // maxScrollExtent will be around 400.
      expect(triggerCount, 0);

      // Scroll to exactly threshold (maxScrollExtent - 200 = 200)
      controller.jumpTo(200);
      await tester.pump();
      
      expect(triggerCount, 1);

      // Scrolling further should NOT trigger again because _hasTriggered = true
      controller.jumpTo(400);
      await tester.pump();
      
      expect(triggerCount, 1);
    });

    testWidgets('resets trigger when threshold changes', (tester) async {
      int triggerCount = 0;
      final controller = ScrollController();

      Widget buildApp(double threshold) {
        return MaterialApp(
          home: Scaffold(
            body: CustomScrollView(
              controller: controller,
              slivers: [
                SliverToBoxAdapter(child: SizedBox(height: 1000)),
                SliverToBoxAdapter(
                  child: PaginationTrigger(
                    threshold: threshold,
                    onTrigger: () => triggerCount++,
                  ),
                ),
              ],
            ),
          ),
        );
      }

      await tester.pumpWidget(buildApp(200));

      controller.jumpTo(200);
      await tester.pump();
      expect(triggerCount, 1);

      // Re-pump with new threshold
      await tester.pumpWidget(buildApp(300));
      
      // Since threshold changed, it should re-trigger if still within threshold
      controller.jumpTo(100); // 400 - 300 = 100
      await tester.pump();
      expect(triggerCount, 2);
    });
  });
}
