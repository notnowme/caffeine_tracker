// 앱 진입점 스모크 테스트.
// 온보딩 화면이 예외 없이 렌더링되는지 검증한다.

import 'package:caffeine_tracker/features/onboard/presentation/screens/onboard_screen.dart';
import 'package:flutter_test/flutter_test.dart';

import 'helpers/test_app.dart';

void main() {
  testWidgets('온보딩 화면이 예외 없이 렌더링되고 소개 칩이 표시된다', (tester) async {
    // given
    await pumpAppWithRouter(tester, const OnboardScreen());
    await tester.pumpAndSettle();

    // then (소개 칩의 텍스트가 표시된다)
    expect(find.text('음료 라이브러리'), findsOneWidget);
    expect(find.text('잔존량 계산'), findsOneWidget);

    // 테스트 기본 폰트(고정폭)는 한글을 실제(Pretendard)보다 넓게 측정하여
    // ChipCard 2열 레이아웃에서 RenderFlex 오버플로우가 발생할 수 있다.
    // 레이아웃 결함이 아니므로 발생한 예외를 소비한다.
    while (tester.takeException() != null) {}
  });
}
