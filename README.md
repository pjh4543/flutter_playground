## 2021.03.12 Form 전송
 - Form with a GlobalKey(식별자)
 - key 를 전달해서, currentState 가 정의했던 FormState 의 validator 가 validate
## 2021.03.10 메모
 - git stash 현재 상태 저장 후, 최종 commit 상태로 들어옴
 - git stash apply 현재 상태 저장
 - git stash list, git stash show


## 2021.03.06 메모
 - class(초록색) 호출 뒤에는 항상 () or 속성
 - Scaffold( appBar: -- , body: -- ) 형태니 외워두는 게 좋을 듯
 - 포인트 : RasiedButton, 밋밋 :FlatButton
 - Scaffold.of 는 Scaffold 의 child 로 가야 context 를 받을 수 있다. 
   --> Builder( build ) 로 묶거나, Class 를 새로 따로 만들어야 함
## 2021.03.03 메모
- pub.dev 사이트 dart package
- pubspec.yaml 은 spring의 maven과 같은 느낌(dependency 추가)

성능/기능에 따라 2가지 종류로 나뉨
1. StatelessWidget  단순
2. StatefullWidget

코드 상세 분석
* MaterialApp : 전체적인 App 생성자, 성능을 좋게
  매개변수가 {} 에 있는 것은, 변수 선택적으로 전달
* Scaffold : App 화면
 
## 참조 Youbue - 코딩의신 - 플러터로 앱 출시까지
https://www.youtube.com/watch?v=2qMZ9bvoJZk&list=PLPtc9qD1979A8rRP0-YAUQMFImze5PnFN&index=4

# myapp

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
#   f l u t t e r _ p l a y g r o u n d 
 
 

