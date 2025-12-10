Language.

The fundamental definitions needed by the parser and the verb
library in order to specify Danish as the language of play -- that is, the
language used for communications between the story file and the player.

@h Initialisation.

It used to be optional whether or not to include a function of this name in
a language kit: it's now compulsory, even when (as now) it does nothing.

=
[ LanguageInitialise; ];

@h Vocabulary.

Here we define a collection of words (and their abbreviations) that the Inform
parser needs to recognize at a low level.

=
Constant AGAIN1__WD     = 'igen';
Constant AGAIN2__WD     = 'g//';
Constant AGAIN3__WD     = 'atter';
Constant OOPS1__WD      = 'ups';
Constant OOPS2__WD      = 'o//';
Constant OOPS3__WD      = 'hovsa';
Constant UNDO1__WD      = 'undo';
Constant UNDO2__WD      = 'undo';
Constant UNDO3__WD      = 'undo';

Constant ALL1__WD       = 'all';
Constant ALL2__WD       = 'each';
Constant ALL3__WD       = 'every';
Constant ALL4__WD       = 'everything';
Constant ALL5__WD       = 'both';
Constant AND1__WD       = 'og';
Constant AND2__WD       = '&';
Constant AND3__WD       = 'og';
Constant BUT1__WD       = 'undtagen';
Constant BUT2__WD       = 'uden';
Constant BUT3__WD       = 'bortset fra';
Constant BY__WD         = 'af';
Constant ME1__WD        = 'mig';
Constant ME2__WD        = 'mig selv';
Constant ME3__WD        = 'selv';
Constant OF1__WD        = 'of';
Constant OF2__WD        = 'of';
Constant OF3__WD        = 'of';
Constant OF4__WD        = 'of';
Constant OTHER1__WD     = 'another';
Constant OTHER2__WD     = 'other';
Constant OTHER3__WD     = 'other';
Constant THEN1__WD      = 'then';
Constant THEN2__WD      = 'then';
Constant THEN3__WD      = 'then';

Constant NO1__WD        = 'n//';
Constant NO2__WD        = 'nej';
Constant NO3__WD        = 'nej';
Constant YES1__WD       = 'j//';
Constant YES2__WD       = 'ja';
Constant YES3__WD       = 'jo';

Constant AMUSING__WD    = 'amusing';
Constant FULLSCORE1__WD = 'fullscore';
Constant FULLSCORE2__WD = 'full';
Constant QUIT1__WD      = 'q//';
Constant QUIT2__WD      = 'quit';
Constant RESTART__WD    = 'restart';
Constant RESTORE__WD    = 'restore';

@h Pronouns.

Danish only has two grammatical genders: common and neuter. However, Informese
supports three: male (masculine), female (feminine) and neuter. We have left
support for the feminine grammaticle gender here, even though it's not used in
Danish. This could, for example, be used to easily port this kit to Norwegian.

Since Danish common gender is a fusion of masculine and feminine, and since it
is identical to the historical masculine, we simply use male here for the
common gender.

@h GNA.

A "GNA" is a combination of Gender (masculine, feminine or neuter), Number
(singular or plural) and Animation (animate or inanimate).

@h Nominative pronouns.

=
Array LanguagePronouns table

  ! word        possible GNAs                   connected
  !             to follow:                      to:
  !             a     i
  !             s  p  s  p
  !             mfnmfnmfnmfn

    'ham'     $$100000000000                    NULL
    'hende'   $$010000000000                    NULL
    'den'     $$000000110000                    NULL
    'det'     $$000000001000                    NULL
    'dem'     $$000111000111                    NULL;

@h Descriptors.

=
Array LanguageDescriptors table

  ! word        possible GNAs   descriptor      connected 
  !             to follow:      type:           to:
  !             a     i
  !             s  p  s  p
  !             mfnmfnmfnmfn

    'min'     $$110000110000    POSSESS_PK      0
    'mit'     $$001000001000    POSSESS_PK      0
    'mine'    $$000111000111    POSSESS_PK      0
    'denne'   $$110000110000    POSSESS_PK      0
    'dette'   $$001000001000    POSSESS_PK      0
    'disse'   $$000111000111    POSSESS_PK      0
    'hans'    $$111111111111    POSSESS_PK      'ham'
    'hendes'  $$111111111111    POSSESS_PK      'hende'
    'deres'   $$111111111111    POSSESS_PK      'dem'
    'dens'    $$111111111111    POSSESS_PK      'den'
    'dets'    $$111111111111    POSSESS_PK      'det'
    'den'     $$110000110000    DEFART_PK       NULL
    'det'     $$001000001000    DEFART_PK       NULL
    'de'      $$000111000111    DEFART_PK       NULL
    'en'      $$110000110000    INDEFART_PK     NULL
    'et'      $$001000001000    INDEFART_PK     NULL
    'nogen'   $$000111000111    INDEFART_PK     NULL ! Usually "nogle" will be the correct indefinite article,
    'nogle'   $$000111000111    INDEFART_PK     NULL ! but we support "nogen" as well just to be sure
    'lit'     $$111111111111    LIGHTED_PK      NULL
    'lighted' $$111111111111    LIGHTED_PK      NULL
    'unlit'   $$111111111111    UNLIGHTED_PK    NULL;

@h Numbers.

This makes the parser recognize these written numbers.

