import 'package:flutter/material.dart';
import 'package:toonflix/screens/home_screen.dart';
// UserAgent 초기화 작업. - 1
// import 'dart:io';

void main() {
  // UserAgent 초기화 작업. - 2
  // HttpOverrides.global = MyHttpOverrides();

  // const : 한번 값을 넣으면 변경할 수 없다.
  runApp(const App());
}

// UserAgent 초기화 작업. - 3
// class MyHttpOverrides extends HttpOverrides {
//   @override
//   HttpClient createHttpClient(SecurityContext? context) {
//     return super.createHttpClient(context)
//       ..userAgent =
//           'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36';
//   }
// }

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
