import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:like_button/like_button.dart';

import '../examples/dummy_data.dart';
import '../widgets/swipe_card.dart';

class SwipePage extends StatefulWidget {
  const SwipePage({Key? key}) : super(key: key);

  @override
  State<SwipePage> createState() => _SwipePageState();
}

class _SwipePageState extends State<SwipePage> {
  // Use CardController this to trigger swap for example when super like.
  CardController cardController = CardController();
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
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
                if (orientation == CardSwipeOrientation.RIGHT ||
                    orientation == CardSwipeOrientation.LEFT) {
                  scrollController.jumpTo(
                      0.0); // NOTICE The SingleChildScrollView in SwipeCard widget doesn't reset position every time a new card is shown for some reason. So I have to do this.
                }

                /// Get orientation & index of swiped card!
              },
              cardController: cardController,
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
              buildSwipeButton(context, false),
              buildSwipeButton(context, true),
            ],
          ),
        ),
      ],
    );
  }

  LikeButton buildSwipeButton(BuildContext context, bool type) {
    bool likeController = false;
    double? buttonSize = MediaQuery.of(context).size.height * 0.08;
    return LikeButton(
      isLiked: likeController,
      likeCountPadding: EdgeInsets.all(0),
      size: buttonSize,
      animationDuration: Duration(milliseconds: 500),
      likeCountAnimationDuration: Duration(microseconds: 0),
      circleColor: CircleColor(
          start: Theme.of(context).colorScheme.tertiary,
          end: Theme.of(context).colorScheme.tertiary.withOpacity(0.5)),
      bubblesColor: BubblesColor(
        dotPrimaryColor: Theme.of(context).colorScheme.tertiary,
        dotSecondaryColor:
            Theme.of(context).colorScheme.tertiary.withOpacity(0.5),
      ),
      likeBuilder: (bool isLiked) {
        return Container(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(width: 2, color: Colors.white),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.3),
                blurRadius: 5,
                spreadRadius: 3,
              ),
            ],
          ),
          child: FittedBox(
            child: Icon(
              type ? Icons.favorite : Icons.close,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        );
      },
      onTap: (bool isLiked) async {
        type ? cardController.triggerRight() : cardController.triggerLeft();

        setState(() {
          likeController = false;
        });
        return !isLiked;
      },
    );
  }

  SwipeCard buildCard(BuildContext context, int index) {
    // TODO create an UNDO button by storing the list of cards for the session in a queue variable in this stateful widget and changing that queue with setState so that it rebuilds the swiper.

    Color cardColor;
    String cardName;
    int cardAge;
    switch (index) {
      case 0:
        cardColor = Colors.blue;
        break;
      case 1:
        cardColor = Colors.orange;
        break;
      case 2:
        cardColor = Colors.green;
        break;
      case 3:
        cardColor = Colors.purple;
        break;
      case 4:
        cardColor = Colors.cyan;
        break;
      default:
        cardColor = Colors.black;
    }

    return SwipeCard(
      cardColor: cardColor,
      matchOption: matchOptions[0],
      scrollController: scrollController,
    );
  }
}
