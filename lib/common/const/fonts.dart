import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

abstract class AppFonts {
  AppFonts._();

  static final TextStyle hero = TextStyle(
    fontFamily: 'Pretendard',
    fontSize: 64.sp,
    fontWeight: FontWeight.w800,
    letterSpacing: -1.6.sp,
    fontFeatures: [FontFeature.tabularFigures()],
  );
  static final TextStyle h1 = TextStyle(
    fontFamily: 'Pretendard',
    fontSize: 28.sp,
    fontWeight: FontWeight.w800,
    letterSpacing: -0.7.sp,
    fontFeatures: [FontFeature.tabularFigures()],
  );
  static final TextStyle h2 = TextStyle(
    fontFamily: 'Pretendard',
    fontSize: 22.sp,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.33.sp,
    fontFeatures: [FontFeature.tabularFigures()],
  );
  static final TextStyle h3 = TextStyle(
    fontFamily: 'Pretendard',
    fontSize: 18.sp,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.18.sp,
    fontFeatures: [FontFeature.tabularFigures()],
  );
  static final TextStyle body = TextStyle(
    fontFamily: 'Pretendard',
    fontSize: 15.sp,
    fontWeight: FontWeight.w500,
    letterSpacing: 0,
    fontFeatures: [FontFeature.tabularFigures()],
  );
  static final TextStyle small = TextStyle(
    fontFamily: 'Pretendard',
    fontSize: 13.sp,
    fontWeight: FontWeight.w500,
    letterSpacing: 0,
    fontFeatures: [FontFeature.tabularFigures()],
  );
  static final TextStyle tiny = TextStyle(
    fontFamily: 'Pretendard',
    fontSize: 11.sp,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.44.sp,
    fontFeatures: [FontFeature.tabularFigures()],
  );
}
