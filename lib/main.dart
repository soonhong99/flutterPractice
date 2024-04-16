import 'package:flutter/material.dart';

void main() {
  // const : 한번 값을 넣으면 변경할 수 없다.
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 사람들이 우리 앱의 home(widget)에 갔을 때 무엇을 보여줘야 할까?
      // class name constructor
      home: Scaffold(    
        backgroundColor: Color(0xFF181818),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 
          40),
          child: Column(
            children: [
              SizedBox(
                height: 30.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.
                end,
                children: [
                  Column(
                    crossAxisAlignment: 
                    CrossAxisAlignment.end,
                    children: [
                      Text('Hey, Selena',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text('Welcome back',
                        style: TextStyle(
                          color: Colors.white.
                          withOpacity(0.8),
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}


