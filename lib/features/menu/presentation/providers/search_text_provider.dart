import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_text_provider.g.dart';

@Riverpod()
class SearchTextNotifier extends _$SearchTextNotifier {
  Timer? _debounce;
  @override
  String build() {
    return '';
  }

  void clear() {
    state = '';
  }

  void change(String value) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      state = value;
    });
  }
}
