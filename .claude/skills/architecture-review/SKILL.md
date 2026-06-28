---
name: architecture-review
description: Flutter Clean Architecture 레이어 경계·의존성 방향·Riverpod 패턴을 검토하는 방법론. architecture-reviewer 에이전트가 사용. 아키텍처 리뷰, 레이어 위반 점검, 의존성 방향 검사, Provider 구조 검토 시 사용.
---

# Architecture Review — Clean Architecture 검토 방법론

이 프로젝트는 `lib/features/{name}/{data,domain,presentation}` + `lib/core` + `lib/shared` + `lib/common` 구조의 Clean Architecture다. 레이어 규칙이 지켜질 때만 구조가 가치를 갖는다.

## 검토 절차

1. **대상 파일의 import를 먼저 읽는다.** import 그래프가 의존성 방향의 진실이다.
2. 각 파일이 속한 레이어를 식별한다(경로로 판별: `/data/`, `/domain/`, `/presentation/`).
3. 아래 규칙 위반을 찾는다.
4. 발견을 `references/report-format.md` 포맷으로 `_workspace/01_architecture_review.md`에 기록한다.

## 검토 규칙

### 1. 레이어 의존성 방향
의존성은 안쪽으로만 흐른다: `presentation → domain ← data`. domain이 가장 안쪽.

- **domain은 순수해야 한다.** `domain/` 하위 파일이 `package:flutter`, `package:dio`, `package:sqflite`, `package:supabase` 등 프레임워크/외부 구현을 import하면 **High**. domain은 추상 인터페이스(`repositories/`)와 usecase, 엔티티만 갖는다.
- **presentation이 data 구현체를 직접 참조**하면 **High**. presentation은 domain의 추상(repository 인터페이스, usecase)에만 의존해야 한다. data의 구체 Repository 구현이나 model을 직접 쓰면 추상화가 무너진 것.
- data가 domain의 인터페이스를 구현(`implements`)하는 것은 정상. 역방향(domain이 data를 import)은 위반.

### 2. Repository 패턴
- `domain/repositories/`에 추상 인터페이스, `data/repositories/`에 구현이 쌍으로 존재하는가.
- usecase가 추상 인터페이스에 의존하는가(구현체 직접 참조는 위반).
- model(`data/models/`, freezed)과 entity(`domain/`)가 혼용되어 presentation까지 data model이 새어나오는지 확인. (실용적 판단: 소규모 feature에서 model을 그대로 쓰는 것이 만연하면 일관성 차원에서 Medium으로, 일부만 그러면 위반으로.)

### 3. Riverpod 패턴 (3.x)
- **Provider 정의 일관성**: `@riverpod` 코드젠(`*.g.dart` 동반)과 수동 Provider가 섞여 있으면 일관성 Medium. 프로젝트의 지배적 방식을 기준으로 일탈을 본다.
- **`ref.watch` vs `ref.read`**: build/위젯 구독에는 `watch`, 콜백/이벤트 핸들러 1회성 접근에는 `read`. 콜백에서 `watch`, build에서 부수효과 목적 `read`는 위반.
- **autoDispose / keepAlive**: 화면 종속 상태가 autoDispose 없이 전역으로 남으면 메모리·정합성 문제. 의도적 캐싱(`keepAlive`)인지 구분.
- **Provider 간 의존**: 한 Provider가 다른 Provider를 `watch`하는 그래프가 순환하거나 과도하게 얽혀 있는지.

### 4. core / shared 경계
- `core/`(db, routes, supabase)와 `shared/`(공통 data/domain/presentation/utils)가 feature에 역의존하지 않는가. core/shared는 feature를 몰라야 한다.
- feature 간 직접 의존(`features/home`이 `features/report`를 import)은 결합도 신호 — **Medium** 이상, `shared`로 추출 검토.

## 심각도 기준

- **High**: 레이어 의존성 역류, domain의 프레임워크 오염, presentation→data 직접 결합
- **Medium**: Repository 패턴 부분 위반, Riverpod 일관성 결여, feature 간 결합
- **Low**: 사소한 위치 부적절, 개선 여지(필수 아님)

## 주의

- 단정 전 실제 import/클래스 정의를 읽는다. 추측 금지.
- 단일 사용처에 추상화를 강요하지 않는다(과설계 경계). 프로젝트 규모에 맞는 실용적 판단.
- 발견이 성능에 영향을 주면 performance-reviewer에게 공유한다(팀 통신 프로토콜).
