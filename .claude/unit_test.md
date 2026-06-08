## 유닛 테스트

### 1-1. CaffeineCalculator
- lib/shared/utils/caffeine_calculator.dart 코드를 읽고 모든 메서드에 대한 유닛 테스트를 작성해줘.
- test/ 에 동일한 구조로 테스트 파일을 작성하고 실행한 뒤 통과 확인까지 해줘.

**기대 케이스:**
```
getHalfLife
 - 비흡연 남성: 5시간
 - 흡연 남성: 2.5시간
 - 비흡연 여성: 6시간
 - 흡연 여성: 3시간

getCurrentLevel
 - 기록 없으면 0 반환
 - 마신 직후(0분): 0에 가까움
 - 45분 후: caffeineAmount와 동일
 - 5시간 45분 후: 절반
 - 여러 기록 합산

getSleepTime
 - 25mg 이하면 지금 바로 수면 가능
 - 농도 높을수록 수면 가능 시간이 늦어짐
```

### 1-2. UseCase
lib/의 모든 UseCase 코드를 읽고 각 UseCase의 로직을 분석해서 테스트 케이스를 스스로 판단해서 작성해줘.
분석 시 아래의 사항을 고려해줘.
- 분기문 (if/switch)마다 케이스
- 빈 리스트, null 입력
- 경계값 (0, 음수, 최대값)
- 비즈니스 규칙(반감기, 목표량 초과 등)
