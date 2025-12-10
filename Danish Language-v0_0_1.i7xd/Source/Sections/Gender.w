Gender.

Handling gender.

@h Gender.
=
Volume - Gender

@ Danish has two grammatical genders: Common gender (fælleskøn) and neuter gender (intetkøn). All common nouns have a grammatical gender. Nouns are inflected based on the grammatical gender, as are adjectives.

The GNA (Gender, Number, Animation) is set in //DanishLanguageKit//. To get an object's GNA, we follow this algorithm:

(*) If the object is animate (ie. it is a person, in Inform parlance, which includes animals), and it is not neuter, then we set its grammatical gender according to its natural gender.
(*) If the object is inanimate, or it's animate and neuter, we use its grammatical gender.

@define NO_KNOWN_GENDERS 3
@define COMMON_GENDER 1
@define NEUTER_GENDER 2
@define FEMININE_GENDER 3

=
Include (-
[ GetGNAOfObject obj case gender;

    if (obj has animate && obj hasnt neuter) {
        if (obj has male) gender = male;
        if (obj has female) gender = female;
    } else {
        case = 6;
        if (obj.grammatical_gender == 1) gender = common; ![ TODO it probably makes stuff messed up that we reordered these ]
        if (obj.grammatical_gender == 2) gender = neuter;
        ! if (obj.grammatical_gender == COMMON_GENDER) gender = common;
        ! if (obj.grammatical_gender == NEUTER_GENDER) gender = neuter;
    }

    if (gender == 0) {
        if (case == 0) gender = LanguageAnimateGender;
        else gender = LanguageInanimateGender;
    }

    ! if (gender == female)   case = case + 1;
    if (gender == neuter)   case = case + 2;
    if (obj has pluralname) case = case + 3;
    return case;
];
-) replacing "GetGNAOfObject" [ (in CommandParserKit) ].
