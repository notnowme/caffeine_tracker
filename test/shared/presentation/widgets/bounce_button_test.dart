import 'package:bounce_tapper/bounce_tapper.dart';
import 'package:caffeine_tracker/common/const/colors.dart';
import 'package:caffeine_tracker/shared/presentation/widgets/bounce_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/test_app.dart';

void main() {
  group('BounceButton', () {
    testWidgets('child로 전달한 위젯이 렌더링된다', (tester) async {
      // given
      await pumpApp(
        tester,
        BounceButton(
          buttonColor: AppColors.primary,
          action: () {},
          child: const Text('확인'),
        ),
      );

      await tester.pumpAndSettle();

      // then
      expect(find.text('확인'), findsOneWidget);
    });

    testWidgets('탭하면 action 콜백이 호출된다', (tester) async {
      // given
      var tapped = false;
      await pumpApp(
        tester,
        BounceButton(
          buttonColor: AppColors.primary,
          action: () => tapped = true,
          child: const Text('확인'),
        ),
      );
      await tester.pumpAndSettle();

      // when (BounceTapper에 연결된 onTap을 호출 - 애니메이션 타이밍에 의존하지 않음)
      final bounce = tester.widget<BounceTapper>(find.byType(BounceTapper));
      bounce.onTap?.call();

      // then
      expect(tapped, isTrue);
    });
  });
}
