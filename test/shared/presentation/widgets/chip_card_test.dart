import 'package:caffeine_tracker/shared/presentation/widgets/chip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/test_app.dart';

void main() {
  group('ChipCard', () {
    testWidgets('title과 desc 텍스트가 렌더링된다', (tester) async {
      // given
      await pumpApp(
        tester,
        const ChipCard(
          title: '잔존량 계산',
          desc: '반감기 기반 추적',
          icon: Icon(Icons.coffee),
        ),
      );

      // then
      expect(find.text('잔존량 계산'), findsOneWidget);
      expect(find.text('반감기 기반 추적'), findsOneWidget);
    });

    testWidgets('전달한 아이콘이 표시된다', (tester) async {
      // given
      await pumpApp(
        tester,
        const ChipCard(
          title: '제목',
          desc: '설명',
          icon: Icon(Icons.coffee),
        ),
      );

      // then
      expect(find.byIcon(Icons.coffee), findsOneWidget);
    });
  });
}
