import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

void main() {
  // const : 한번 값을 넣으면 변경할 수 없다.
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 사람들이 우리 앱의 home(widget)에 갔을 때 무엇을 보여줘야 할까?
      // class name constructor
      home: Scaffold(    
        backgroundColor: const Color(0xFF181818),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 
          40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.
            start,
            children: [
              const SizedBox(
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
                      const Text('Hey, Selena',
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
              ),
              const SizedBox(
                height: 120,
              ),
              Text(
                'Total Balance',
                style:TextStyle(
                  fontSize: 22,
                  color: Colors.white.
                  withOpacity(0.8),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                '\$5 194 482',
                style:TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 48,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.
                      circular(45.0)
                    ),                    
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 50,
                      ),
                      child: Text(
                        'Transfer',
                        style:TextStyle(
                          color: Colors.black.
                          withOpacity(0.8),
                          fontSize: 18,
                          fontWeight: FontWeight.w800
                        )
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}


