import 'package:age_calculator/age_calculator.dart';
import 'package:flutter/material.dart';

class MatchOption {
  final String id;
  final String name;
  late final DateTime _birthday;
  get age => AgeCalculator.age(_birthday).years;
  late final String
      distanceKMs; // TODO store this in the server as a location but the client object should only be the distance for security.
  late final String distanceMiles;
  final Gender gender;
  final String? bio;
  final List<Interest>? interests;
  late final String? pronouns;
  final ActiveLevel? activeLevel;
  final Height? height;
  final String? work;
  final String?
      education; // TODO Change to an education object with type of degree, graduation year and school name
  final String?
      homeLocation; // TODO change this to some gps or google maps location object with a map icon
  final Vice? drinking;
  final Vice? smoking;
  final LookingFor? lookingFor;
  final Kids? kids;
  late final StarSign? starSign;
  final Politics? politics;
  final Religion? religion;

  // TODO implement prompts - make a prompts object with an answer and preset question enum
  // TODO instagram
  // TODO spotify
  // TODO pictures

  MatchOption({
    required this.id,
    required this.name,
    required DateTime birthday,
    required int distanceKMs,
    required this.gender,
    this.bio,
    this.interests,
    List<String>? pronouns,
    this.activeLevel,
    this.height,
    this.work,
    this.education,
    this.homeLocation,
    this.drinking,
    this.smoking,
    this.lookingFor,
    this.kids,
    bool showStarSign = false,
    this.politics,
    this.religion,
  }) {
    _birthday = birthday;
    String pronounsStr = pronouns.toString();
    this.pronouns =
        pronounsStr.substring(1, pronounsStr.length - 1).replaceAll(", ", "/");

    starSign = showStarSign ? StarSign(_birthday) : null;

    this.distanceKMs = "$distanceKMs km away";

    distanceMiles =
        "${distanceKMs == 0 ? 0 : (distanceKMs / 1.609).round()} miles away";
  }
}

enum Gender {
  male,
  female,
  other,
}

class Interest {
  String name;
  IconData icon; // TODO Convert this to an image later (as seen on bumble)

  Interest(this.name, this.icon);
}

class Height {
  final int _heightCM;
  Height(this._heightCM);

  String get heightCM => "$_heightCM cm";

  String get heightFtNIn {
    double totalFeet = _heightCM / 30.48;
    int feet = totalFeet.floor();
    int inches = ((totalFeet % 1) * 12).round();
    return "$feet'$inches";
  }
}

enum ActiveLevel {
  active,
  sometimes,
  almostNever,
}

enum Vice {
  socially,
  frequently,
  never,
}

enum LookingFor {
  relationship,
  notSure,
  casual,
}

enum Kids {
  want,
  dontWant,
  haveAndWantMore,
  haveAndDontWantMore,
  notSure,
}

class StarSign {
  late String name;
  late IconData icon; // TODO change this to an image of the star sign later

  StarSign(_birthday) {
    var days = _birthday.day;
    var months = _birthday.month;
    if (months == 1) {
      if (days >= 21) {
        name = "Aquarius";
        icon = Icons.star;
      } else {
        name = "Capricorn";
        icon = Icons.star;
      }
    } else if (months == 2) {
      if (days >= 20) {
        name = "Pisces";
        icon = Icons.star;
      } else {
        name = "Aquarius";
        icon = Icons.star;
      }
    } else if (months == 3) {
      if (days >= 21) {
        name = "Aries";
        icon = Icons.star;
      } else {
        name = "Pisces";
        icon = Icons.star;
      }
    } else if (months == 4) {
      if (days >= 21) {
        name = "Taurus";
        icon = Icons.star;
      } else {
        name = "Aries";
        icon = Icons.star;
      }
    } else if (months == 5) {
      if (days >= 22) {
        name = "Gemini";
        icon = Icons.star;
      } else {
        name = "Taurus";
        icon = Icons.star;
      }
    } else if (months == 6) {
      if (days >= 22) {
        name = "Cancer";
        icon = Icons.star;
      } else {
        name = "Gemini";
        icon = Icons.star;
      }
    } else if (months == 7) {
      if (days >= 23) {
        name = "Leo";
        icon = Icons.star;
      } else {
        name = "Cancer";
        icon = Icons.star;
      }
    } else if (months == 8) {
      if (days >= 23) {
        name = "Virgo";
        icon = Icons.star;
      } else {
        name = "Leo";
        icon = Icons.star;
      }
    } else if (months == 9) {
      if (days >= 24) {
        name = "Libra";
        icon = Icons.star;
      } else {
        name = "Virgo";
        icon = Icons.star;
      }
    } else if (months == 10) {
      if (days >= 24) {
        name = "Scorpio";
        icon = Icons.star;
      } else {
        name = "Libra";
        icon = Icons.star;
      }
    } else if (months == 11) {
      if (days >= 23) {
        name = "Sagittarius";
        icon = Icons.star;
      } else {
        name = "Scorpio";
        icon = Icons.star;
      }
    } else if (months == 12) {
      if (days >= 22) {
        name = "Capricorn";
        icon = Icons.star;
      } else {
        name = "Sagittarius";
        icon = Icons.star;
      }
    }
  }
}

enum Politics {
  apolitical,
  moderate,
  liberal,
  conservative,
}

enum Religion {
  agnostic,
  atheist,
  buddhist,
  catholic,
  christian,
  hindu,
  jain,
  jewish,
  mormon,
  muslim,
  zoroastrian,
  sikh,
  spiritual,
  other,
}

extension MatchOptionEnum on Enum {
  /// **Examples:**
  ///
  /// - `Enum.testTesting.parseNameForMatchOption` > `"Testing testing"`
  ///
  /// - `Enum.test.parseNameForMatchOption` > `"Test"`
  ///
  /// - `Enum.dontTest.parseNameForMatchOption` > `"Don't test"`
  ///
  /// - `Enum.testDontDo.parseNameForMatchOption` > `"Test don't do"`
  String get parseNameForMatchOption {
    String name = "";

    var chars = toString().split('.').last.characters;
    for (var cI = 0; cI < chars.length; cI++) {
      String char = chars.elementAt(cI);
      if (cI == 0) {
        // if first letter
        char = char.toUpperCase();
      } else if (char == char.toUpperCase()) {
        // if new word
        char = " " + char.toLowerCase();
      }
      name += char;
    }

    // add ' to the word dont
    name = name.replaceAll("Dont ", "Don't ").replaceAll(" dont ", " don't ");
    if (name.endsWith(" dont") || name == "Dont") {
      name = name.replaceRange(name.length - 1, null, "'t");
    }
    return name;
  }
}
