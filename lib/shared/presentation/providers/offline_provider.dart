import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 네트워크 없이(오프라인) 실행 중인지 여부.
/// 기본은 false이며, main의 오프라인 진입 시 ProviderScope에서 true로 override된다.
final offlineModeProvider = Provider<bool>((ref) => false);
