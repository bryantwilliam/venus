import 'package:flutter/material.dart';

class SwipeCard extends StatelessWidget {
  const SwipeCard({
    Key? key,
    required this.cardColor,
    required this.cardName,
    required this.cardAge,
    required this.scrollController,
  }) : super(key: key);

  final Color cardColor;
  final String cardName;
  final int cardAge;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.primary),
        color: Theme.of(context).colorScheme.primary,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow,
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
            child: LayoutBuilder(
              builder: (context, constraints) => SingleChildScrollView(
                controller: scrollController,
                // TODO put bio + other pics here
                child: Column(
                  children: [
                    Container(
                      height: constraints.maxHeight,
                      color: cardColor.withGreen(10),
                      child: const Center(
                        child: Text("Placeholder Picture 1"),
                      ),
                    ),
                    Container(
                      color: Theme.of(context).colorScheme.primary,
                      child: Center(
                        child: Text(
                          "Placeholder Bio Section",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary),
                        ),
                      ),
                      height: constraints.maxHeight * 0.5,
                    ),
                    Container(
                      height: constraints.maxHeight,
                      color: cardColor.withRed(10),
                      child: const Center(
                        child: Text("Placeholder Picture 2"),
                      ),
                    ),
                    Container(
                      height: constraints.maxHeight,
                      color: cardColor.withBlue(10),
                      child: const Center(
                        child: Text("Placeholder Picture 3"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  cardName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                Text(
                  "${cardAge}",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
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
