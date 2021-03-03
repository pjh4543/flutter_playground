import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class Person {
  int age;
  String name;

  // Person(int age, String name) {
  //   this.age = age;
  //   this.name = name;
  // }
  // 위에 문법이 아래 걸로 편하게 치환.
  Person(this.age, this.name);

// 이런식의 문법도 가능 setter
  // Person.age(int age) {
  //   this.age = age;
  //   this.name = '손님';
  // }

  // 를 이렇게 바꿀 수도 있음
  Person.age(int age) : this(age, '길동'); //위 Person(this.age, this.name)

  void study() {
    print('$name($age)가 study 중');
  }

  int get launchYear {
    Person p;
    return p?.age; // p가 null 이 아닐 경우에만 출력, 이경우 미출력
  }

  //Dart 에는 interface 가 없지만, impletement 로 재정의 해야하다.

}

void practice() {
  // Data type
  bool isVisible = true;
  int number = 17;
  int number_ahrt = 17 ~/ 4; // smae 17/4
  int number_percnet = 17 % 4;
  double pi = 3.14;
  String name = '홍';
  List args = [10, 11, 13];
  print(args[0]);
  for (var age in args) {
    print(age);
  }

  Map Person = {'key': 'value', 'name': '홍길동'};
  //final , const , final 은 최초1회변경은 가능, const 선언과 동시에 끝

  print(isVisible);

  //lamda function
  List ages = [11, 31, 40];
  List names = ['john', 'Kate'];
  var filtered = ages.where((age) => age >= 13);
  // ages.where((age) => age >= 13).forEach(print);
  // ages.where((age) => age.contains(11)).forEach(print);
  // names.where((name) => name.contains('john')).forEach(print);

  // Future , Stream Class는 비동기에 사용하니 추가로 공부할 것
}

void main() => runApp(MyApp());

//State Class 의
class RandomWordsState extends State<RandomWords> {
  //list 변수
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    // final wordPair = WordPair.random();
    // return Text(wordPair.asPascalCase);

    // Scaffold 는 State 에서 만드데, 값이 계속 바뀜
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();

          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }
}

// StatefullWidget 사용 시 2개 Class 필요, 구조 외우잔
class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final wordPair = WordPair.random();
    return MaterialApp(
        title: 'Welcome to Flutter MaterialApp',
        // Statless 였는데 statefull 이 가져감
        home: RandomWords());
  }
}
