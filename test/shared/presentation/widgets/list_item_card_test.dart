import 'package:caffeine_tracker/shared/presentation/widgets/list_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/test_app.dart';

void main() {
  group('ListItemCard', () {
    testWidgets('child로 전달한 위젯이 렌더링된다', (tester) async {
      // given
      await pumpApp(tester, const ListItemCard(child: Text('항목')));

      // then
      expect(find.text('항목'), findsOneWidget);
    });

    testWidgets('isFirst와 isLast가 모두 true여도 정상적으로 빌드된다', (tester) async {
      // given
      await pumpApp(
        tester,
        const ListItemCard(
          isFirst: true,
          isLast: true,
          child: Text('단일 항목'),
        ),
      );

      // then
      expect(find.text('단일 항목'), findsOneWidget);
      expect(tester.takeException(), isNull);
    });
  });
}