=
Array LanguageNumbers table
    'en' 1 'én' 1 'ét' 1 'een' 1 'eet' 1 'to' 2 'tre' 3 'fire' 4 'fem' 5
    'seks' 6 'syv' 7 'otte' 8 'ni' 9 'ti' 10
    'elleve' 11 'tolv' 12 'tretten' 13 'fjorten' 14 'femten' 15
    'seksten' 16 'sytten' 17 'atten' 18 'nitten' 19 'tyve' 20
    'enogtyve' 21 'toogtyve' 22 'treogtyve' 23 'fireogtyve' 24
    'femogtyve' 25 'seksogtyve' 26 'syvogtyve' 27 'otteogtyve' 28
    'niogtyve' 29 'tredive' 30 'tredve' 30
;

@h Time.

This prints the time of day as if on a "digital clock", ie. in a 24-hour
format.

=
[ LanguageTimeOfDay hours mins;
    print hours/10, hours%10, ":", mins/10, mins%10;
];

@h Directions.

This routine takes a direction and gives the corresponding adverbial form.
=
[ LanguageDirection d;
    if (d.name == "nord" or "øst" or "vest" or "syd")
        print (name) d, "på";
    else if (d.name == "op" or "ned")
        print (name) d, "ad";
    else if (d.name == "ud")
        print (name) d, "enfor";
    else if (d.name == "ind")
        print (name) d;
    else
        print "mod ", (name) d;
];

@h Translation.
These "callback" functions are called by Inform when needed.

=
[ LanguageToInformese;

    ! TODO: Is this needed?
    ! https://www.inform-fiction.org/manual/html/s36.html

];

[ LanguageRefers obj wnum;

    ! Inflect? What is indirect_parser_inflection ?

    return -1;
];

@h Inflecting adjectives.

In English, Inform does not care about the difference between an adjective that
is part of a noun's name, and a compound noun. It doesn't need to.

A "hot dog" is semantically ambiguous -- it can either be a warm feline or a
specific type of sausage -- but syntactically it doesn't matter, since
adjectives aren't inflected in English.

(Adjectives in English do inflect for degrees of comparison, so the dog can get
hotter and hottest, which Inform does support -- see //DanishLanguage// -- but not
when printing adjectives that are part of a noun's name.)

So in English, Inform simply inflects the last word in a noun's name for
number, and leaves all other words alone: a hot dog, the hot dog, some hot
dogs.

In Danish, however, we need to inflect adjectives for gender and
number/definiteness (an adjective inflected in the definite or in the plural
looks the same).

=
[ LanguagePrintShortName obj;

    ! Inflect words as adjectives ! TODO

    rfalse;
];

@h Default genders.

The default animate gender might as well be male, as it is in English Inform,
although there are more female Danes than male. Let's chalk it up to
"historical reasons".
=
Constant LanguageAnimateGender   = male;

@ The default inanimate gender is the common grammatical gender. Common nouns are
more common than neuter, comprising about 75% of Danish nouns.
=
Attribute common alias male;
Constant LanguageInanimateGender = common;

@h Articles.

=
Array LanguageArticles -->

!   Cdef   Def    Indef

    "Den " "den " "en "         ! 0: common singular
    "Det " "det " "et "         ! 1: neuter singular
    "De "  "de "  "nogle ";     ! 2: plural

                                ! a           i
                                ! s     p     s     p
                                ! m f n m f n m f n m f n

Array LanguageGNAsToArticles -->  0 0 1 2 2 2 0 0 1 2 2 2;

@h Commands.
|LanguageVerbLikesAdverb| is called by |PrintCommand| when printing an |UPTO_PE|
error or an inference message.  Words which are intransitive verbs, i.e.,
which require a direction name as an adverb ("walk west"), not a noun
("I only understood you as far as wanting to touch the ground"), should
cause the routine to return |true|.

|LanguageVerbMayBeName| is called by |NounDomain| when dealing with
the player's reply to a "Which do you mean, the short stick or the
long stick?" prompt from the parser. If the reply is another verb
(for example, LOOK) then then previous ambiguous command is discarded
unless it is one of these words which could be both a verb and an
adjective in a |name| property.

=
[ LanguageVerb i;
    switch (i) {
! ! These will need to be connected to the actual commands:
!      'i//', 'inv', 'inventar', 't//':     print "status";
!      'k//', 'l//':     print "se";
!      'u//', 'x//':     print "undersøg";
!      'z//':            print "vent";
      'i//','inv','inventory':
               print "take inventory";
      'l//':   print "look";
      'x//':   print "examine";
      'z//':   print "wait";
      default: rfalse;
    }
    rtrue;
];

[ LanguageVerbLikesAdverb w;
    if (w == 'se' or 'kig' or 'gå' or 'løb' or 'skub' or 'tryk')
        rtrue;
    rfalse;
];

[ LanguageVerbMayBeName w;
    if (w == 'full' or 'fuld' or 'lang' or 'lange' or 'normal' or 'normale' or 'kort')
        rtrue;
    rfalse;
];

@h Stubs.
To reduce the need for conditional compilation, we provide these stub
routines:

=
[ LanguageIsVerb buffer parse verb_wordnum;
	rfalse;
];

Constant LanguageContractionForms = 1; ! Danish doesn't use article contractions, so it only has one form

[ LanguageContraction;
    rfalse;
];
