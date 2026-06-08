import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'report_tab_provider.g.dart';

@Riverpod()
class TabPageNotifier extends _$TabPageNotifier {
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
