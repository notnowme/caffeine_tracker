import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bottom_nav_provider.g.dart';

@Riverpod()
class PageNotifier extends _$PageNotifier {
  @override
  int build() {
    return 0;
  }

  void move(int page) {
    state = page;
  }

  void goHome() {
    state = 0;
  }
}
