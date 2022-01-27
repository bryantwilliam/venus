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
          children: [
            Expanded(
              child: SizedBox(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.01,
                  ),
                  child: TinderSwapCard(
                    maxWidth: MediaQuery.of(context).size.width * 0.95,
                    minWidth: MediaQuery.of(context).size.width * 0.9,
                    maxHeight: MediaQuery.of(context).size.height * 0.8,
                    minHeight: MediaQuery.of(context).size.height * 0.6,
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
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.025,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 2,
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.close,
                      color: Colors.red,
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 2,
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
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
      border: Border.all(color: Colors.white),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.white.withOpacity(0.5),
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
          child: Container(
            color: cardColor,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              cardName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            Text(
              "$cardAge",
              style: TextStyle(
                color: Colors.red,
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("View Profile"),
            ),
          ],
        ),
      ],
    ),
  );
}
