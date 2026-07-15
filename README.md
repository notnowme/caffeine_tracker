# ☕ 카페인 스테이 (Caffeine Tracker)

섭취한 카페인을 기록하면 **반감기 기반으로 체내 카페인 농도를 추적**하고 수면 가능 시간을 예측해 주는 flutter 모바일 앱입니다.

---

## ✨ 주요 기능

- **온보딩 & 사용자 정보 입력** — 성별, 체중, 흡연 여부, 카페인 민감도, 일일 목표 카페인량 설정
- **카페인 기록** — 내장 카페인 상품 검색 또는 커스텀 상품을 직접 등록 후 섭취 기록
- **홈 대시보드**
  - 현재 체내 카페인 농도(실시간)
  - 오늘 총 섭취량 / 목표 대비 비율
  - 예상 수면 가능 시각
  - 최근 12시간 카페인 농도 변화 차트
- **리포트** — 주간/월간/연간 섭취량 차트, 시간대별 섭취 패턴, 목표 초과/이하 요약, 가장 많이 섭취한 카페인
- **설정** — 내 정보 수정, 데이터 삭제 등

<details>
  <summary>앱 일부 화면 이미지 보기</summary>
  
  ![img01](https://github.com/user-attachments/assets/a0eef41f-b49c-4cd9-ab8c-fd32be3fd02a)
  ![img02](https://github.com/user-attachments/assets/9d3c702b-3ad7-4040-85f7-9532a0553c8a)
  ![img03](https://github.com/user-attachments/assets/13049807-f12f-4b6e-989c-dbde63246d2a)

</details>

## 🧮 카페인 농도 계산 방식

체내 카페인 농도는 **흡수 → 반감기 감소** 모델로 계산합니다.

- 섭취 후 45분까지: 선형 흡수
- 45분 이후: 반감기에 따른 지수 감소
- 반감기는 **성별·흡연 여부**에 따라 보정 (기본 5시간 / 흡연 시 ×0.5 / 여성 ×1.2)
- 농도가 25mg 이하로 떨어지는 시점을 "수면 가능 시각"으로 예측

> 핵심 로직: `lib/shared/utils/caffeine_calculator.dart`

---

## 🛠️ 기술 스택

| 분류 | 사용 기술 |
|------|-----------|
| 프레임워크 | Flutter (Dart SDK ^3.11) |
| 상태 관리 | Riverpod 3.x (`flutter_riverpod`, `riverpod_annotation`) |
| 라우팅 | go_router |
| 반응형 UI | flutter_screenutil_plus |
| 로컬 DB | SQLite (`sqflite`) |
| 백엔드 동기화 | Supabase (음료 데이터 동기화) |
| 네트워크 | dio |
| 차트 | fl_chart |
| 코드 생성 | freezed, json_serializable, build_runner |
| 테스트 | flutter_test, mockito, sqflite_common_ffi |

## 🗂️ 프로젝트 구조

```
lib/
├── common/         # 색상, 폰트 등 상수
├── core/           # DB(SQLite), 라우팅, Supabase 설정
├── features/       # 기능별 모듈 (Clean Architecture)
│   ├── splash/
│   ├── onboard/
│   ├── info/
│   ├── home/
│   ├── menu/
│   ├── report/
│   └── settings/
│       ├── data/           # model, repository
│       ├── domain/         # usecase
│       └── presentation/   # screen, widget, provider
└── shared/         # 공통 data/domain/presentation/utils
```

각 feature는 `data / domain / presentation` 레이어로 구성됩니다.

---

## 🚀 시작해 보기

### 요구 사항

- Flutter SDK (Dart `^3.11.1`)
- iOS / Android 개발 환경

### 설치

```bash
flutter pub get
```

### 환경 변수 (.env)

프로젝트 루트에 `.env` 파일을 생성하고 Supabase 정보를 입력합니다.
> 현재 supabase SQL 파일은 제공되지 않습니다.

```env
SUPABASE_URL=your-supabase-url
SUPABASE_ANON_KEY=your-supabase-anon-key
```

### 실행

```bash
flutter run
```

---

## 🧪 테스트

테스트는 `test/` 디렉토리에 `lib/`와 동일한 구조로 작성되어 있습니다. (유닛 / 위젯 / 통합)

```bash
flutter test
```

- 유닛 테스트: `CaffeineCalculator`, 각 feature UseCase
- 위젯 테스트: 공통 위젯 및 화면 단위 렌더링/상호작용
- 통합 테스트: `test/integration/app_test.dart` (인메모리 SQLite + 실제 Riverpod Provider)

자세한 내용은 [`.claude/test_summary.md`](.claude/test_summary.md) 참고.
