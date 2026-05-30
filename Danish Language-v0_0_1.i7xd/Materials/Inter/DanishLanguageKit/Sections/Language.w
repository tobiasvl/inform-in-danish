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
Constant UNDO1__WD      = 'fortryd';
Constant UNDO2__WD      = 'angre';
Constant UNDO3__WD      = 'undo';

Constant ALL1__WD       = 'al';
Constant ALL2__WD       = 'alt';
Constant ALL3__WD       = 'alle';
Constant ALL4__WD       = 'hver';
Constant ALL5__WD       = 'begge';
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
Constant OF1__WD        = 'af';
Constant OF2__WD        = 'of';
Constant OF3__WD        = 'of';
Constant OF4__WD        = 'of';
Constant OTHER1__WD     = 'another'; ! TODO - interferes with "the second"
Constant OTHER2__WD     = 'other';
Constant OTHER3__WD     = 'other';
Constant THEN1__WD      = 'derefter';
Constant THEN2__WD      = 'så';
Constant THEN3__WD      = 'then';

Constant NO1__WD        = 'n//';
Constant NO2__WD        = 'nej';
Constant NO3__WD        = 'nej';
Constant YES1__WD       = 'j//';
Constant YES2__WD       = 'ja';
Constant YES3__WD       = 'jo';

Constant AMUSING__WD    = 'sjovt';
Constant FULLSCORE1__WD = 'fullscore';
Constant FULLSCORE2__WD = 'full';
Constant QUIT1__WD      = 'q//';
Constant QUIT2__WD      = 'afslut';
Constant RESTART__WD    = 'genstart';
Constant RESTORE__WD    = 'hent';

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
  !             0123456789AB

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
  !             0123456789AB

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
    if (d == n_obj or e_obj or w_obj or s_obj)
        print (name) d, "på";
    else if (d == u_obj or d_obj)
        print (name) d, "ad";
    else if (d == in_obj or out_obj)
        print (name) d; ! These are already called "indenfor" and "udenfor"
    else
        print "mod ", (name) d;
];

@h Translation.
These "callback" functions are called by Inform when needed.

=
[ LanguageToInformese;

    ! TODO: Is this needed?
    ! https://www.inform-fiction.org/manual/html/s36.html

    ! Here we could rewrite definiteness, turn imperative into infinitive, etc.

];

@h Referring to indefinite objects.

