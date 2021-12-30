import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';

class SwipePage extends StatelessWidget {
  const SwipePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use CardController this to trigger swap for example when super like.
    CardController cardController;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.red,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.85,
              child: TinderSwapCard(
                maxWidth: MediaQuery.of(context).size.width,
                maxHeight: MediaQuery.of(context).size.height * 0.8,
                minWidth: MediaQuery.of(context).size.width * 0.8,
                minHeight: MediaQuery.of(context).size.height * 0.79,
                orientation: AmassOrientation.TOP,
                animDuration: 500,
                totalNum: 5,
                stackNum: 3,
                cardBuilder: buildCard,
                swipeUpdateCallback:
                    (DragUpdateDetails details, Alignment align) {
                  // Get swiping card's alignment
                  if (align.x < 0) {
                    //Card is LEFT swiping
                  } else if (align.x > 0) {
                    //Card is RIGHT swiping
                  }
                },
                swipeCompleteCallback:
                    (CardSwipeOrientation orientation, int index) {
                  /// Get orientation & index of swiped card!
                },
                cardController: cardController = CardController(),
              ),
            ),
            Container(
              color: Colors.white.withOpacity(0.2),
              height: MediaQuery.of(context).size.height * 0.1,
            )
          ],
        ),
      ),
    );
  }
}

Container buildCard(BuildContext context, int index) {
  Color cardColor;
  String cardName;
  int cardAge;
  switch (index) {
    case 0:
      cardColor = Colors.blue;
      cardName = "William";
      cardAge = 22;
      break;
    case 1:
      cardColor = Colors.orange;
      cardName = "Alex";
      cardAge = 23;
      break;
    case 2:
      cardColor = Colors.green;
      cardName = "Bryan";
      cardAge = 22;
      break;
    case 3:
      cardColor = Colors.purple;
      cardName = "Matt";
      cardAge = 22;
      break;
    case 4:
      cardColor = Colors.cyan;
      cardName = "Lewis";
      cardAge = 22;
      break;
    default:
      cardColor = Colors.black;
      cardName = "Callan";
      cardAge = 32;
  }
  return Container(
    decoration: BoxDecoration(
      border: Border.all(color: Colors.red),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.9),
          spreadRadius: 3,
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
          child: Container(
            color: cardColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                cardName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text("$cardAge"),
              ElevatedButton(
                onPressed: () {},
                child: Text("View Profile"),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
