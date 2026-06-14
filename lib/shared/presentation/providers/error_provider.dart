import 'package:caffeine_tracker/shared/data/models/error_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'error_provider.g.dart';

@Riverpod()
class ErrorNotifier extends _$ErrorNotifier {
  @override
  ErrorModel? build() {
    return null;
  }

  void updateError(ErrorModel error) {
    state = error;
  }

  void clear() {
    state = null;
  }
}
