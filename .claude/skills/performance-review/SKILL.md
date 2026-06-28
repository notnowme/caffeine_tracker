---
name: performance-review
description: Flutter 위젯 리빌드·렌더링·SQLite 쿼리·async 병목을 정적 분석으로 찾는 방법론. performance-reviewer 에이전트가 사용. 성능 리뷰, 병목 점검, 리빌드 최적화, 쿼리 N+1 검사, 메모리 누수 점검 시 사용.
---

# Performance Review — Flutter 성능 병목 검토 방법론

체감 성능과 자원 낭비에 직결되는 문제에 집중한다. 가독성을 해치는 마이크로 최적화는 제안하지 않는다.

## 검토 절차

1. 대상 파일의 빌드 메서드, Provider, DB 접근, async 흐름을 읽는다.
2. 아래 카테고리별 안티패턴을 찾는다.
3. 발견을 `references/report-format.md` 포맷으로 `_workspace/02_performance_review.md`에 기록한다. 각 발견에 예상 영향(리빌드 빈도/조회 횟수 등)을 명시한다.

## 검토 카테고리

### 1. 위젯 리빌드
- **과도한 구독 범위**: `ref.watch(provider)`가 큰 상태 객체 전체를 구독해 일부 필드 변경에도 전체 리빌드되면 — `select`로 좁히기 권장. **Medium~High**.
- **`const` 누락**: 변하지 않는 위젯에 `const` 생성자 미사용 → 불필요 리빌드. 빈번한 위젯이면 **Medium**.
- **빌드 메서드 내 객체 생성**: `build()` 안에서 매번 리스트/맵/함수/컨트롤러를 생성하면 리빌드마다 재할당. **Medium**.
- **리스트 렌더링**: 다수 항목을 `Column`/`ListView(children:[...])`로 한 번에 그리면 전부 빌드됨. `ListView.builder`/`SliverList`로 지연 렌더링 권장. **High**(항목 수가 가변·다수일 때).

### 2. fl_chart 렌더링
- 차트 데이터/`*ChartData` 객체가 build마다 재생성되는지(메모이즈 가능 지점).
- 데이터 포인트가 많을 때 불필요한 라인/바 갱신, 애니메이션 중복 트리거.

### 3. SQLite (sqflite) 쿼리
- **N+1**: 반복문 안에서 쿼리 실행 → 단일 쿼리/JOIN/`IN`으로 통합 가능하면 **High**.
- **중복 조회**: 같은 화면 렌더에서 동일 데이터를 여러 번 조회. 캐싱/Provider 공유 검토.
- **일괄 쓰기**: 다건 insert/update를 트랜잭션(`batch`) 없이 반복하면 **Medium**.
- **캐싱 정합성**: 이 프로젝트는 기록 캐싱을 도입 중. 캐시 무효화 시점이 누락되면 stale 데이터(정합성 버그) — 성능과 정합성 모두 표기.

### 4. async 병목
- **직렬 await**: 서로 독립적인 `await a(); await b();`가 순차 실행되어 지연 합산 → `Future.wait([a(), b()])` 병렬화. **Medium**.
- **UI 스레드 블로킹**: build나 동기 경로에서 무거운 연산(대량 파싱/정렬). isolate/사전 계산 검토.
- **불필요한 재요청**: 화면 진입마다 동일 네트워크/DB 호출 — 캐싱 가능성.

### 5. 자원 누수
- `AnimationController`, `TextEditingController`, `ScrollController`, `StreamSubscription`, `Timer`의 `dispose()`/`cancel()` 누락 → **High**.
- `StatefulWidget`의 `dispose` 오버라이드 존재 여부 확인.

## 심각도 기준

- **High**: N+1 쿼리, 대량 항목 일괄 렌더, 자원 누수, 캐시 정합성 깨짐
- **Medium**: 과도 구독, const/빌드내 생성, 직렬 await
- **Low**: 잠재적·저빈도 개선

## 주의

- 정적 분석 기반이므로 단정 대신 "잠재적 병목"으로 분류할 때를 구분한다.
- 근본 원인이 아키텍처면 architecture-reviewer에게 공유한다.
- 측정 없이 마이크로 최적화를 강요하지 않는다.