We want players to be able to refer to things by their indefinite names.
=
[ LanguageRefers obj wnum   k wd m l;

    ! Inflect? What is indirect_parser_inflection ?

    ! TODO: add non-attributive names here - but how?

     k = wn; wn = wnum; wd = NextWordStopped(); wn = k;

    !for (k=0: k<obj.#short_name_indef: k++)
    !    for (m=0: m<WordLength(wnum): m++)
    !        for (l=1: l<obj.short_name_indef->k-->0: l++)
    !            if (obj.short_name_indef->k-->l ~= WordAddress(wnum)->l) {
    !                !print (char) obj.short_name_indef->k-->(l+1), "!=", (char) WordAddress(wnum)->l;
    !                rfalse;
    !            }

    !if (WordInProperty(WordAddress(wnum), obj, short_name_indef)) rtrue;
    !if (WordInProperty(WordAddress(wnum), obj, short_name)) rtrue;

    !if (obj has pluralname) {
    !    if (WordInProperty(wd, obj, plural_indef)) rtrue;
    !    if (WordInProperty(wd, obj, plural)) rtrue;
    !}
    
    !m = short_name_indef;
    !k = obj.&m; l = (obj.#m)/WORDSIZE-1;
    !for (m=0 : m<=l : m++)
    !    print "checking short_name_indef word:", k-->m, "against", wd, "^";
    !    if (wd == k-->m) {
    !        print "found short_name_indef";
    !        rtrue;
    !    }
    !m = short_name;
    !k = obj.&m; l = (obj.#m)/WORDSIZE-1;
    !for (m=0 : m<=l : m++)
    !    if (wd == k-->m) {
    !        print "found short_name";
    !        rtrue;
    !    }
    !m = plural_indef;
    !k = obj.&m; l = (obj.#m)/WORDSIZE-1;
    !for (m=0 : m<=l : m++)
    !    if (wd == k-->m) {
    !        print "found plural_indef";
    !        rtrue;
    !    }
    !m = plural;
    !k = obj.&m; l = (obj.#m)/WORDSIZE-1;
    !for (m=0 : m<=l : m++)
    !    if (wd == k-->m) {
    !        print "found plural";
    !        rtrue;
    !    }
    !print "LanguageRefers failed with", parser_inflection, "^";
    return -1;
];

@h Capitalizing nouns.

This routine handles the capitalization of nouns in some situations (definite
nouns without articles, and archaic capitalized nouns).

This routine is a hook called by STANDARD_NAME_PRINTING_R (the standard
name printing rule). We'll only use it to capitalize the name if needed, because
the standard name printing rule defers only to |cap_short_name| for that, but we
want to print the capitalized version of any name in some circumstances.

In an ideal world, we would also use this routine to inflect adjectives, but
that currently doesn't work, so we have to use say phrases as a fallback (see
TODO: Adjectives).

Note that for Z-machine games, we should be able to use CPrintOrRun instead of
what we do here, but that routine doesn't work for Glulx games, so we do it a
bit more manually here, which should work for both. CPrintOrRun not working for
Glulx might be a bug in Inform, and has been reported as //I7-2642 -> https://inform7.atlassian.net/browse/I7-2642//.

TODO: If the capitalized nouns option is active, we should capitalize the last
word in the name, to handle names with adjectives properly. Currently it only
works for non-attributive nouns.
=
[ LanguagePrintShortName obj  k m wnum l  i prop;
    if (caps_mode || DanishLanguageKit`CAPITALIZED_NOUNS_CFGF) {
        if (indef_mode && obj provides short_name_indef) {
            prop = short_name_indef;
        } else {
            if (obj provides cap_short_name && PrintOrRun(obj, cap_short_name, true) ~= 0) {
                caps_mode = false;
                rtrue;
            } else {
                prop = short_name;
            }
        }

        ! Here we capitalize the first letter of the relevant printed name.
        #Ifdef TARGET_GLULX;
            TEXT_TY_Say_Capitalised(obj.prop);
        #Ifnot;
            CPrintOrRun(obj, prop);
        #Endif;

        !! Here's the old code that manually capitalized the first letter.
        !! Indefinite names are usually shorter than the definite names (ie.
        !! "short names"), so we assume StorageForShortName is big enough.
        !! TODO: This might not hold for plural definite names.
        ! VM_PrintToBuffer(StorageForShortName, obj.prop-->0, obj, prop);
        ! StorageForShortName-->1 = VM_LowerToUpperCase(StorageForShortName-->1);
        ! for (i = 1: i < StorageForShortName-->0 - 1: i++) {
        !     print (char) StorageForShortName-->i;
        ! }

        caps_mode = false;
        rtrue;
    }
    
    rfalse;

    ! TODO: What about plurals?
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
Constant LanguageCases = 3;     ! The number of article cases; Danish has three

Array LanguageArticles -->

!   Cdef   Def    CIndef  Indef


    "Den " "den " "En"    "en "         ! 0: common singular
    "Det " "det " "Et"    "et "         ! 1: neuter singular
    "De "  "de "  "Nogle" "nogle ";     ! 2: plural

                                ! a           i
                                ! s     p     s     p
                                ! m f n m f n m f n m f n

Array LanguageGNAsToArticles -->  0 0 1 2 2 2 0 0 1 2 2 2;

Constant CDEFART_INDEX = 0;
Constant DEFART_INDEX = 1;
Constant CINDEFART_INDEX = 2;
Constant INDEFART_INDEX = 3;
Constant ARTBLOCK_LEN = 4;

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
      'i//', 'inv', 'inventar', 't//':     print "status";
      'k//', 'l//':     print "se";
      'u//', 'x//':     print "undersøg";
      'z//':            print "vent";
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
    ! TODO: remove a trailing -e from the word to naively convert it from infinitive to imperative and see if that's a command verb
	rfalse;
];

Constant LanguageContractionForms = 1;

[ LanguageContraction;
    rfalse;
];
