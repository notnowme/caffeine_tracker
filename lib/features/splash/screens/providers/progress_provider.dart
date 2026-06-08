import 'package:caffeine_tracker/core/db/sync_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'progress_provider.g.dart';

enum Progress {
  dataCheck('데이터를 확인하는 중...'),
  dataDone('데이터 확인 완료'),
  infoCheck('정보를 확인하는 중...');

  final String status;
  const Progress(this.status);
}

@Riverpod()
Stream<Progress> progress(Ref ref) async* {
  yield Progress.dataCheck;

  // DB 갱신
  await SyncService().versionCheck();
  await Future.delayed(const Duration(milliseconds: 400));
  yield Progress.dataDone;
  await Future.delayed(const Duration(milliseconds: 400));

  yield Progress.infoCheck;
}
