import 'package:caffeine_tracker/features/menu/data/models/caffeine_model.dart';
import 'package:caffeine_tracker/shared/presentation/widgets/category_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/test_app.dart';

void main() {
  group('CaffeineCategoryIcon', () {
    testWidgets('카페 커피 카테고리는 coffee 아이콘을 표시한다', (tester) async {
      // given
      await pumpApp(
        tester,
        const CaffeineCategoryIcon(category: CaffeineCategory.cafeCoffee),
      );

      // then
      expect(find.byIcon(Icons.coffee_rounded), findsOneWidget);
    });

    testWidgets('차류 카테고리는 leaf 아이콘을 표시한다', (tester) async {
      // given
      await pumpApp(
        tester,
        const CaffeineCategoryIcon(category: CaffeineCategory.tea),
      );

      // then
      expect(
        find.byIcon(CupertinoIcons.leaf_arrow_circlepath),
        findsOneWidget,
      );
    });

    testWidgets('기타 카테고리는 ellipsis 아이콘을 표시한다', (tester) async {
      // given
      await pumpApp(
        tester,
        const CaffeineCategoryIcon(category: CaffeineCategory.etc),
      );

      // then
      expect(find.byIcon(CupertinoIcons.ellipsis), findsOneWidget);
    });
  });
}
