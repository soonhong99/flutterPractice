import 'package:flutter/material.dart';
import 'widgets/button.dart';

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
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        'Hey, Selena',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        'Welcome back',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 80,
              ),
              Text(
                'Total Balance',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                '\$5 194 482',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 44,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Button(
                      text: 'Transfer',
                      bgcolor: Color(0xFFF1B33B),
                      textcolor: Colors.black),
                  Button(
                      text: 'Request',
                      bgcolor: Color(0xFF1F2123),
                      textcolor: Colors.white),
                ],
              ),
              const SizedBox(
                height: 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Wallets',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'View all',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    color: const Color(0xFF1F2123),
                    borderRadius: BorderRadius.circular(25.0)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Euro',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w800),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const Text(
                                '6 428',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                'EUR',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.8),
                                    fontSize: 20),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
