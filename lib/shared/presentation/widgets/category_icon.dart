import 'package:caffeine_tracker/features/menu/data/models/caffeine_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class CaffeineCategoryIcon extends StatelessWidget {
  const CaffeineCategoryIcon({
    super.key,
    required this.category,
    this.size = 36,
  });

  final CaffeineCategory category;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.w(size),
      height: context.h(size),
      decoration: BoxDecoration(
        color: _backgroundColor,
        borderRadius: BorderRadius.circular(context.r(size * 0.3)),
      ),
      child: Center(
        child: Icon(_icon, color: _iconColor, size: context.h(size * 0.5)),
      ),
    );
  }

  IconData get _icon => switch (category) {
    CaffeineCategory.cafeCoffee => Icons.coffee_rounded,
    CaffeineCategory.energyDrink => CupertinoIcons.bolt_fill,
    CaffeineCategory.cannedCoffee => CupertinoIcons.cube_box,
    CaffeineCategory.instantCoffee => CupertinoIcons.bag,
    CaffeineCategory.capsuleCoffee => CupertinoIcons.capsule,
    CaffeineCategory.tea => CupertinoIcons.leaf_arrow_circlepath,
    CaffeineCategory.soda => CupertinoIcons.drop,
    CaffeineCategory.dessert => CupertinoIcons.heart,
    CaffeineCategory.medicine => CupertinoIcons.bandage,
    CaffeineCategory.etc => CupertinoIcons.ellipsis,
  };

  Color get _iconColor => switch (category) {
    CaffeineCategory.cafeCoffee => const Color(0xFF8B5E3C),
    CaffeineCategory.energyDrink => const Color(0xFF2E7D32),
    CaffeineCategory.cannedCoffee => const Color(0xFFE65100),
    CaffeineCategory.instantCoffee => const Color(0xFF6A1B9A),
    CaffeineCategory.capsuleCoffee => const Color(0xFF1565C0),
    CaffeineCategory.tea => const Color(0xFF2E7D32),
    CaffeineCategory.soda => const Color(0xFF0277BD),
    CaffeineCategory.dessert => const Color(0xFFC62828),
    CaffeineCategory.medicine => const Color(0xFF6A1B9A),
    CaffeineCategory.etc => const Color(0xFF2A1D0E),
  };

  Color get _backgroundColor => switch (category) {
    CaffeineCategory.cafeCoffee => const Color(0xFFF5ECD7),
    CaffeineCategory.energyDrink => const Color(0xFFE8F5E9),
    CaffeineCategory.cannedCoffee => const Color(0xFFFFF3E0),
    CaffeineCategory.instantCoffee => const Color(0xFFF3E5F5),
    CaffeineCategory.capsuleCoffee => const Color(0xFFE3F2FD),
    CaffeineCategory.tea => const Color(0xFFE8F5E9),
    CaffeineCategory.soda => const Color(0xFFE1F5FE),
    CaffeineCategory.dessert => const Color(0xFFFCE4EC),
    CaffeineCategory.medicine => const Color(0xFFF3E5F5),
    CaffeineCategory.etc => const Color(0xFFF3E5F5),
  };
}
