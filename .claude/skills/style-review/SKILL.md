---
name: style-review
description: Dart/Flutter 컨벤션·flutter analyze·프로젝트 코드 일관성을 검토하는 방법론. style-reviewer 에이전트가 사용. 코드 스타일 리뷰, 린트 점검, 네이밍 검사, 일관성 검토, flutter analyze 실행 시 사용.
---

# Style Review — Dart/Flutter 코드 스타일 검토 방법론

개인 취향이 아니라 **일관성·가독성·프로젝트 자체 규칙**이 기준이다. 프로젝트가 이미 채택한 패턴을 깨는 제안은 하지 않는다.

## 검토 절차

1. **`flutter analyze`를 먼저 실행**해 객관적 기준선을 확보한다. (실패 시 정적 읽기로 진행하고 사유 명시.)
2. 대상 파일을 읽고 아래 항목을 검토한다.
3. 발견을 `references/report-format.md` 포맷으로 `_workspace/03_style_review.md`에 기록한다. 상단에 `flutter analyze` 요약(에러/경고/린트 개수)을 둔다.

## flutter analyze 실행

```bash
flutter analyze
```

- 출력에서 error / warning / info(lint)를 분류해 개수와 대표 항목을 요약한다.
- diff 범위 리뷰면 대상 파일에 해당하는 항목을 우선 정리한다.

## 검토 항목

### 1. flutter_lints 위반
- `analysis_options.yaml`은 `package:flutter_lints/flutter.yaml` 기본 세트. analyze가 보고한 lint는 근거가 명확하므로 그대로 보고한다.
- 대표 패턴: `use_build_context_synchronously`(async gap 이후 context 사용 — 잠재 버그), `prefer_const_constructors`, `unused_import`, `unused_local_variable`, `avoid_print`.

### 2. Dart 네이밍 컨벤션
- 클래스/타입/enum: UpperCamelCase. 변수/함수/파라미터: lowerCamelCase. 상수: lowerCamelCase(Dart는 SCREAMING_CAPS 비권장). 파일명: snake_case.
- private 멤버 `_` 접두사 일관성.
- 의미 없는 이름(`a`, `tmp`, `data2`) — **Low~Medium**.

### 3. 프로젝트 일관성 (취향보다 우선)
- **`.claude/CLAUDE.md` 규칙 준수**: 코드/주석은 프로젝트 언어 컨벤션(한국어 주석), feature별 동일한 `data/domain/presentation` 구조, 테스트 디렉토리 구조 일치.
- 코드젠 사용 방식 일관성: freezed model, `@riverpod`/retrofit 어노테이션 패턴이 feature 간 동일한가.
- import 정렬/그룹핑이 파일 간 일관적인가.

### 4. 가독성·죽은 코드
- 매직 넘버/문자열 — 상수화 검토(**Low~Medium**).
- 미사용 import/변수/함수 — 보고. 단, **사전 존재 죽은 코드는 삭제 강요 없이 명시만**.
- 과도하게 긴 함수/위젯(빌드 메서드 비대) — 분리 제안(**Low**).
- 주석 품질: 코드와 어긋난 주석, TODO 방치.

## 보고하지 않는 것

- `dart format`이 자동 처리하는 공백/들여쓰기/줄바꿈. 사람이 판단할 네이밍·구조·일관성에 집중한다.

## 심각도 기준

- **High**: analyze error, `use_build_context_synchronously` 등 버그성 lint
- **Medium**: 일관성 위반, 다수 warning, 네이밍 혼란
- **Low**: 매직 넘버, 사소한 가독성, info 레벨 lint

## 주의

- 프로젝트 기존 스타일과 매칭되는 코드를 "베스트 프랙티스"를 이유로 바꾸라고 하지 않는다.
- 구조적 원인이면 architecture-reviewer에게 공유한다.
