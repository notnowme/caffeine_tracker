import 'package:caffeine_tracker/shared/presentation/widgets/text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/test_app.dart';

void main() {
  group('TextInput', () {
    testWidgets('hintText가 표시된다', (tester) async {
      // given
      await pumpApp(tester, const TextInput(hintText: '검색어를 입력하세요'));

      // then
      expect(find.text('검색어를 입력하세요'), findsOneWidget);
    });

    testWidgets('입력하면 onChange 콜백에 입력값이 전달된다', (tester) async {
      // given
      String? changed;
      await pumpApp(
        tester,
        TextInput(onChange: (value) => changed = value),
      );

      // when
      await tester.enterText(find.byType(TextField), '아메리카노');
      await tester.pump();

      // then
      expect(changed, '아메리카노');
    });

    testWidgets('text prop이 변경되면 입력 필드에 반영된다', (tester) async {
      // given (초기 빌드 시점에는 text가 controller에 반영되지 않음)
      await pumpApp(tester, const TextInput(text: ''));

      // when (동일 위치에 text를 변경하여 다시 빌드 -> didUpdateWidget 트리거)
      await pumpApp(tester, const TextInput(text: '변경값'));
      await tester.pump();

      // then
      expect(find.text('변경값'), findsOneWidget);
    });
  });
}
