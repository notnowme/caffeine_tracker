import 'package:caffeine_tracker/features/info/data/models/info_model.dart';
import 'package:caffeine_tracker/features/info/presentation/providers/info_provider.dart';
import 'package:caffeine_tracker/features/info/presentation/screens/info_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/test_app.dart';

void main() {
  group('InfoScreen', () {
    testWidgets('정보 입력 화면에 제목과 성별 칩(남성/여성)이 렌더링된다', (tester) async {
      // given
      await pumpAppWithRouter(tester, const InfoScreen(isEdit: false));
      await tester.pumpAndSettle();

      // then
      expect(find.text('정보 입력'), findsOneWidget);
      expect(find.text('남성'), findsOneWidget);
      expect(find.text('여성'), findsOneWidget);
    });

    testWidgets("'남성' 칩을 탭하면 infoProvider의 gender가 male로 변경된다", (tester) async {
      // given (InfoModel.empty의 기본 성별은 female)
      await pumpAppWithRouter(tester, const InfoScreen(isEdit: false));
      await tester.pumpAndSettle();

      final container = ProviderScope.containerOf(
        tester.element(find.byType(InfoScreen)),
      );
      expect(container.read(infoProvider).gender, Gender.female);

      // when
      await tester.tap(find.text('남성'));
      await tester.pumpAndSettle();

      // then
      expect(container.read(infoProvider).gender, Gender.male);
    });
  });
}
