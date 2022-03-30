import 'package:flutter/material.dart';

import '../models/match_option.dart';

List<MatchOption> matchOptions = [
  MatchOption(
    id: "uniqueID123456",
    name: "William",
    birthday: DateTime(1999, 10, 21),
    distanceKMs: 0,
    gender: Gender.male,
    bio: "Test bio",
    interests: [
      Interest("Gym", Icons.sports_gymnastics),
    ],
    pronouns: [
      "he",
      "him",
    ],
    activeLevel: ActiveLevel.active,
    height: Height(174),
    work: "Developer",
    education: "Masters in Computer Science",
    homeLocation: "Auckland",
    drinking: Vice.socially,
    smoking: Vice.never,
    lookingFor: LookingFor.notSure,
    kids: Kids.notSure,
    showStarSign: true,
    politics: Politics.moderate,
    religion: Religion.agnostic,
  ),
  /*MatchOption(),
  MatchOption(),
  MatchOption(),
  MatchOption(),*/
];
