import 'package:flutter/material.dart';

class CurrencyCard extends StatelessWidget {
  const CurrencyCard(
      {super.key,
      required this.name,
      required this.code,
      required this.amount,
      required this.icon,
      required this.isInverted});

  final String name, code, amount;
  final IconData icon;
  final bool isInverted;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          color: isInverted ? Colors.white : const Color(0xFF1F2123),
          borderRadius: BorderRadius.circular(25.0)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                      color: isInverted ? Colors.black : Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w800),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      amount,
                      style: TextStyle(
                          color: isInverted ? Colors.black : Colors.white,
                          fontSize: 20),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      code,
                      style: TextStyle(
                          color: isInverted
                              ? Colors.black
                              : Colors.white.withOpacity(0.8),
                          fontSize: 20),
                    )
                  ],
                ),
              ],
            ),
            Transform.scale(
              scale: 2,
              child: Transform.translate(
                offset: const Offset(-5, 10),
                child: Icon(
                  icon,
                  color: isInverted ? Colors.black : Colors.white,
                  size: 85,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
