## 통합 테스트
integration_test/ 디렉토리에 필요하다고 판단되는 핵심 시나리오 통합 테스트를 작성해줘.

예시 시나리오:
1. 앱 시작 -> 홈 화면 표시 확인
2. 음료 추가 -> 카페인 총량 업데이트 확인
3. 검색 -> 음료 검색 -> 결과 표시 -> 선택 -> 기록 추가 확인

환경:
 - SQLite는 인메모리 DB로 교체 (:memory:)
 - Supabase는 Mock으로 처리 (동기화 스킵)
 - 실제 Riverpod Provider 사용

integration_test/app_test.dart에 작성하고
flutter test integration_test/ 로 통과 확인까지 해줘.