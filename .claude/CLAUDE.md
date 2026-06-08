## 프로젝트 구조
- lib/ 의 폴더 구조는 features/home,info,menu,onboard,report,settings,splash 안에
data/, domain/, presentation/ 으로 나뉘어 있어.

- common에는 색상과 폰트 정보가 작성되어 있어.

- core/ 에는 데이터 베이스와 라우팅 정보가 작성되어 있어.

- shared/ 에는 프로젝트에서 공통으로 쓰일 data/, domain/, presentation/, utils/ 등이 작성되어 있어.

## 현재 단계
1. 유닛 테스트 [V]
2. 위젯 테스트 [V]
3. 통합 테스트 [V]

## 참고 문서
작업에 필요한 문서를 먼저 읽고 시작할 것.

| 파일 | 설명 | 언제 필요한가 |
|------|------|--------------|
| unit_test.md | 유닛 테스트 | 유닛 테스트 참고 시 | 
| widget_test.md | 위젯 테스트 | 위젯 테스트 참고 시 | 
| integration_test.md | 통합 테스트 | 통합 테스트 참고 시 | 

## 테스트 규칙
- test/ 디렉토리도 동일한 구조로 맞춰서 테스트 파일을 생성해줘.
예: lib/features/home/domain/usecases/home_chart_data.dart
 -> test/features/home/domain/usecases/home_chart_data.dart

- Mock은 Mockito를 사용하고 @GenerateMocks 어노테이션으로 자동 생성해.
- given/when/then 패턴으로 생성해.
- 테스트 이름은 한국어로 작성해.

## 주의사항
- go_router 사용 중
- flutter_screenutil 사용 중
- Riverpod 3.x 사용 중
- SQLite (sqflite) 사용 중
- Supabase는 Mock으로 처리
- 작성 전에 각 메서드별로 어떤 테스트 케이스를 작성할 건지 먼저 설명하고 나의 확인 후 작성 시작해줘.
- 작성 후 flutter test로 실행해서 통과 확인까지 해줘. 실패하면 스스로 수정해줘.
- 유닛 -> 위젯 -> 통합 순서로 테스트를 진행하고 한 단계가 완벽히 끝나면 현재 단계를 수정 후 다음 단계를 진행해줘.