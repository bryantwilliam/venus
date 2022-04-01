import 'package:flutter/material.dart';

import '../models/match_option.dart';

class SwipeCard extends StatelessWidget {
  const SwipeCard({
    Key? key,
    required this.cardColor,
    required this.matchOption,
    required this.scrollController,
  }) : super(key: key);

  final Color cardColor;
  final MatchOption matchOption;
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
                // TODO lay it out better later
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
                      child: Column(
                        children: [
                          Text(
                            "Placeholder Bio Section",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                          Text(
                            "Distance in KM: ${matchOption.distanceKMs}",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                          Text(
                            "Distance in miles: ${matchOption.distanceMiles}",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                          Text(
                            "Gender: ${matchOption.gender.parseNameForMatchOption}",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                          if (matchOption.bio != null)
                            Text(
                              "Bio: ${matchOption.bio}",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                          Text(
                            "Interests:",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                          if (matchOption.interests != null)
                            ...matchOption.interests!
                                .map(
                                  (interest) => Row(
                                    children: [
                                      Text(
                                        interest.name,
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                        ),
                                      ),
                                      Icon(
                                        interest.icon,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                      ),
                                    ],
                                  ),
                                )
                                .toList(),
                          if (matchOption.pronouns != null)
                            Text(
                              "Pronouns: ${matchOption.pronouns}",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                          if (matchOption.activeLevel != null)
                            Text(
                              "Active Level: ${matchOption.activeLevel!.parseNameForMatchOption}",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                          if (matchOption.height != null)
                            Text(
                              "Height in CM: ${matchOption.height!.heightCM}",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                          if (matchOption.height != null)
                            Text(
                              "Height in Ft: ${matchOption.height!.heightFtNIn}",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                          if (matchOption.work != null)
                            Text(
                              "Work: ${matchOption.work}",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                          if (matchOption.education != null)
                            Text(
                              "Education: ${matchOption.education}",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                          if (matchOption.homeLocation != null)
                            Text(
                              "Home: ${matchOption.homeLocation}",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                          if (matchOption.drinking != null)
                            Text(
                              "Drinking: ${matchOption.drinking!.parseNameForMatchOption}",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                          if (matchOption.smoking != null)
                            Text(
                              "Smoking: ${matchOption.smoking!.parseNameForMatchOption}",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                          if (matchOption.lookingFor != null)
                            Text(
                              "Looking for: ${matchOption.lookingFor!.parseNameForMatchOption}",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                          if (matchOption.kids != null)
                            Text(
                              "Kids: ${matchOption.kids!.parseNameForMatchOption}",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                          Text(
                            "Star sign:",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                          if (matchOption.starSign != null)
                            Row(
                              children: [
                                Text(
                                  matchOption.starSign!.name,
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                                ),
                                Icon(
                                  matchOption.starSign!.icon,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                              ],
                            ),
                          if (matchOption.politics != null)
                            Text(
                              "Politics: ${matchOption.politics!.parseNameForMatchOption}",
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.secondary),
                            ),
                          if (matchOption.religion != null)
                            Text(
                              "Religion: ${matchOption.religion!.parseNameForMatchOption}",
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.secondary),
                            ),
                        ],
                      ),
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
                  matchOption.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                Text(
                  "${matchOption.age}",
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
