import 'package:flutter/material.dart';

class SwipeCard extends StatelessWidget {
  const SwipeCard({
    Key? key,
    required this.cardColor,
    required this.cardName,
    required this.cardAge,
  }) : super(key: key);

  final Color cardColor;
  final String cardName;
  final int cardAge;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        color: Colors.red,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 2,
          ),
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: PageView(
              // TODO change this to scroll view maybe
              // TODO theres a bug when swiping it stays on the page u were on in the last card
              // TODO put bio + other pics here
              scrollDirection: Axis.vertical,
              children: [
                Container(
                  color: cardColor.withGreen(10),
                  child: const Center(
                    child: Text("test1"),
                  ),
                ),
                Container(
                  color: cardColor.withRed(10),
                  child: const Center(
                    child: Text("test2"),
                  ),
                ),
                Container(
                  color: cardColor.withBlue(10),
                  child: const Center(
                    child: Text("test3"),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.04,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  cardName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "$cardAge",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
