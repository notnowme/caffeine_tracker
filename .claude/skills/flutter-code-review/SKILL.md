---
name: flutter-code-review
description: caffeine_tracker 프로젝트의 종합 코드 리뷰를 수행하는 오케스트레이터. 아키텍처(Clean Architecture 레이어·Riverpod)·성능 병목(리빌드·DB·async)·코드 스타일(flutter analyze·일관성) 3개 축을 전문 리뷰어 팀으로 동시 검토하고 종합 리포트를 만든다. "코드 리뷰", "종합 리뷰", "아키텍처/성능/스타일 검토", "리뷰 다시/재실행/업데이트", "이 feature만 리뷰", "diff 리뷰", "변경분 검토" 요청 시 반드시 사용. 단순 단일 파일 질문은 직접 응답 가능.
---

# Flutter Code Review — 종합 코드 리뷰 오케스트레이터

caffeine_tracker(Flutter Clean Architecture) 프로젝트를 **아키텍처 · 성능 · 코드 스타일** 3개 축으로 동시에 리뷰하고 종합 리포트를 만든다. 3명의 전문 리뷰어로 구성된 **에이전트 팀**이 병렬 리뷰하며 발견을 교차 공유한다.

**실행 모드:** 에이전트 팀 (팬아웃/팬인 + 합의 통합)

## 팀 구성

| 에이전트 | 타입 | 스킬 | 산출물 |
|---------|------|------|--------|
| `architecture-reviewer` | general-purpose | architecture-review | `_workspace/01_architecture_review.md` |
| `performance-reviewer` | general-purpose | performance-review | `_workspace/02_performance_review.md` |
| `style-reviewer` | general-purpose | style-review | `_workspace/03_style_review.md` |

모든 Agent 호출에 **`model: "opus"`** 를 명시한다. 리드(이 스킬을 실행하는 메인)가 범위 설정·팀 조율·종합 리포트 작성을 담당한다.

## Phase 0: 컨텍스트 확인

워크플로우 시작 시 실행 모드를 판별한다.

1. `_workspace/` 존재 여부 확인.
   - **미존재** → 초기 실행 (Phase 1로)
   - **존재 + 사용자가 부분 수정/특정 영역 재요청** → 부분 재실행 (해당 리뷰어만 재호출, 나머지 산출물 유지)
   - **존재 + 새 리뷰 범위/새 입력** → 새 실행 (`_workspace/`를 `_workspace_prev/`로 이동 후 초기 실행)
2. 사용자 요청에서 후속 신호("다시", "재실행", "업데이트", "이 부분만")를 읽어 위 분기를 결정한다.

## Phase 1: 범위 결정

리뷰 대상을 확정한다. **기본은 변경분(diff) 우선.**

1. 사용자가 범위를 지정했으면 그대로 사용(특정 파일/feature/전체).
2. 미지정이면 **변경분**을 기본 대상으로 한다:
   ```bash
   git diff --name-only HEAD
   git diff --name-only --cached
   git status --porcelain
   ```
   - 변경된 `.dart` 파일(`*.g.dart`, `*.freezed.dart` 생성물 제외)을 대상으로 한다.
   - 변경분이 없으면 사용자에게 전체 리뷰 여부를 확인한다.
3. 대상 파일 목록과 범위를 `_workspace/00_scope.md`에 기록한다(없으면 `_workspace/` 생성).

> `_workspace/`는 중간 산출물 보존용. 최종 종합 리포트만 사용자 지정 경로(기본: 콘솔 + `_workspace/00_summary.md`)에 출력한다.

## Phase 2: 팀 구성 및 병렬 리뷰

`TeamCreate`로 3인 팀을 구성하고 각 리뷰어에게 작업을 할당한다.

1. **TeamCreate** — 멤버: architecture-reviewer, performance-reviewer, style-reviewer.
2. **TaskCreate** — 각 리뷰어에게 `_workspace/00_scope.md`의 파일 목록을 동일하게 전달하고, 각자의 스킬에 따라 리뷰 후 지정 산출물 파일을 쓰도록 지시.
3. 리뷰어들은 병렬로 작업하며, 영역 교차 발견은 `SendMessage`로 직접 공유한다(예: 아키텍처 위반→성능 영향).
4. 리드는 진행을 모니터링하고, 세 산출물(`01`, `02`, `03`)이 모두 완성되면 다음 Phase로.

> 팀 도구를 쓸 수 없는 환경이면 **서브 에이전트 폴백**: `Agent` 도구로 세 리뷰어를 각각 `run_in_background: true`, `model: "opus"`로 호출하고 반환·산출물을 수집한다. 교차 공유는 리드가 종합 단계에서 병합한다.

## Phase 3: 종합 리포트

세 리뷰어 산출물을 병합해 종합 리포트를 작성한다.

1. `01/02/03` 리포트를 읽는다.
2. `references/report-format.md`의 "종합 리포트 구조"에 따라 작성:
   - 심각도별 총계, 영역 교차 우선순위 Top, 영역별 발견 요약, 교차 이슈, 상충/미해결, 권장 액션 순서.
3. **교차 발견 강조**: 같은 파일/원인을 여러 리뷰어가 다른 각도로 지적한 항목을 묶어 우선순위 상단에 둔다.
4. `_workspace/00_summary.md`에 저장하고, 핵심 요약을 사용자에게 콘솔로 보고한다.
5. 팀을 정리한다.

## 데이터 전달 프로토콜

- **태스크 기반**(TaskCreate/Update): 리뷰 작업 할당·진행 추적.
- **파일 기반**(`_workspace/`): 모든 산출물. 파일명 컨벤션 `{순번}_{역할}_{산출물}.md`.
- **메시지 기반**(SendMessage): 리뷰어 간 영역 교차 발견 실시간 공유.

## 에러 핸들링

- 리뷰어 1명이 실패하면 1회 재시도. 재실패 시 해당 영역 없이 진행하고 종합 리포트에 **누락 명시**.
- 리뷰어 간 발견이 상충하면 삭제하지 않고 **출처 병기**(종합 리포트 "상충/미해결").
- `flutter analyze` 실행 실패(환경)는 style 리뷰어가 정적 읽기로 폴백, 사유 명시.
- `git diff`가 비면 사용자에게 범위를 확인(자의적 전체 리뷰 금지).

## 테스트 시나리오

**정상 흐름**: 사용자가 "변경분 코드 리뷰해줘" → Phase 1에서 `git diff`로 변경 `.dart` 추출 → 3인 팀 병렬 리뷰 → 교차 공유 → 종합 리포트 보고. 기대: 각 영역 산출물 3개 + 종합 1개 생성, High 항목이 우선순위 상단.

**에러 흐름**: performance-reviewer가 실패 → 1회 재시도 후 재실패 → 아키텍처·스타일 리포트만으로 종합 작성, "성능 리뷰 누락(에이전트 실패)" 명시. 기대: 부분 산출물로도 리포트 생성, 누락 투명 보고.

**후속 흐름**: "report feature만 다시 리뷰" → Phase 0에서 부분 재실행 판별 → 대상 범위를 report feature로 좁혀 3인 재호출, 기존 타 범위 산출물 유지.
