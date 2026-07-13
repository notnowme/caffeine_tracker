# 테스트 코드 작성 결과 요약

작성일: 2026-06-08

## 전체 현황

| 단계 | 파일 수 | 테스트 수 | 상태 |
|------|:---:|:---:|:---:|
| 유닛 테스트 | 7 | 46 | ✅ |
| 위젯 테스트 | 8 (+공통 헬퍼) | 17 | ✅ |
| 통합 테스트 | 1 | 4 | ✅ |
| **합계** | — | **67** | **전부 통과** |

실행: `flutter test` → All tests passed (67)

---

## 1. 유닛 테스트 (46)

`test/` 디렉토리를 `lib/` 구조와 동일하게 미러링. given/when/then 패턴, 테스트명 한국어, Mock은 Mockito `@GenerateMocks` + build_runner 생성.

| 대상 | 파일 | 케이스 |
|------|------|:---:|
| `CaffeineCalculator` | `test/shared/utils/caffeine_calculator_test.dart` | 15 |
| home UseCase | `test/features/home/domain/usecases/home_chart_data_test.dart` | 6 |
| menu UseCase | `test/features/menu/domain/usecases/caffeine_record_test.dart` | 8 |
| report UseCase (5개) | `test/features/report/domain/usecases/*_test.dart` | 16 |
| settings UseCase | `test/features/settings/domain/usecases/delete_data_usecase_test.dart` | 1 |

- 시간 의존 로직(`getCurrentLevel`, `getSleepTime`)은 현재 시각 기준 상대값 + `closeTo`로 검증
- Repository 의존 UseCase는 Mock으로 분기/경계/빈 입력 검증

## 2. 위젯 테스트 (17)

공통 헬퍼 `test/helpers/test_app.dart`: 실제 앱과 동일하게 `ScreenUtilPlusInit(390×844)` 래핑. 일반용 `pumpApp`, go_router 필요용 `pumpAppWithRouter` 제공.

| 대상 | 파일 | 케이스 |
|------|------|:---:|
| `BounceButton` | `test/shared/presentation/widgets/bounce_button_test.dart` | 2 |
| `ListItemCard` | `.../list_item_card_test.dart` | 2 |
| `ChipCard` | `.../chip_card_test.dart` | 2 |
| `CaffeineCategoryIcon` | `.../category_icon_test.dart` | 3 |
| `TextInput` | `.../text_input_test.dart` | 3 |
| `CustomAlertDialog` | `.../alert_dialog_test.dart` | 2 |
| `InfoScreen` (화면 단위) | `test/features/info/presentation/screens/info_screen_test.dart` | 2 |
| 온보딩 스모크 | `test/widget_test.dart` (템플릿 교체) | 1 |

## 3. 통합 테스트 (4)

`test/integration/app_test.dart` — 실제 Riverpod Provider + 인메모리(ffi) SQLite + Supabase 미사용. `ProviderContainer` 기반.

- 시나리오 2: 음료 추가 → 카페인 총량 업데이트 (단건/누적, 2건)
- 시나리오 3: 검색 → 선택 → 기록 추가 (검색 일치/불일치, 2건)
- `setUpAll`에서 `sqfliteFfiInit()` + `databaseFactory = databaseFactoryFfi`, `setUp`에서 `deleteAllDatas()`로 격리

---

## 변경 / 추가 사항

- **프로덕션 코드 수정 없음**
- **패키지 추가**: `sqflite_common_ffi` (dev_dependency) — VM에서 SQLite 통합 테스트 실행용
  - export 파일은 `package:sqflite_common_ffi/sqflite_ffi.dart` (2.4.0+3 기준)
- 깨져 있던 Flutter 기본 템플릿 `test/widget_test.dart`(카운터 앱용)를 온보딩 스모크 테스트로 교체

---

## 작성 시 주의점 (재작업 시 참고)

1. **`part of` + private(`_`) 위젯은 단독 위젯 테스트 불가** → public 진입 화면을 통해 검증해야 한다. (`InfoScreen`을 통해 내부 `_Gender` 동작 확인)
2. **`BounceTapper`**(bounce_tapper 패키지)는 `initState`에서 postFrame 타이머를 생성하고, 탭을 애니메이션 + `Future.microtask`로 처리한다.
   - 렌더만 해도 pending timer가 남으므로 `pumpAndSettle()` 필요
   - `tester.tap()`은 down/up이 즉시 연속돼 `onTap`이 무시될 수 있음 → 콜백 검증은 위젯의 `onTap`을 직접 호출하는 방식이 안정적
3. **`TextInput`**은 초기 `text`를 첫 빌드에 반영하지 않고 `didUpdateWidget`에서만 반영한다.
4. **테스트 기본 폰트(고정폭)** 는 한글을 실제(Pretendard)보다 넓게 측정하여 빡빡한 레이아웃(ChipCard 2열)에서 RenderFlex 오버플로우가 발생할 수 있다. 레이아웃 결함이 아니므로 예외를 소비 처리한다.
5. **`searchTextProvider`** 는 300ms 디바운스 + autoDispose. 테스트에서 타이머 발화 전에 dispose되지 않도록 `container.listen`으로 구독을 유지해야 한다. (실제 앱은 메뉴 화면이 watch)
6. **`RecordNotifier.add`** 는 `todayTotalCaffeineAmountProvider`를 자동 무효화하지 않으므로, 테스트에서 `invalidate` 후 재조회한다.
7. **통합 테스트 위치**: `integration_test/`에 두면 `flutter test`가 on-device(기기/에뮬레이터) 모드로 빌드를 시도한다. `ProviderContainer` 기반 순수 Dart 통합 테스트는 기기가 불필요하므로 `test/integration/`에 두어 VM에서 실행한다.
