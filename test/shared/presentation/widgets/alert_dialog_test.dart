import 'package:bounce_tapper/bounce_tapper.dart';
import 'package:caffeine_tracker/common/const/colors.dart';
import 'package:caffeine_tracker/shared/presentation/widgets/alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/test_app.dart';

void main() {
  group('CustomAlertDialog', () {
    testWidgets('title, body, actionTitle, 취소 텍스트가 렌더링된다', (tester) async {
      // given
      await pumpAppWithRouter(
        tester,
        CustomAlertDialog(
          icon: Icons.delete,
          iconColor: AppColors.error,
          title: '데이터 삭제',
          body: '정말 삭제하시겠어요?',
          actionTitle: '삭제',
          action: () {},
        ),
      );
      await tester.pumpAndSettle();

      // then
      expect(find.text('데이터 삭제'), findsOneWidget);
      expect(find.text('정말 삭제하시겠어요?'), findsOneWidget);
      expect(find.text('삭제'), findsOneWidget);
      expect(find.text('취소'), findsOneWidget);
    });

    testWidgets('actionTitle 버튼을 탭하면 action 콜백이 호출된다', (tester) async {
      // given
      var actioned = false;
      await pumpAppWithRouter(
        tester,
        CustomAlertDialog(
          icon: Icons.delete,
          iconColor: AppColors.error,
          title: '데이터 삭제',
          body: '정말 삭제하시겠어요?',
          actionTitle: '삭제',
          action: () => actioned = true,
        ),
      );
      await tester.pumpAndSettle();

      // when ('삭제' 버튼의 BounceTapper에 연결된 onTap을 직접 호출)
      final deleteBounce = tester.widget<BounceTapper>(
        find.ancestor(
          of: find.text('삭제'),
          matching: find.byType(BounceTapper),
        ),
      );
      deleteBounce.onTap?.call();

      // then
      expect(actioned, isTrue);
    });
  });
}
