Volume - Preamble

Use authorial modesty.

[ Section - Unindexed Standard Rules variables (in place of "Section 7 - Unindexed Standard Rules variables" in Standard Rules by Graham Nelson) ]

The story title, the story author, the story headline, the story genre
and the story description are text variables.
The release number and the story creation year are number variables.

The release number is usually 1.

[ TODO: The story headline could perhaps be "En interaktiv fiktion", but that's
not a common Danish term. However, we could of course proliferate it by using
it here... ]
The story headline is usually "Et teksteventyr".

[ We leave the story genre in English, because it's mostly used for
categorization. ]
The story genre is usually "Fiction".

[ The story title variable translates into Inter as "Story". ]

Section - Unindexed Standard Rules variables (for figures language element only) (in place of "Section SR2/6b - Unindexed Standard Rules variables" in Standard Rules by Graham Nelson)

Figure of cover is the file of cover art ("Omslagskunsten.").

Volume - Danish Language

[ This volume translates the extension English Language by Graham Nelson. ]

Section 1 - Modal verbs and contractions [TODO]

To be able to is a verb.
To could is a verb.
To may is a verb.
To might is a verb.
To must is a verb.
To should is a verb.
To would is a verb.

To 're is a verb.
To 've is a verb.
To aren't is a verb.
To can't is a verb.
To don't is a verb.
To haven't is a verb.
To mustn't is a verb.
To mightn't is a verb.
To mayn't is a verb.
To wouldn't is a verb.
To couldn't is a verb.
To shouldn't is a verb.
To won't is a verb.

Section - Grammatical definitions (in place of Section 1 - Grammatical definitions in English Language by Graham Nelson)

[ We replace this whole section in order to set a few things. ]

The language of play is a natural language that varies.
The language of play is the Danish language.



A grammatical tense is a kind of value. The grammatical tenses are present tense,
past tense, perfect tense, past perfect tense and future tense.

[ TODO: test out @d here ]

[ define NO_KNOWN_TENSES 7
define IS_TENSE 0        Present
define WAS_TENSE 1       Past
define HASBEEN_TENSE 2   Present perfect
define HADBEEN_TENSE 3   Past perfect
define WILLBE_TENSE 4    Future (not used in assertions or conditions)
define CUSTOM1_TENSE 5
define CUSTOM2_TENSE 6
]

A narrative viewpoint is a kind of value. The narrative viewpoints are first
person singular, second person singular, third person singular, first person
plural, second person plural, third person plural, and
[ We add a new narrative viewpoint to allow the parser to be "Des" with the
player, ie. addressing the player with the honorifics "De/Dem/Deres". ]
second person honorific.

[ Uses the modern "vores" as the catch-all translation of "our(s)" instead of
"vor/vort/vore" depending on grammatical gender and plurality. ]
Use vores spelling translates as (- Constant VORES_SPELLING; -).

[ Uses the archaic plurality form of present tense. ]
Use archaic plural present tense translates as (- Constant ARCHAIC_PLURAL_PRESENT_TENSE; -).

[ Capitalizes nouns. ]
Use capitalized nouns translates as (- Constant CAPITALIZED_NOUNS; -).

A natural language has a narrative viewpoint called the adaptive text viewpoint.

The adaptive text viewpoint of the English language is first person plural.
The adaptive text viewpoint of the Danish language is first person plural.

A grammatical case is a kind of value. The grammatical cases are nominative
and accusative.

[ We reorder the grammatical genders to make masculine gender the default, and
comment out the feminine gender as Danish doesn't use it. ]
A grammatical gender is a kind of value. The grammatical genders are
masculine gender, neuter gender[, feminine gender].
[ TODO check if reordering breaks the constants https://ganelson.github.io/inform/inflections-module/3-lc.html ]

Masculine gender translates into Danish as fælleskøn.
Neuter gender translates into Danish as a intetkøn.

An object has a grammatical gender.

The story tense is a grammatical tense that varies.
The story tense variable is defined by Inter as "story_tense".
The story viewpoint is a narrative viewpoint that varies.
The story viewpoint variable is defined by Inter as "story_viewpoint".

To say regarding (item - an object): (- RegardingSingleObject({item}); -).

To say regarding (N - a number): (- RegardingNumber({N}); -).

To say regarding list writer internals: (- RegardingLWI(); -).

To say regarding (D - a description of objects): (-
		objectloop({-my:1} ofclass Object)
			if ({-matches-description:1:D})
				give {-my:1} workflag2;
			else
				give {-my:1} ~workflag2;
		RegardingMarkedObjects();
	-).

To decide if the prior naming context is plural:
	(- ((prior_named_list >= 2) || (prior_named_noun && prior_named_noun has pluralname)) -).


Volume - Basic Danish Inform

[ This volume translates parts of the extension Basic Inform by Graham Nelson. ]

Include (-
	[ LanguageNumber n f;
		if (n == 0)    { print "nul"; rfalse; }
		if (n < 0)     { print "minus "; n = -n; }
		if (n >= 1000) {
			if (n/1000 == 1) { print "et"; } else print (LanguageNumber) n/1000;
			print " tusinde"; n = n%1000; f = 1;
		}
		if (n >= 100)  {
			if (f == 1) print ", ";
			print (LanguageNumber) n/100, " hundrede"; n = n%100; f = 1;
		}
		if (n == 0) rfalse;
		if (f == 1) print " og ";
		switch (n) {
			1:    print "en";
			2:    print "to";
			3:    print "tre";
			4:    print "fire";
			5:    print "fem";
			6:    print "seks";
			7:    print "syv";
			8:    print "otte";
			9:    print "ni";
			10:   print "ti";
			11:   print "elleve";
			12:   print "tolv";
			13:   print "tretten";
			14:   print "fjorten";
			15:   print "femten";
			16:   print "seksten";
			17:   print "sytten";
			18:   print "atten";
			19:   print "nitten";
			default:
				if (n%10 ~= 0) print (LanguageNumber) n%10, "og";
				switch (n/10) {
					2:  print "tyve";
					3:  print "tredive";
					4:  print "fyrre";
					5:  print "halvtreds";
					6:  print "tres";
					7:  print "fjerds";
					8:  print "firs";
					9:  print "halvfems";
				}
		}
	];
-) replacing "LanguageNumber".

Section - Saying Names

To say substantivet:
	say the noun.
To say Substantivet:
	say The noun.
To say et substantiv:
	say a noun.
To say Et substantiv:
	say A noun.
To say navneordet:
	say the noun.
To say Navneordet:
	say The noun.
To say et navneord:
	say a noun.
To say Et navneord:
	say A noun.

To say en (something - object):
        (- print (a) {something}; -).
To say et (something - object):
        (- print (a) {something}; -).
To say En (something - object):
        (- CIndefArt({something}); -).
To say Et (something - object):
        (- CIndefArt({something}); -).
To say den (something - object):
	[ TODO: sjekk om navnet til something har flere ord, og hvis ikke bruk suffiks? ]
        (- print (the) {something}; -).
To say Den (something - object):
	[ TODO: sjekk om navnet til something har flere ord, og hvis ikke bruk suffiks? ]
        (- print (The) {something}; -).

Section - Saying Special Characters

[ Although we only support Danish as the language of play, we still provide
some Danish substitutions so adaptive text looks natural. ]

To say bracket -- running on: say bracket.
To say close bracket -- running on: say close bracket.
To say apostrof -- running on: say apostrophe.
To say anførselstegn -- running on: say quotation mark.

Section - Adaptive Text
	[(in place of Section 5 - Adaptive Text in Basic Inform by Graham Nelson)]

[ Inform verbs can't have properties, so to conjugate verbs in Danish we provide
a table of verb forms, as well as new default behaviors. ]

[To say substantiv:
	if capitalized nouns option is active, say "[Noun]";
	otherwise, say "[noun]".
To say Substantiv: say "[Noun]".
To say substantivet:
	if capitalized nouns option is active, say "[the Noun]";
	otherwise, say "[the noun]".
To say Substantivet:
	if capitalized nouns option is active, say "[The Noun]";
	otherwise, say "[The noun]".
To say et substantiv:
	if capitalized nouns option is active, say "[a Noun]";
	otherwise, say "[a noun]".
To say Et substantiv:
	if capitalized nouns option is active, say "[A Noun]";
	otherwise, say "[A noun]".]



A Danish verb is a kind of value. [TODO verbum? ]
A Danish verb has texts called infinitive form, present tense form, past tense form, [imperative form,] past participle form, [past perfect form [har stjålet],] and present participle form [cyklende].
A Danish verb has a verb called the English verb.

[Table of Verb Translations
verb	Danish verb
take	tager
have	haver]

[
Table of Strong Danish Verbs
Danish verb	infinitive	past participle	present participle
tage	"tage"	"taget"	"tagende"
]

[To say infinitive of (V - a Danish verb):
	(- {V}(1); -).
To say past participle of (V - a Danish verb):
	(- {V}(2); -).
To say present participle of (V - a Danish verb):
	(- {V}(3); -).]

To say infinitive of (V - a Danish verb):
	if the infinitive form of V is empty:
		say V;
	otherwise:
		say infinitive form of V.
To say past participle of (V - a Danish verb):
	say past participle form of V.
To say present participle of (V - a Danish verb):
	say present participle form of V.

[
To say (V - Danish verb):
	say adapt V.
]

To say adapt (V - Danish verb):
	say adapt V in story tense.

[A grammatical tense is a kind of value. The grammatical tenses are present tense,
past tense, perfect tense, past perfect tense and future tense.]

To say adapt (V - Danish verb) in (T - grammatical tense):
	if T is present tense:
		say "[present tense form of V]";
	otherwise if T is past tense:
		say "[past tense form of V]";
	otherwise if T is perfect tense:
		say "har [past participle form of V]";
	otherwise if T is past perfect tense:
		say "havde [past participle form of V]";
	otherwise if T is future tense:
		say "vil [infinitive of V]".

To say adapt (V - Danish verb) from (P - narrative viewpoint):
	say adapt V.
To say adapt (V - Danish verb) in (T - grammatical tense) from (P - narrative viewpoint):
	say adapt V in T.

To say negate (V - Danish verb) in (T - grammatical tense):
	if T is present tense:
		say "[present tense form of V] ikke";
	otherwise if T is past tense:
		say "[past tense form of V] ikke";
	otherwise if T is perfect tense:
		say "har ikke [past participle form of V]";
	otherwise if T is past perfect tense:
		say "havde ikke [past participle form of V]";
	otherwise if T is future tense:
		say "vil ikke [infinitive of V]".

To say negate (V - Danish verb):
	say negate V in story tense.

To say negate (V - Danish verb) from (P - narrative viewpoint):
	say negate V.
To say negate (V - Danish verb) in (T - grammatical tense) from (P - narrative viewpoint):
	say negate V in T.

[
To say adapt (V - Danish verb):
	(- {V}(CV_POS, PNToVP(), story_tense); -).
To say adapt (V - Danish verb) in (T - grammatical tense):
	(- {V}(CV_POS, PNToVP(), {T}); -).
To say adapt (V - verb) from (P - narrative viewpoint):
	(- {V}(CV_POS, {P}, story_tense); -).
To say adapt (V - verb) in (T - grammatical tense) from (P - narrative viewpoint):
	(- {V}(CV_POS, {P}, {T}); -).
To say negate (V - verb):
	(- {V}(CV_NEG, PNToVP(), story_tense); -).
To say negate (V - verb) in (T - grammatical tense):
	(- {V}(CV_NEG, PNToVP(), {T}); -).
To say negate (V - verb) from (P - narrative viewpoint):
	(- {V}(CV_NEG, {P}, story_tense); -).
To say negate (V - verb) in (T - grammatical tense) from (P - narrative viewpoint):
	(- {V}(CV_NEG, {P}, {T}); -).
]

[To decide which relation of objects is meaning of (V - a verb): (- {V}(CV_MEANING) -).]

Volume - Standard Danish Rules

[ This volume translates the extension Standard Rules by Graham Nelson. ]

Part - Time

Section - Time Values (in place of Section 1 - Time Values in Standard Rules by Graham Nelson)

To say (something - time) in words:
	(- print (PrintTimeOfDayDanish) {something}; -).
To say her:
	say "[if story tense is present tense]her[otherwise]der".
To say nu:
	say "[if story tense is present tense]nu[otherwise]da".

Section - Time Template

Include (-
[ PrintTimeOfDay t h;
	if (t<0) { print "<no time>"; return; }
	if (t >= TWENTY_FOUR_HOURS) { t = t - TWENTY_FOUR_HOURS; };
	h = t/ONE_HOUR; if (h==0) h=24;
	t = t%ONE_HOUR;
	LanguageTimeOfDay(h, t);
];
-) replacing "PrintTimeOfDay" [ in WorldModelKit ].

Include (-
[ PrintDuration t h m;
	if (t<0) { print "minus "; t = -t; }
	h = t/ONE_HOUR; m = t%ONE_HOUR;
	if (h > 0) print h, " time"; if (h > 1) print "r";
	if (h > 0) print " ";
	if (m == 1) print "1 minut";
	else if ((h == 0) || (m > 0)) print m, " minutter";
];
-) replacing "PrintDuration" [ in WorldModelKit ].

[ TODO This must be replaced wholesale ]
Include (-
[ PrintTimeOfDayDanish t h m dir aop;
	h = (t/ONE_HOUR) % 24; m = t%ONE_HOUR; if (h==0) h=24;
	if (m==0) { print (number) h; return; }
	dir = "over";
	if (m > HALF_HOUR) { m = ONE_HOUR-m; h = (h+1)%24; if (h==0) h=12; dir = "i"; }
	switch(m) {
		QUARTER_HOUR: print "kvart";
		HALF_HOUR: print "halv";
		default: print (number) m;
			if (m%5 ~= 0) {
				if (m == 1) print " minut"; else print " minutter";
			}
	}
	print " ", (string) dir, " ", (number) h;
];
-).

Section - Directions

[ Translates parts of Section 4 - Directions in Standard Rules by Graham Nelson.

We keep the English direction names and abbreviations for convenience/muscle memory, except for "se" which now means "look"). ]

Understand "n" or "nord" as north.
Understand "nø" or "nordøst" as northeast.
Understand "nv" or "nordvest" as northwest.
Understand "syd" as south.
Understand "sø" or "sydøst" as southeast.
Understand the command "se" as something new. [ look ]
Understand "sv" or "sydvest" as southwest.
Understand "ø" or "øst" as east.
Understand "v" or "vest" as west.
Understand "o" or "op" or "opad" as up.
Understand "ned" or "nedad" as down.
Understand "ind" or "indenfor" or "indeni" as inside.
Understand "ud" or "udenfor" as outside.

North translates into Danish as nord.

Section - People (in place of Section 11 - People in Standard Rules by Graham Nelson)

[ We need to replace this section wholesale to get at the description of yourself... ]

The specification of person is "Despite the name, not necessarily
a human being, but anything animate enough to envisage having a
conversation with, or bartering with."

A person can be female or male. A person is usually male.
A person can be neuter. A person is usually not neuter.

A person has a number called carrying capacity.
The carrying capacity of a person is usually 100.

A person can be transparent. A person is always transparent.

The yourself is an undescribed person. The yourself is proper-named.

The yourself is privately-named.
Understand "dit tidligere jeg" or "mit tidligere jeg" or "tidligere jeg" or
	"tidligere" as yourself when the player is not yourself.

The description of yourself is usually "Lige så smuk som altid."

The yourself object translates into Inter as "selfobj".
[The yourself object translates into I6 as "selfobj".]

[Yourself have a text called saved printed name.
The saved printed name property translates into I6 as "saved_short_name".
The saved printed name of yourself is "[dig]".]

Section - Final question options (in place of Section 6 - Final question options in Standard Rules by Graham Nelson)

Table of Final Question Options
final question wording	only if victorious	topic		final response rule		final response activity
"OMSTART"				false				"restart"	immediately restart the VM rule	--
"RESTORE a saved game"	false				"restore"	immediately restore saved game rule	--
"see some suggestions for AMUSING things to do"	true	"amusing"	--	amusing a victorious player
"QUIT"					false				"quit"		immediately quit rule	--
"UNDO the last command"	false				"undo"		immediately undo rule	--


Section - Vocabulary

Include (-
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
-) replacing "Vocabulary".


Include (-
Array LanguageNumbers table
    'en' 1 'én' 1 'ét' 1 'een' 1 'eet' 1 'to' 2 'tre' 3 'fire' 4 'fem' 5
    'seks' 6 'syv' 7 'otte' 8 'ni' 9 'ti' 10
    'elleve' 11 'tolv' 12 'tretten' 13 'fjorten' 14 'femten' 15
    'seksten' 16 'sytten' 17 'atten' 18 'nitten' 19 'tyve' 20
    'enogtyve' 21 'toogtyve' 22 'treogtyve' 23 'fireogtyve' 24
    'femogtyve' 25 'seksogtyve' 26 'syvogtyve' 27 'otteogtyve' 28
    'niogtyve' 29 'tredive' 30 'tredve' 30
;
-) replacing "Numbers".

Include (-
[ LanguageTimeOfDay hours mins;
    print hours/10, hours%10, ":", mins/10, mins%10;
];
-) replacing "Time".

Include (-
! Default genders
Constant LanguageAnimateGender   = male; ! For historical reasons, although there are more Danish women than men...
Constant LanguageInanimateGender = male; ! Masculine nouns are more common than neuter (about 75% of nouns)

Attribute common alias male;             ! Danish uses the common gender, which is identical to the masculine

Constant LanguageContractionForms = 1;   ! Danish doesn't use article contractions, so it only has one form

[ LanguageContraction;
    rfalse;
];

Array LanguageArticles -->

!   Cdef   Def    Indef

    "Den " "den " "en "        ! 0: common singular
    "Det " "det " "et "        ! 1: neuter singular
    "De "  "de "  "nogle ";    ! 2: plural

                    !             a           i
                    !             s     p     s     p
                    !             m f n m f n m f n m f n

Array LanguageGNAsToArticles -->  0 0 1 2 2 2 0 0 1 2 2 2;
-) replacing "Articles".

Include (-

language Danish


<np-relative-phrase-implicit> ::=
	/a/ porté/portée/portés/portées |				[replacing "worn" in English]
	/b/ tenu/tenue/tenus/tenues |			["carried"]
	/d/ ici					["here"]

<implicit-player-relationship> ::=
	/a/ porté/portée/portés/portées |
	/b/ tenu/tenue/tenus/tenues


<article-declension> ::=
	m           <da-masculine-article-declension> |
	n           <da-neuter-article-declension>

<da-masculine-article-declension> ::=
	en          en   en
	            nogle nogle |
	den         den  den
	            de   dem

<da-neuter-article-declension> ::=
	et          et   et
	            nogle nogle |
	det         det  det
	            de   dem


<grammatical-case-names> ::=
        nominativ | oblik

<noun-declension> ::=
        *    <da-noun-declension-group> <da-noun-declension-tables>

<da-noun-declension-group> ::=
        *            1

<da-noun-declension-tables> ::=
        <da-noun-declension-uninflected>

<da-noun-declension-uninflected> ::=
        0 | 0 |
        0 | 0


<singular-noun-to-its-plural> ::=
[        <da-singular-adjective-to-its-plural> <da-singular-noun-to-its-plural> |]
        <da-singular-noun-to-its-plural>

<da-singular-noun-to-its-plural> ::=
	... <da-trie-plural-uninflected> |
	... <da-trie-plural-pronouns> |
	... <da-trie-plural-exceptions> |
	... <da-plural-by-ending> |
	... <da-plural-default>

[
<da-singular-adjective-to-its-plural> ::=
        *       0e
]

<da-trie-plural-uninflected> ::=
	sau			0


<da-trie-plural-exceptions> ::=
	får			0


<da-plural-by-ending> ::=
	*k                      0+er

<da-plural-default> ::=
	*                       0er

<da-trie-plural-pronouns> ::=
        ...       <da-trie-plural-reflective-pronouns> [|
        ... selv  <da-trie-plural-regular-pronouns>]

<da-trie-plural-regular-pronouns> ::=
	jeg	vi |
	du	I |
	hun	de |
	han	de |
	den	de |
	det	de |
	de	de |
	mig	os |
	I	I |
	hende	dem |
	ham	dem |
	den	dem |
	det	dem |
	dem	dem |
	jer	jer

[
<da-trie-plural-reflective-pronouns> ::=
	mig	os |
	dig 	jere  |
	hende 	dem  |
	ham 	dem  |
	den 	dem  |
	det 	dem  |
	dem 	dem
[ TODO oneself ]
]
[ TODO these break everything??

<cardinal-number-in-words> ::=
        nul |
        en |
        to | [ TODO oops ]
        tre |
        fire |
        fem |
        seks |
        syv |
        otte |
        ni|
        ti |
        elleve |
        tolv
]

<ordinal-number-in-words> ::=
        nullte |
        første |
        andre |
        tredje |
        fjerde |
        femte |
        sjette |
        syvende |
        ottende |
        niende |
        tiende |
        ellevte |
        tolvte

[ TODO definite ordinals ]


[ TODO: ]  [
<definite-article-table> ::=
        den de den de den de |
        den de den de den de

<indefinite-article-table> ::=
        en   nogle  en  nogle  en  nogle |
        en   nogle  en  nogle  en  nogle
]

<first-person-pronoun-table> ::=
	jeg vi jeg vi jeg vi |
	mig os mig os mig os

<second-person-pronoun-table> ::=
	du I du I du I du I |
	dig jer dig jer dig jer

[ TODO neuter ]
<third-person-pronoun-table> ::=
	den de han de hun de |
	den dem ham dem hende dem

[ TODO neuter ]
<first-person-possessive-pronoun-table> ::=
	min vor min vor min vor |
	min vor min vor min vor

<second-person-possessive-pronoun-table> ::=
	din jeres din jeres din jeres |
	din jeres din jeres din jeres

<third-person-possessive-pronoun-table> ::=
	dens deres hans deres hendes dere |
	dens deres hans deres hendes dere

<here-pronoun-table> ::=
	her her her her her her |
	her her her her her her


<adjective-to-plural> ::=
	*		0e

<adjective-to-masculine-singular> ::=
	*		0

<adjective-to-neuter-singular> ::=
	*		0

<adjective-to-masculine-plural> ::=
	... <adjective-to-plural>

<adjective-to-neuter-plural> ::=
	... <adjective-to-plural>

<adjective-to-comparative> ::=
	*	0
<adjective-to-superlative> ::=
	*	0
<adjective-to-quiddity> ::=
	*	0té

<verb-conjugation-instructions> ::=
        ...             <regular-verb-conjugation>

<regular-verb-conjugation> ::=
	*		0ing

-) in the Preform grammar.



Section 1 - Verbs needed for adaptive text [ TODO ]

To achieve is a verb. To appreciate is a verb. To arrive is a verb. To care is a verb.
To close is a verb. To die is a verb. To discover is a verb. To drop is a verb.
To eat is a verb. To feel is a verb. To find is a verb. To get is a verb.
To give is a verb. To go is a verb. To happen is a verb. To hear is a verb.
To jump is a verb. To lack is a verb. To lead is a verb. To like is a verb.
To listen is a verb. To lock is a verb. To look is a verb. To need is a verb.
To open is a verb. To pass is a verb. To pick is a verb. To provoke is a verb.
To pull is a verb. To push is a verb. To put is a verb. To rub is a verb.
To say is a verb. To search is a verb. To see is a verb. To seem is a verb.
To set is a verb. To smell is a verb. To sniff is a verb. To squeeze is a verb.
To switch is a verb. To take is a verb. To talk is a verb. To taste is a verb.
To touch is a verb. To turn is a verb. To wait is a verb. To wave is a verb.
To win is a verb.

Part - Command Grammar (in place of Part Six - Grammar in Standard Rules by Graham Nelson)

[ The Danish grammar for parsing typed commands in play.]

Understand "take [things]" as taking.
Understand "take off [something]" as taking off.
Understand "take [something] off" as taking off.
Understand "take [things inside] from [something]" as removing it from.
Understand "take [something] from [something]" as removing it from. [For better error messages.]
Understand "take [things inside] off [something]" as removing it from.
Understand "take [something] off [something]" as removing it from. [For better error messages.]
Understand "take inventory" as taking inventory.
Understand the commands "carry" and "hold" as "take".

Understand "get in/on" as entering.
Understand "get out/off/down/up" as exiting.
Understand "get [things]" as taking.
Understand "get in/into/on/onto [something]" as entering.
Understand "get off/down [something]" as getting off.
Understand "get [things inside] from [something]" as removing it from.
Understand "get [something] from [something]" as removing it from. [For better error messages.]

Understand "pick up [things]" or "pick [things] up" as taking.

Understand "stand" or "stand up" as exiting.
Understand "stand on [something]" as entering.

Understand "remove [something preferably held]" as taking off.
Understand "remove [things inside] from [something]" as removing it from.
Understand "remove [something] from [something]" as removing it from. [For better error messages.]

Understand "shed [something preferably held]" as taking off.
Understand the commands "doff" and "disrobe" as "shed".

Understand "wear [something preferably held]" as wearing.
Understand the command "don" as "wear".

Understand "put [other things] in/inside/into [something]" as inserting it into.
Understand "put [other things] on/onto [something]" as putting it on.
Understand "put on [something preferably held]" as wearing.
Understand "put [something preferably held] on" as wearing.
Understand "put down [things preferably held]" or "put [things preferably held] down" as dropping.

Understand "insert [other things] in/into [something]" as inserting it into.

Understand "drop [things preferably held]" as dropping.
Understand "drop [other things] in/into/down [something]" as inserting it into.
Understand "drop [other things] on/onto [something]" as putting it on.
Understand "drop [something preferably held] at/against [something]" as throwing it at.
Understand the commands "throw" and "discard" as "drop".

Understand "give [something preferably held] to [someone]" as giving it to.
Understand "give [someone] [something preferably held]" as giving it to (with nouns reversed).
Understand the commands "pay" and "offer" and "feed" as "give".

Understand "show [someone] [something preferably held]" as showing it to (with nouns reversed).
Understand "show [something preferably held] to [someone]" as showing it to.
Understand the commands "present" and "display" as "show".

Understand "go" as going.
Understand "go [direction]" as going.
Understand "go [something]" as entering.
Understand "go into/in/inside/through [something]" as entering.
Understand the commands "walk" and "run" as "go".

Understand "inventory" as taking inventory.
Understand the commands "i" and "inv" as "inventory".

Understand "look" as looking.
Understand "look at [something]" as examining.
Understand "look [something]" as examining.
Understand "look inside/in/into/through [something]" as searching.
Understand "look under [something]" as looking under.
Understand "look up [text] in [something]" as consulting it about (with nouns reversed).
Understand the command "l" as "look".

Understand "consult [something] on/about [text]" as consulting it about.

Understand "open [something]" as opening.
Understand "open [something] with [something preferably held]" as unlocking it with.
Understand the commands "unwrap", "uncover" as "open".

Understand "close [something]" as closing.
Understand "close up [something]" as closing.
Understand "close off [something]" as switching off.
Understand the commands "shut" and "cover" as "close".

Understand "enter" as entering.
Understand "enter [something]" as entering.
Understand the command "cross" as "enter".

Understand "sit on top of [something]" as entering.
Understand "sit on/in/inside [something]" as entering.

Understand "exit" as exiting.
Understand the commands "leave" and "out" as "exit".

Understand "examine [something]" as examining.
Understand the commands "x", "watch", "describe" and "check" as "examine".

Understand "read [something]" as examining.
Understand "read about [text] in [something]" as consulting it about (with nouns reversed).
Understand "read [text] in [something]" as consulting it about (with nouns reversed).

Understand "yes" as saying yes.
Understand the command "y" as "yes".

Understand "no" as saying no.

Understand "sorry" as saying sorry.

Understand "search [something]" as searching.

Understand "wave" as waving hands.

Understand "wave [something]" as waving.

Understand "set [something] to [text]" as setting it to.
Understand the command "adjust" as "set".

Understand "pull [something]" as pulling.
Understand the command "drag" as "pull".

Understand "push [something]" as pushing.
Understand "push [something] [direction]" or "push [something] to [direction]" as pushing it to.
Understand the commands "move", "shift", "clear" and "press" as "push".

Understand "turn [something]" as turning.
Understand "turn [something] on" or "turn on [something]" as switching on.
Understand "turn [something] off" or "turn off [something]" as switching off.
Understand the commands "rotate", "twist", "unscrew" and "screw" as "turn".

Understand "switch [something switched on]" as switching off.
Understand "switch [something]" or "switch on [something]" or "switch [something] on" as
	switching on.
Understand "switch [something] off" or "switch off [something]" as switching off.

Understand "lock [something] with [something preferably held]" as locking it with.

Understand "unlock [something] with [something preferably held]" as unlocking it with.

Understand "attack [something]" as attacking.
Understand the commands "break", "smash", "hit", "fight", "torture", "wreck", "crack", "destroy",
	"murder", "kill", "punch" and "thump" as "attack".

Understand "wait" as waiting.
Understand the command "z" as "wait".

Understand "answer [text] to [someone]" as answering it that (with nouns reversed).
Understand the commands "say", "shout" and "speak" as "answer".

Understand "tell [someone] about [text]" as telling it about.

Understand "ask [someone] about [text]" as asking it about.
Understand "ask [someone] for [something]" as asking it for.

Understand "eat [something preferably held]" as eating.

Understand "sleep" as sleeping.
Understand the command "nap" as "sleep".

Understand "climb [something]" or "climb up/over [something]" as climbing.
Understand the command "scale" as "climb".

Understand "buy [something]" as buying.
Understand the command "purchase" as "buy".

Understand "squeeze [something]" as squeezing.
Understand the command "squash" as "squeeze".

Understand "swing [something]" or "swing on [something]" as swinging.

Understand "wake" or "wake up" as waking up.
Understand "wake [someone]" or "wake [someone] up" or "wake up [someone]" as waking.
Understand the commands "awake" and "awaken" as "wake".

Understand "kiss [someone]" as kissing.
Understand the commands "embrace" and "hug" as "kiss".

Understand "think" as thinking.

Understand "smell" as smelling.
Understand "smell [something]" as smelling.
Understand the command "sniff" as "smell".

Understand "listen" as listening to.
Understand "hear [something]" as listening to.
Understand "listen to [something]" as listening to.

Understand "taste [something]" as tasting.

Understand "touch [something]" as touching.
Understand the command "feel" as "touch".

Understand "rub [something]" as rubbing.
Understand the commands "shine", "polish", "sweep", "clean", "dust", "wipe" and "scrub" as "rub".

Understand "tie [something] to [something]" as tying it to.
Understand the commands "attach" and "fasten" as "tie".

Understand "burn [something]" as burning.
Understand the command "light" as "burn".

Understand "drink [something]" as drinking.
Understand the commands "swallow" and "sip" as "drink".

Understand "cut [something]" as cutting.
Understand the commands "slice", "prune" and "chop" as "cut".

Understand "jump" as jumping.
Understand the commands "skip" and "hop" as "jump".

Understand "score" as requesting the score.
Understand "quit" or "q" as quitting the game.
Understand "save" as saving the game.
Understand "restart" as restarting the game.
Understand "restore" as restoring the game.
Understand "verify" as verifying the story file.
Understand "version" as requesting the story file version.
[Understand "copyright" as requesting copyright licences. [TODO: Will be released in the next Inform version]]
Understand "script" or "script on" or "transcript" or "transcript on" as switching the story
	transcript on.
Understand "script off" or "transcript off" as switching the story transcript off.
Understand "superbrief" or "short" as preferring abbreviated room descriptions.
Understand "verbose" or "long" as preferring unabbreviated room descriptions.
Understand "brief" or "normal" as preferring sometimes abbreviated room descriptions.
Understand "nouns" or "pronouns" as requesting the pronoun meanings.
Understand "notify" or "notify on" as switching score notification on.
Understand "notify off" as switching score notification off.

[
Section 2 - Dialogue-related grammar (for dialogue language element only) (in place of Section 2 - Dialogue-related grammar in Standard Rules by Graham Nelson)

Understand "ask about [concept]" as talking about.
Understand "ask about [visible thing]" as talking about.
Understand "talk about [concept]" as talking about.
Understand "talk about [visible thing]" as talking about.
]




Section - Saying pronouns (for interactive fiction language element only) [TODO (in place of Section 2 - Saying pronouns in English Language by Graham Nelson)]
[ TODO: Support English pronouns as well, but redirect them to the Danish ones? ]

To say vi: [we]
	now the prior named object is the player;
	if the story viewpoint is first person singular:
		say "jeg";
	if the story viewpoint is second person singular:
		say "du";
	if the story viewpoint is second person honorific:
		say "De";
	if the story viewpoint is third person singular:
		if the player is male:
			say "han";
		otherwise:
			say "hun";
	if the story viewpoint is first person plural:
		say "vi";
	if the story viewpoint is second person plural:
		say "I";
	if the story viewpoint is third person plural:
		say "de".

To say os: [us]
	now the prior named object is the player;
	if the story viewpoint is first person singular:
		say "mig";
	if the story viewpoint is second person singular:
		say "dig";
	if the story viewpoint is second person honorific:
		say "Dem";
	if the story viewpoint is third person singular:
		if the player is male:
			say "ham";
		otherwise:
			say "hende";
	if the story viewpoint is first person plural:
		say "os";
	if the story viewpoint is second person plural:
		say "jer";
	if the story viewpoint is third person plural:
		say "dem".

To say vor: [ our/ours with male object ]
	now the prior named object is the player;
	if the story viewpoint is first person singular:
		say "min";
	if the story viewpoint is second person singular:
		say "din";
	if the story viewpoint is second person honorific:
		say "Deres";
	if the story viewpoint is third person singular:
		if the player is male:
			say "hans";
		otherwise:
			say "hendes";
	if the story viewpoint is first person plural:
		if vores spelling option is active:
			say "vores";
		otherwise:
			say "vor";
	if the story viewpoint is second person plural:
		say "jeres";
	if the story viewpoint is third person plural:
		say "deres".

To say vort: [ our/ours with neuter object ]
	now the prior named object is the player;
	if the story viewpoint is first person singular:
		say "mit";
	if the story viewpoint is second person singular:
		say "dit";
	if the story viewpoint is second person honorific:
		say "Deres";
	if the story viewpoint is third person singular:
		if the player is male:
			say "hans";
		otherwise:
			say "hendes";
	if the story viewpoint is first person plural:
		if vores spelling option is active:
			say "vores";
		otherwise:
			say "vort";
	if the story viewpoint is second person plural:
		say "jeres";
	if the story viewpoint is third person plural:
		say "deres".

To say vore: [ our/ours with plural object ]
	now the prior named object is the player;
	if the story viewpoint is first person singular:
		say "mine";
	if the story viewpoint is second person singular:
		say "dine";
	if the story viewpoint is second person honorific:
		say "Deres";
	if the story viewpoint is third person singular:
		if the player is male:
			say "hans";
		otherwise:
			say "hendes";
	if the story viewpoint is first person plural:
		if vores spelling option is active:
			say "vores";
		otherwise:
			say "vore";
	if the story viewpoint is second person plural:
		say "jeres";
	if the story viewpoint is third person plural:
		say "deres".

To say vores (O - an object): [ our/ours ]
	if O is singular-named:
		if O is male and O is not neuter:
			say vor;
		if O is neuter:
			say vort;
	if O is plural-named:
		say vore;
	say " [O]".

To say os selv: [ ourselves ]
	now the prior named object is the player;
	if the story viewpoint is first person singular:
		say "mig selv";
	if the story viewpoint is second person singular:
		say "dig selv";
	if the story viewpoint is second person honorific:
		say "Dem selv";
	if the story viewpoint is third person singular:
		if the player is male:
			say "ham selv";
		otherwise:
			say "hende selv";
	if the story viewpoint is first person plural:
		say "os selv";
	if the story viewpoint is second person plural:
		say "jere selv";
	if the story viewpoint is third person plural:
		say "dem selv".

To say Vi:
	now the prior named object is the player;
	if the story viewpoint is first person singular:
		say "Jeg";
	if the story viewpoint is second person singular:
		say "Du";
	if the story viewpoint is second person honorific:
		say "De";
	if the story viewpoint is third person singular:
		if the player is male:
			say "Han";
		otherwise:
			say "Hun";
	if the story viewpoint is first person plural:
		say "Vi";
	if the story viewpoint is second person plural:
		say "I";
	if the story viewpoint is third person plural:
		say "De".

To say Os:
	now the prior named object is the player;
	if the story viewpoint is first person singular:
		say "Mig";
	if the story viewpoint is second person singular:
		say "Dig";
	if the story viewpoint is second person honorific:
		say "Dem";
	if the story viewpoint is third person singular:
		if the player is male:
			say "Ham";
		otherwise:
			say "Hende";
	if the story viewpoint is first person plural:
		say "Os";
	if the story viewpoint is second person plural:
		say "Jer";
	if the story viewpoint is third person plural:
		say "Dem".

To say Vor: [ Our/Ours with male object ]
	now the prior named object is the player;
	if the story viewpoint is first person singular:
		say "Min";
	if the story viewpoint is second person singular:
		say "Din";
	if the story viewpoint is second person honorific:
		say "Deres";
	if the story viewpoint is third person singular:
		if the player is male:
			say "Hans";
		otherwise:
			say "Hendes";
	if the story viewpoint is first person plural:
		if vores spelling option is active:
			say "Vores";
		otherwise:
			say "Vor";
	if the story viewpoint is second person plural:
		say "Jeres";
	if the story viewpoint is third person plural:
		say "Deres".

To say Vort: [ Our/Ours with neuter object ]
	now the prior named object is the player;
	if the story viewpoint is first person singular:
		say "Mit";
	if the story viewpoint is second person singular:
		say "Dit";
	if the story viewpoint is second person honorific:
		say "Deres";
	if the story viewpoint is third person singular:
		if the player is male:
			say "Hans";
		otherwise:
			say "Hendes";
	if the story viewpoint is first person plural:
		if vores spelling option is active:
			say "Vores";
		otherwise:
			say "Vort";
	if the story viewpoint is second person plural:
		say "Jeres";
	if the story viewpoint is third person plural:
		say "Deres".

To say Vore: [ Our/Ours with plural object ]
	now the prior named object is the player;
	if the story viewpoint is first person singular:
		say "Mine";
	if the story viewpoint is second person singular:
		say "Dine";
	if the story viewpoint is second person honorific:
		say "Deres";
	if the story viewpoint is third person singular:
		if the player is male:
			say "Hans";
		otherwise:
			say "Hendes";
	if the story viewpoint is first person plural:
		if vores spelling option is active:
			say "Vores";
		otherwise:
			say "Vore";
	if the story viewpoint is second person plural:
		say "Jeres";
	if the story viewpoint is third person plural:
		say "Deres".

To say Vores (O - an object): [ our/ours ]
	if O is singular-named:
		if O is male and O is not neuter:
			say Vor;
		if O is neuter:
			say Vort;
	if O is plural-named:
		say Vore;
	say " [O]".

To say Os selv:
	now the prior named object is the player;
	if the story viewpoint is first person singular:
		say "Mig selv";
	if the story viewpoint is second person singular:
		say "Dig selv";
	if the story viewpoint is second person honorific:
		say "Dem selv";
	if the story viewpoint is third person singular:
		if the player is male:
			say "Ham selv";
		otherwise:
			say "Hende selv";
	if the story viewpoint is first person plural:
		say "Os selv";
	if the story viewpoint is second person plural:
		say "Jer selv";
	if the story viewpoint is third person plural:
		say "Dere selv".

[ TODO should these be here or not? ]

To say we: say vi.
To say us: say os.
To say ours: say our.
To say our: [ our/ours with plural object ]
	now the prior named object is the player;
	if the story viewpoint is first person singular:
		say "mine"; [ TODO ]
	if the story viewpoint is second person singular:
		say "dine"; [ TODO ]
	if the story viewpoint is second person honorific:
		say "Deres";
	if the story viewpoint is third person singular:
		if the player is male:
			say "hans";
		otherwise:
			say "hendes";
	if the story viewpoint is first person plural:
		say "vores";
	if the story viewpoint is second person plural:
		say "jeres";
	if the story viewpoint is third person plural:
		say "deres".
To say ourselves: say os selv.
To say We: say Vi.
To say Us: say Os.
To say Ours: say Our.
To say Our: [ our/ours with plural object ]
	now the prior named object is the player;
	if the story viewpoint is first person singular:
		say "Mine"; [ TODO ]
	if the story viewpoint is second person singular:
		say "Dine"; [ TODO ]
	if the story viewpoint is second person honorific:
		say "Deres";
	if the story viewpoint is third person singular:
		if the player is male:
			say "Hans";
		otherwise:
			say "Hendes";
	if the story viewpoint is first person plural:
		say "Vores";
	if the story viewpoint is second person plural:
		say "Jeres";
	if the story viewpoint is third person plural:
		say "Deres".
To say Ourselves: say Os selv.

Section - Further pronouns (for interactive fiction language element only) [TODO (in place of Section 3 - Further pronouns in English Language by Graham Nelson)]

To say de:
	let the item be the prior named object;
	if the prior naming context is plural:
		say "de";
	otherwise if the item is the player:
		say "[vi]";
	otherwise if the item is a male person and item is not neuter:
		say "han";
	otherwise if the item is a female person and item is not neuter:
		say "hun";
	otherwise if the grammatical gender of the item is masculine gender:
		say "den";
	otherwise if the grammatical gender of the item is neuter gender:
		say "det";

To say De:
	let the item be the prior named object;
	if the prior naming context is plural:
		say "De";
	otherwise if the item is the player:
		say "[Vi]";
	otherwise if the item is a male person and item is not neuter:
		say "Han";
	otherwise if the item is a female person and item is not neuter:
		say "Hun";
	otherwise if the grammatical gender of the item is masculine gender:
		say "Den";
	otherwise if the grammatical gender of the item is neuter gender:
		say "Det";

To say deres:
	let the item be the prior named object;
	if the prior naming context is plural:
		say "deres";
	otherwise if the item is the player:
		say "[vores item]";
	otherwise if the item is a male person and item is not neuter:
		say "hans";
	otherwise if the item is a female person and item is not neuter:
		say "hendes";
	otherwise if the grammatical gender of the item is masculine gender:
		say "dens";
	otherwise if the grammatical gender of the item is neuter gender:
		say "dets";

To say Deres:
	let the item be the prior named object;
	if the prior naming context is plural:
		say "Deres";
	otherwise if the item is the player:
		say "[Vores item]";
	otherwise if the item is a male person and item is not neuter:
		say "Hans";
	otherwise if the item is a female person and item is not neuter:
		say "Hendes";
	otherwise if the grammatical gender of the item is masculine gender:
		say "Dens";
	otherwise if the grammatical gender of the item is neuter gender:
		say "Dets";

To say dem:
	let the item be the prior named object;
	if the prior naming context is plural:
		say "dem";
	otherwise if the item is the player:
		say "[os]";
	otherwise if the item is a male person and item is not neuter:
		say "ham";
	otherwise if the item is a female person and item is not neuter:
		say "hende";
	otherwise if the grammatical gender of the item is masculine gender:
		say "den";
	otherwise if the grammatical gender of the item is neuter gender:
		say "det";

To say Dem:
	let the item be the prior named object;
	if the prior naming context is plural:
		say "Dem";
	otherwise if the item is the player:
		say "[Os]";
	otherwise if the item is a male person and item is not neuter:
		say "Ham";
	otherwise if the item is a female person and item is not neuter:
		say "Hende";
	otherwise if the grammatical gender of the item is masculine gender:
		say "Den";
	otherwise if the grammatical gender of the item is neuter gender:
		say "Det";

To say themselves:
	let the item be the prior named object;
	if the prior naming context is plural:
		say "dem selv";
	otherwise if the item is the player:
		say "[os selv]";
	otherwise if the item is a male person and item is not neuter:
		say "ham selv";
	otherwise if the item is a female person and item is not neuter:
		say "hende selv";
	otherwise if the grammatical gender of the item is masculine gender:
		say "den selv";
	otherwise if the grammatical gender of the item is neuter gender:
		say "det selv";

To say Themselves:
	let the item be the prior named object;
	if the prior naming context is plural:
		say "Dem selv";
	otherwise if the item is the player:
		say "[Os selv]";
	otherwise if the item is a male person and item is not neuter:
		say "Ham selv";
	otherwise if the item is a female person and item is not neuter:
		say "Hende selv";
	otherwise if the grammatical gender of the item is masculine gender:
		say "Den selv";
	otherwise if the grammatical gender of the item is neuter gender:
		say "Det selv";

To say det:
	say "[regarding nothing]det".

To say der:
	say "[regarding nothing]der".

To say Det:
	say "[regarding nothing]Det".

To say Der:
	say "[regarding nothing]Der".

To decide if (T - text) is s-terminated:
	let the last character be character number (number of characters in T) in T;
	if the last character is:
		-- "s": decide yes;
		-- "S": decide yes;
		-- "z": decide yes;
		-- "Z": decide yes;
		-- "x": decide yes;
		-- "X": decide yes;
		-- otherwise: decide no.

To say possessive: [possessive / genitive ]
	let the item be the prior named object;
	if the item is the player:
		say "[vor]"; [TODO]
	otherwise if the printed name of the item is s-terminated:
		say "[the item][apostrophe]";
	[otherwise if the printed name of the item is an acronym:
		say "[the item][apostrophe]s";] [ TODO ]
	otherwise:
		say "[the item]s";

To say Possessive: [ Possessive / Genitive]
	let the item be the prior named object;
	if the item is the player:
		say "[Vor]"; [TODO]
	otherwise if the printed name of the item is s-terminated:
		say "[The item][apostrophe]";
	[otherwise if the printed name of the item is an acronym:
		say "[The item][apostrophe]s";] [ TODO ]
	otherwise:
		say "[The item]s".



Include (-
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
-) replacing "Pronouns".

Include (-
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
    'nogen'   $$000111000111    INDEFART_PK     NULL ! Usually "nogle" will be the correct indefinite article, but we
    'nogle'   $$000111000111    INDEFART_PK     NULL ! support "nogen" as well just to be sure
    'lit'     $$111111111111    LIGHTED_PK      NULL
    'lighted' $$111111111111    LIGHTED_PK      NULL
    'unlit'   $$111111111111    UNLIGHTED_PK    NULL;
-) replacing "Descriptors".

section 1 (parser errors related to NPCs)


[this happens when an NPC is asked to do something, but no persuasion rule is set]

The requested actions require persuasion rule response (A) is "[Substantivet] [have] better things to do.".

[a generic, all-encompassing response when an NPC is asked to do something that is impossible or blocked: "bob, eat [something inedible]"]

The carry out requested actions rule response (A) is "[The noun] [are] unable to do that.".

[this happens when an NPC is asked to perform an out of world action. "bob, save"]

The action processing internal rule response (A) is "[bracket]Den kommando beder om at gøre noget uden for spillet, så den kan kun give mening fra dig til mig. [The noun] kan ikke bedes om at gøre dette.[close bracket]".

[this is the equivalent to "I don't understand that sentence," only it prints when giving instructions to an NPC. "Bob, put key adfakjhgkasdjf" for instance.]

The action processing internal rule response (K) is "I didn't understand that instruction.".


section 2  (general parser error messages)


[despite appearances, these seem to appear because of incomplete or flawed code. they are not really player feedback. the cause is when an action or command is incompletely remapped. For instance:

understand "grab" as taking

occurs when an "understand" phrase does not include a token for the thing to be acted upon or a rule for handling the missing noun. Typing "grab" alone on a command line will return a "you must supply a noun" message. Customize these if you wish, but the problem isn't the message, it's the code.

I'm not completely clear on the method for triggering C, E, G, and I since adding extra nouns/objects to understand phrases results in compile errors.

See 18.32 in the docs, "supplying a missing noun."]

The action processing internal rule response (B) is "You must name an object.".
The action processing internal rule response (C) is "You may not name an object.".
The action processing internal rule response (D) is "You must supply a noun.".
The action processing internal rule response (E) is "You may not supply a noun.".
The action processing internal rule response (F) is "You must name a second object.".
The action processing internal rule response (G) is "You may not name a second object.".
The action processing internal rule response (H) is "You must supply a second noun.".
The action processing internal rule response (I) is "You may not supply a second noun.".


[this one is funny. if you have something happen that makes a command invalid, this will fire. Very rare. For instance, if the player types "take all" but your project includes...

after taking the lamp:
	move the player to the closet.

...the "take all" has been disrupted.]


The action processing internal rule response (J) is "(Since something dramatic has happened, your list of commands has been cut short.)".

[incomplete command with gibberish for a second noun.

"put me alskdjfh"]

The parser error internal rule response (A) is "I didn't understand that sentence.".

[adding gibberish after a command applying to one thing. Note that it's going to print part of the player's command, so the format is important.

"examine me alsdkjh"]

The parser error internal rule response (B) is "I only understood you as far as wanting to ".

[adding gibberish after a complete go command. format should be preserved

"south adskljh"]

The parser error internal rule response (C) is "I only understood you as far as wanting to (go) ".

[the command requires a number, but the player typed text or gibberish instead

"count to asdkfjl"]

The parser error internal rule response (D) is "I didn't understand that number.".

[the most familiar of all these responses, perhaps. Prints when the player's command refers to a noun that is not visible or in scope. or else the noun (or a typo) does not exist anywhere in the game. Be careful with snark.]

The parser error internal rule response (E) is "[We] [can't] see any such thing.".

[very few actions allow multiple nouns or "all."

"examine all"]

The parser error internal rule response (H) is "Du kan ikke bruge flere objekter med det verbum.".

[using a pronoun when Inform 7 can't discern what it is referring to.

"examine her" when there is no "her" in the location]

The parser error internal rule response (J) is "I'm not sure what ['][pronoun i6 dictionary word]['] refers to.".

[the last noun referred to is not in the current location, so Inform 7 doesn't understand the pronoun used

"examine him" after leaving the room]

The parser error internal rule response (K) is "[We] [can't] see ['][pronoun i6 dictionary word]['] ([the noun]) at the moment.".

[attempting to do something that can only be done to things designated as applying to people only (in command grammar).

"kiss hat"]

The parser error internal rule response (M) is "You can only do that to something animate.".

[begin a command with something that is not a valid verb]

The parser error internal rule response (N) is "That's not a verb I [if American dialect option is active]recognize[otherwise]recognise[end if].".

[trying to do something to a specific number of a kind, but the number can't work (too high for instance)

"take three shoes" when there are only two shoes in the location.]

The parser error internal rule response (Q) is "[if number understood is 0]None[otherwise]Only [number understood in words][end if] of those [regarding the number understood][are] available.".

[a kind is specified in command grammar, but the command is used for something else.

For instance:

understand "frob [any shoe]" as frobbing"

">frob hat"]

The parser error internal rule response (R) is "That noun did not make sense in this context.".

[what it says]

The parser error internal rule response (T) is "You can't begin with a comma.".

[attempting to talk to someone who is not in the room:

"bob, jump" or "asdkluhasdfk, jump"]

The parser error internal rule response (U) is "You seem to want to talk to someone, but I can't see whom.".

[talking to a thing that isn't a person]

The parser error internal rule response (V) is "You can't talk to [the noun].".

[add something after the addressed person but before the comma in a "person, [action]" construction,

"bob asldkf, jump"]

The parser error internal rule response (W) is "To talk to someone, try 'someone, hello' or some such.".

[enter an empty (blank) command]

The parser error internal rule response (X) is "I beg your pardon?".

[some cases of specifying "all" in a command when there are no matching nouns

"put all in chest" when the player is not carrying anything]

The parser nothing error internal rule response (B) is "[There] [adapt the verb are from the third person plural] none at all available!".

[this error is triggered when attempting to take all from something that is not carrying anything. as you can see, the error doesn't actually apply to that situation.

a bug has been reported; perhaps this will be different in a future release. The original is preserved in this comment, but because it is bugged I have rewritten it.

The parser nothing error internal rule response (C) is "[regarding the noun][Those] [seem] to belong to [the noun].".
]

The parser nothing error internal rule response (C) is "[The noun] [aren't] carrying anything at the moment.".

[putting things in something that is is not a container

"put coin in sword]

The parser nothing error internal rule response (D) is "[regarding the noun][Those] [can't] contain things.".

[trying to take something from a closed opaque container, whether there's anything there or not. Alternately, trying to take all from an empty transparent container, because there's nothing there to create a "can't reach into containers" message. Trust me! If you want to account for both transparent and opaque contaienrs, here's an example with conditional text.

The parser nothing error internal rule response (E) is "[The noun][if the noun is transparent] [are] clearly empty[otherwise] [aren't] open[end if].".]

The parser nothing error internal rule response (E) is "[The noun] [aren't] open.".

[Different from the examine and search containers rules below. Instead, applies to things like

"get all from chest" when chest is empty.]

The parser nothing error internal rule response (F) is "[The noun] [are] empty.".

[the printed name of a dark room. affects the status line only, not the room description]

The darkness name internal rule response (A) is "Mørke".

[attempting to correct something with "OOPS" when the command is fine, the correction is not allowed (out of world commands for instance, or the correction is wrong

"oops take" or "oops save" or "oops asdlkjh"]

The parser command internal rule response (A) is "Sorry, that can't be corrected.".

[triggered by typing "oops" by itself at the command prompt without any corrected text.]

The parser command internal rule response (B) is "Think nothing of it.".

[exactly as stated

"oops take ball"]

The parser command internal rule response (C) is "'Oops' can only correct a single word.".

[using the again command on the first turn of a game. restoring a save should not have this effect since saves contain previous command information]

The parser command internal rule response (D) is "You can hardly repeat that.".

[a disambiguation question for commands that are directed to a person.

"person, jump" or "take person" when there is more than one person in the room.]

The parser clarification internal rule response (A) is "Who do you mean, ".

[a very familiar disambiguation question. You can handle this with a rule instead, as in "rule for asking which do you mean:"]
.
The parser clarification internal rule response (B) is "Which do you mean, ".

[using "all" in certain disambiguation answers when multiple nouns are not permitted, i.e."

>x shoe
Which do you mean, the sneaker or heel?

>all
Sorry, you can only have one item here. Which exactly?

also note that this appears to be missing a line break, so I've added one.]

The parser clarification internal rule response (C) is "Sorry, you can only have one item here. Which exactly?[line break]".

[a slightly different variant of the who do you mean question. The most obvious diffence is "whom" as opposed to "who." It is triggered when command grammar specifies a person."

"kiss person" will trigger this response, but "examine person" will trigger parser clarification internal rule response (A).]

The parser clarification internal rule response (D) is "Whom do you want [if the noun is not the player][the noun] [end if]to [parser command so far]?".

[applies when there is not enough information to ask a which do you mean question

"take" in a room full of things.]

The parser clarification internal rule response (E) is "What do you want [if the noun is not the player][the noun] [end if]to [parser command so far]?".

[text printed for an "if the player consents phrase".]

The yes or no question internal rule response (A) is "Please answer yes or no.".

[built in addition for explicit taking, i.e. "wear shirt" when the shirt isn't held by the player.]

The standard implicit taking rule response (A) is "(first taking [the noun])[command clarification break]".

[implicit taking when persuading an NPC, ie "janet, wear shirt".]

The standard implicit taking rule response (B) is "([the second noun] first taking [the noun])[command clarification break]".

[better to use "end the story saying "something"".]

The print obituary headline rule response (C) is " The End ".



section 3 (out of world and meta)

[only happens if you declare "use undo prevention" in your project.]

The immediately undo rule response (A) is "The use of 'undo' is forbidden in this story.".

[using "undo" at the beginning of a game.]

The immediately undo rule response (B) is "You can't 'undo' what hasn't been done!".

[hopefully this never comes up, unless the project targets retro systems with limited resources. perhaps not even then. I'm not aware of a specific interpreter with this limitation, especially not one capable of running Glulx games.]

The immediately undo rule response (C) is "Your interpreter does not provide 'undo'. Sorry!".

[standard Undo response. If you want more control over undo behavior, I recommend the extension "undo output control" by nathanael nerode.]

The immediately undo rule response (E) is "[bracket]Previous turn undone.[close bracket]".

[the undo stack is held in memory, and the number of turns that can be undone will vary according to computing conditions. but once you're out, you're out.]

The immediately undo rule response (F) is "'Undo' capacity exhausted. Sorry!".

[standard responses based on starting stopping etc]

The quit the game rule response (A) is "Are you sure you want to quit? ".
The save the game rule response (A) is "Save failed.".
The save the game rule response (B) is "Ok.".
The restore the game rule response (A) is "Restore failed.".
The restore the game rule response (B) is "Ok.".
The restart the game rule response (A) is "Are you sure you want to restart? ".
The restart the game rule response (B) is "Failed.".
The verify the story file rule response (A) is "The game file has verified as intact.".
The verify the story file rule response (B) is "The game file did not verify as intact, and may be corrupt.".
The switch the story transcript on rule response (A) is "Transcripting is already on.".
The switch the story transcript on rule response (B) is "Start of a transcript of:".
The switch the story transcript on rule response (C) is "Attempt to begin transcript failed.".
The switch the story transcript off rule response (A) is "Transcripting is already off.".
The switch the story transcript off rule response (B) is "[line break]End of transcript.".
The switch the story transcript off rule response (C) is "Attempt to end transcript failed.".

[changing room description preferences. rarely used these days.]

The standard report preferring abbreviated room descriptions rule response (A) is " is now in its 'superbrief' mode, which always gives short descriptions of locations (even if you haven't been there before).".
The standard report preferring unabbreviated room descriptions rule response (A) is " is now in its 'verbose' mode, which always gives long descriptions of locations (even if you've been there before).".
The standard report preferring sometimes abbreviated room descriptions rule response (A) is " is now in its 'brief' printing mode, which gives long descriptions of places never before visited and short descriptions otherwise.".

[pertaining to endings and final questions]

The print the final prompt rule response (A) is "> [run paragraph on]".
The print the final question rule response (A) is "Would you like to ".
The print the final question rule response (B) is " or ".
The standard respond to final question rule response (A) is "Please give one of the answers above.".

section 4 (scoring)

The announce the score rule response (A) is "[if the story has ended]In that game you scored[otherwise]You have so far scored[end if] [score] out of a possible [maximum score], in [turn count] turn[s]".
The announce the score rule response (B) is ", earning you the rank of ".
The announce the score rule response (C) is "[There] [are] no score in this story.".
The announce the score rule response (D) is "[bracket]Your score has just gone up by [number understood in words] point[s].[close bracket]".
The announce the score rule response (E) is "[bracket]Your score has just gone down by [number understood in words] point[s].[close bracket]".
The standard report switching score notification on rule response (A) is "Score notification on.".
The standard report switching score notification off rule response (A) is "Score notification off.".


section 5 (descriptions and appearances)

[I don't think changing these will be productive for many authors, but I'll leave them up here because they print so often.]

[when we have asserted an "initial appearance" for something, it will get its own paragraph in the room description. other litems will be listed, constructed from A through F]

The you-can-also-see rule response (A) is "[We] ".
The you-can-also-see rule response (B) is "On [the domain] [we] ".
The you-can-also-see rule response (C) is "In [the domain] [we] ".
The you-can-also-see rule response (D) is "[regarding the player][can] also see ".
The you-can-also-see rule response (E) is "[regarding the player][can] see ".
The you-can-also-see rule response (F) is " here".

[used for listing contents of supporters in room descriptions]

The use initial appearance in room descriptions rule response (A) is "On [the item] ".
The describe what's on scenery supporters in room descriptions rule response (A) is "On [the item] ".
The describe what's on mentioned supporters in room descriptions rule response (A) is "On [the item] ".

[unlike The darkness name internal rule response (A), this prints as a room name while looking, but doesn't change the status bar]

The room description heading rule response (A) is "Mørke".

[room description of a dark room]

The room description body text rule response (A) is "Det [if story tense is present tense]er[otherwise if story tense is past tense]var[end if] bælgmørkt, og [we] [if story tense is present tense]kan[otherwise if story tense is past tense]kunde[end if] ikke se noget.".

[prints when a player is in or on an enterable container / supporter]

The room description heading rule response (B) is " (på [the intermediate level])".
The room description heading rule response (C) is " (indeni [the intermediate level])".

Section 6 (looking, examining, and searching)

The other people looking rule response (A) is "[The actor] [look] around.".
The examine directions rule response (A) is "[We] [see] nothing unexpected in that direction.".
The examine containers rule response (A) is "In [the noun] ".
The examine containers rule response (B) is "[The noun] [are] empty.".
The examine supporters rule response (A) is "On [the noun] ".
The examine devices rule response (A) is "[The noun] [are] [if story tense is present tense]currently [end if]switched [if the noun is switched on]on[otherwise]off[end if].".
The examine undescribed things rule response (A) is "[We] [see] nothing special about [the noun].".
The report other people examining rule response (A) is "[The actor] [look] closely at [the noun].".
The standard looking under rule response (A) is "[We] [find] nothing of interest.".
The report other people looking under rule response (A) is "[The actor] [look] under [the noun].".
The can't search unless container or supporter rule response (A) is "[We] [find] nothing of interest.".
The can't search closed opaque containers rule response (A) is "[We] [can't see] inside, since [the noun] [are] closed.".
The standard search containers rule response (A) is "In [the noun] ".
The standard search containers rule response (B) is "[The noun] [are] empty.".
The standard search supporters rule response (A) is "On [the noun] ".
The standard search supporters rule response (B) is "[There] [are] nothing on [the noun].".
The report other people searching rule response (A) is "[The actor] [search] [the noun].".

[consulting involves checking a noun for a topic, ie looking something up in an encyclopedia.]

The block consulting rule response (A) is "[We] [discover] nothing of interest in [the noun].".
The block consulting rule response (B) is "[The actor] [look] at [the noun].".

section 7 (inventory)

[these rules don't change much, as the listed items are what people are looking for in an inventory response. that will require a custom rule, which is high effort (but a good experience!) for beginning authors looking for a challenge. See 6.7 in the Inform 10.2 documentation, along with the provided examples for more information.]

The print empty inventory rule response (A) is "[Vi] bærer ingenting.".
The print standard inventory rule response (A) is "[We] [are] carrying:[line break]".
The report other people taking inventory rule response (A) is "[The actor] [look] through [their] possessions.".

section 8 (taking, dropping, inserting, putting)

[the rule names here are happily comprehensible. some are high-risk in my opinion, so test thoroughly. Note as always that container and supporter responses are scattered everywhere, so take care to be consistent while changing those.]

The can't take yourself rule response (A) is "[We] [are] always self-possessed.".
The can't take other people rule response (A) is "I don't suppose [the noun] [would care] for that.".
The can't take component parts rule response (A) is "[regarding the noun][Those] [seem] to be a part of [the whole].".

[IMPORTANT: This rule only applies to TAKING things that are held by NPCs. REMOVING things, or TAKING things FROM is a separate action that has its own ruleset. Those cases are generally covered by the The can't remove from people rule response (A). If the NPC is not holding anything, a parser error is generated instead: the parser nothing error internal rule response (C).]

The can't take people's possessions rule response (A) is "[regarding the noun][Those] [seem] to belong to [the owner].".
[The can't take items out of play rule response (A) is "[regarding the noun][Those] [aren't] available.".] [ TODO has been removed ]
The can't take what you're inside rule response (A) is "[We] [would have] to get [if noun is a supporter]off[otherwise]out of[end if] [the noun] first.".
The can't take what's already taken rule response (A) is "[We] already [have] [regarding the noun][those].".
The can't take scenery rule response (A) is "[regarding the noun][They're] hardly portable.".
[The can only take things rule response (A) is "[We] [cannot] carry [the noun].".] [ TODO has been removed ]
The can't take what's fixed in place rule response (A) is "[regarding the noun][They're] fixed in place.".
The use player's holdall to avoid exceeding carrying capacity rule response (A) is "(putting [the transferred item] into [the current working sack] to make room)[command clarification break]".
The can't exceed carrying capacity rule response (A) is "[We]['re] carrying too many things already.".
The standard report taking rule response (A) is "Taken.".
The standard report taking rule response (B) is "[The actor] [pick] up [the noun].".
The can't remove what's not inside rule response (A) is "But [regarding the noun][they] [aren't] there now.".

[IMPORTANT: This rule only applies to REMOVING (or TAKING) things FROM NPCs. TAKING things that are held by an NPC involves a separate action that has its own ruleset. Those cases are generally covered by the The can't take people's possessions rule response (A). If the NPC is not holding anything, a parser error is generated instead: the parser nothing error internal rule response (C).]

The can't remove from people rule response (A) is "[regarding the noun][Those] [seem] to belong to [the owner].".
The can't drop yourself rule response (A) is "[We] [lack] the dexterity.".
The can't drop body parts rule response (A) is "[We] [can't drop] part of [ourselves].".
The can't drop what's already dropped rule response (A) is "[The noun] [are] already here.".
The can't drop what's not held rule response (A) is "[We] [haven't] got [regarding the noun][those].".
The can't drop clothes being worn rule response (A) is "(first taking [the noun] off)[command clarification break]".
The can't drop if this exceeds carrying capacity rule response (A) is "[There] [are] no more room on [the receptacle].".
The can't drop if this exceeds carrying capacity rule response (B) is "[There] [are] no more room in [the receptacle].".
The standard report dropping rule response (A) is "Dropped.".
The standard report dropping rule response (B) is "[The actor] [put] down [the noun].".
The can't put something on itself rule response (A) is "[We] [can't put] something on top of itself.".
The can't put onto what's not a supporter rule response (A) is "Putting things on [the second noun] [would achieve] nothing.".
The can't put clothes being worn rule response (A) is "(first taking [regarding the noun][them] off)[command clarification break]".
The can't put if this exceeds carrying capacity rule response (A) is "[There] [are] no more room on [the second noun].".
The concise report putting rule response (A) is "Done.".
The standard report putting rule response (A) is "[The actor] [put] [the noun] on [the second noun].".
The can't insert what's already inserted rule response (A) is "[The noun] [are] already there.".
The can't insert something into itself rule response (A) is "[We] [can't put] something inside itself.".
The can't insert into closed containers rule response (A) is "[The second noun] [are] closed.".
The can't insert into what's not a container rule response (A) is "[regarding the second noun][Those] [can't contain] things.".
The can't insert clothes being worn rule response (A) is "(first taking [regarding the noun][them] off)[command clarification break]".
The can't insert if this exceeds carrying capacity rule response (A) is "[There] [are] no more room in [the second noun].".
The concise report inserting rule response (A) is "Done.".
The standard report inserting rule response (A) is "[The actor] [put] [the noun] into [the second noun].".

section 9 (going and traversal)

[even though travelling features many messages, some are quite uncommon. others are hard to replace in a way that gives all needed information. I didn't break these up and move some to the end (caution advised section), but modifying some of these have potential for making trouble.]

The block vaguely going rule response (A) is "You'll have to say which compass direction to go in.".
The stand up before going rule response (A) is "(first getting off [the chaise])[command clarification break]".
The can't travel in what's not a vehicle rule response (A) is "[We] [would have] to get off [the nonvehicle] first.".
The can't travel in what's not a vehicle rule response (B) is "[We] [would have] to get out of [the nonvehicle] first.".
The can't go through undescribed doors rule response (A) is "[We] [can't go] that way.".
The can't go through closed doors rule response (A) is "(first opening [the door gone through])[command clarification break]".
The can't go that way rule response (A) is "[We] [can't go] that way.".
The can't go that way rule response (B) is "[We] [can't], since [the door gone through] [lead] nowhere.".
The describe room gone into rule response (A) is "[The actor] [go] up".
The describe room gone into rule response (B) is "[The actor] [go] down".
The describe room gone into rule response (C) is "[The actor] [go] [noun]".
The describe room gone into rule response (D) is "[The actor] [arrive] from above".
The describe room gone into rule response (E) is "[The actor] [arrive] from below".
The describe room gone into rule response (F) is "[The actor] [arrive] from [the back way]".
The describe room gone into rule response (G) is "[The actor] [arrive]".
The describe room gone into rule response (H) is "[The actor] [arrive] at [the room gone to] from above".
The describe room gone into rule response (I) is "[The actor] [arrive] at [the room gone to] from below".
The describe room gone into rule response (J) is "[The actor] [arrive] at [the room gone to] from [the back way]".
The describe room gone into rule response (K) is "[The actor] [go] through [the noun]".
The describe room gone into rule response (L) is "[The actor] [arrive] from [the noun]".
The describe room gone into rule response (M) is "on [the vehicle gone by]".
The describe room gone into rule response (N) is "in [the vehicle gone by]".
The describe room gone into rule response (O) is ", pushing [the thing gone with] in front, and [us] along too".
The describe room gone into rule response (P) is ", pushing [the thing gone with] in front".
The describe room gone into rule response (Q) is ", pushing [the thing gone with] away".
The describe room gone into rule response (R) is ", pushing [the thing gone with] in".
The describe room gone into rule response (S) is ", taking [us] along".
The can't enter what's already entered rule response (A) is "But [we]['re] already on [the noun].".
The can't enter what's already entered rule response (B) is "But [we]['re] already in [the noun].".
The can't enter what's not enterable rule response (A) is "[regarding the noun][They're] not something [we] [can] stand on.".
The can't enter what's not enterable rule response (B) is "[regarding the noun][They're] not something [we] [can] sit down on.".
The can't enter what's not enterable rule response (C) is "[regarding the noun][They're] not something [we] [can] lie down on.".
The can't enter what's not enterable rule response (D) is "[regarding the noun][They're] not something [we] [can] enter.".
The can't enter closed containers rule response (A) is "[We] [can't get] into the closed [noun].".
The can't enter if this exceeds carrying capacity rule response (A) is "[There] [are] no more room on [the noun].".
The can't enter if this exceeds carrying capacity rule response (B) is "[There] [are] no more room in [the noun].".
The can't enter something carried rule response (A) is "[We] [can] only get into something free-standing.".
The implicitly pass through other barriers rule response (A) is "(getting off [the current home])[command clarification break]".
The implicitly pass through other barriers rule response (B) is "(getting out of [the current home])[command clarification break]".
The implicitly pass through other barriers rule response (C) is "(getting onto [the target])[command clarification break]".
The implicitly pass through other barriers rule response (D) is "(getting into [the target])[command clarification break]".
The implicitly pass through other barriers rule response (E) is "(entering [the target])[command clarification break]".
The standard report entering rule response (A) is "[We] [get] onto [the noun].".
The standard report entering rule response (B) is "[We] [get] into [the noun].".
The standard report entering rule response (C) is "[The actor] [get] into [the noun].".
The standard report entering rule response (D) is "[The actor] [get] onto [the noun].".
The can't exit when not inside anything rule response (A) is "But [we] [aren't] in anything at the [if story tense is present tense]moment[otherwise]time[end if].".
The can't exit closed containers rule response (A) is "You can't get out of the closed [cage].".
The standard report exiting rule response (A) is "[We] [get] off [the container exited from].".
The standard report exiting rule response (B) is "[We] [get] out of [the container exited from].".
The standard report exiting rule response (C) is "[The actor] [get] out of [the container exited from].".
The can't get off things rule response (A) is "But [we] [aren't] on [the noun] at the [if story tense is present tense]moment[otherwise]time[end if].".
The standard report getting off rule response (A) is "[The actor] [get] off [the noun].".

section 10 (locks and locking)

[locking isn't thoroghly implemented in the standard rules. it's worth a bit of research or checking out the locksmith extension by emily short before spending a lot of time here.]

The can't lock without a lock rule response (A) is "[regarding the noun][Those] [don't] seem to be something [we] [can] lock.".
The can't lock what's already locked rule response (A) is "[regarding the noun][They're] locked at the [if story tense is present tense]moment[otherwise]time[end if].".
The can't lock what's open rule response (A) is "First [we] [would have] to close [the noun].".
The can't lock without the correct key rule response (A) is "[regarding the second noun][Those] [don't] seem to fit the lock.".
The standard report locking rule response (A) is "[We] [lock] [the noun].".
The standard report locking rule response (B) is "[The actor] [lock] [the noun].".
The can't unlock without a lock rule response (A) is "[regarding the noun][Those] [don't] seem to be something [we] [can] unlock.".
The can't unlock what's already unlocked rule response (A) is "[regarding the noun][They're] unlocked at the [if story tense is present tense]moment[otherwise]time[end if].".
The can't unlock without the correct key rule response (A) is "[regarding the second noun][Those] [don't] seem to fit the lock.".
The standard report unlocking rule response (A) is "[We] [unlock] [the noun].".
The standard report unlocking rule response (B) is "[The actor] [unlock] [the noun].".


section 11 (devices)

The can't switch on unless switchable rule response (A) is "[regarding the noun][They] [aren't] something [we] [can] switch.".
The can't switch on what's already on rule response (A) is "[regarding the noun][They're] already on.".
The standard report switching on rule response (A) is "[The actor] [switch] [the noun] on.".
The can't switch off unless switchable rule response (A) is "[regarding the noun][They] [aren't] something [we] [can] switch.".
The can't switch off what's already off rule response (A) is "[regarding the noun][They're] already off.".
The standard report switching off rule response (A) is "[The actor] [switch] [the noun] off.".

section 12 (opening and closing)

The can't open unless openable rule response (A) is "[regarding the noun][They] [aren't] something [we] [can] open.".
The can't open what's already open rule response (A) is "[regarding the noun][They're] already open.".
The can't open what's locked rule response (A) is "[regarding the noun][They] [seem] to be locked.".

[opening an opaque container that contains something]

The reveal any newly visible interior rule response (A) is "[We] [open] [the noun], revealing ".

[====]

The standard report opening rule response (A) is "[We] [open] [the noun].".
The standard report opening rule response (B) is "[The actor] [open] [the noun].".
The can't close unless openable rule response (A) is "[regarding the noun][They] [aren't] something [we] [can] close.".
The can't close what's already closed rule response (A) is "[regarding the noun][They're] already closed.".
The standard report closing rule response (A) is "[We] [close] [the noun].".
The standard report closing rule response (B) is "[The actor] [close] [the noun].".

section 13 (wearing and taking off)

The can't wear what's not clothing rule response (A) is "[We] [can't wear] [regarding the noun][those]!".
[The can't wear what's not held rule response (A) is "[We] [aren't] holding [regarding the noun][those]!".] [TODO]
The can't wear what's already worn rule response (A) is "[We]['re] already wearing [regarding the noun][those]!".
The standard report wearing rule response (A) is "[We] [put] on [the noun].".
The standard report wearing rule response (B) is "[The actor] [put] on [the noun].".
The can't take off what's not worn rule response (A) is "[We] [aren't] wearing [the noun].".
The can't exceed carrying capacity when taking off rule response (A) is "[We]['re] carrying too many things already.".
The standard report taking off rule response (A) is "[We] [take] off [the noun].".
The standard report taking off rule response (B) is "[The actor] [take] off [the noun].".
The implicitly remove thrown clothing rule response (A) is "(first taking [the noun] off)[command clarification break]".

section 14 (giving)

[The can't give what you haven't got rule response (A) is "[We] [aren't] holding [the noun].".] [TODO]
The can't give to yourself rule response (A) is "[We] [can't give] [the noun] to [ourselves].".
The can't give to a non-person rule response (A) is "[The second noun] [aren't] able to receive things.".
The can't give clothes being worn rule response (A) is "(first taking [the noun] off)[command clarification break]".
The block giving rule response (A) is "[The second noun] [don't] seem interested.".
The can't exceed carrying capacity when giving rule response (A) is "[The second noun] [are] carrying too many things already.".
The standard report giving rule response (A) is "[We] [give] [the noun] to [the second noun].".
The standard report giving rule response (B) is "[The actor] [give] [the noun] to [us].".
The standard report giving rule response (C) is "[The actor] [give] [the noun] to [the second noun].".
[The can't show what you haven't got rule response (A) is "[We] [aren't] holding [the noun].".] [TODO]

section 15 (manipulating objects)

The can't pull what's fixed in place rule response (A) is "[regarding the noun][They] [are] fixed in place.".
The can't pull scenery rule response (A) is "[We] [are] unable to.".
The can't pull people rule response (A) is "[The noun] [might not like] that.".
The report pulling rule response (A) is "Nothing obvious [happen].".
The report pulling rule response (B) is "[The actor] [pull] [the noun].".
The can't push what's fixed in place rule response (A) is "[regarding the noun][They] [are] fixed in place.".
The can't push scenery rule response (A) is "[We] [are] unable to.".
The can't push people rule response (A) is "[The noun] [might not like] that.".
The report pushing rule response (A) is "Nothing obvious [happen].".
The report pushing rule response (B) is "[The actor] [push] [the noun].".
The can't turn what's fixed in place rule response (A) is "[regarding the noun][They] [are] fixed in place.".
The can't turn scenery rule response (A) is "[We] [are] unable to.".
The can't turn people rule response (A) is "[The noun] [might not like] that.".
The report turning rule response (A) is "Nothing obvious [happen].".
The report turning rule response (B) is "[The actor] [turn] [the noun].".
The can't push unpushable things rule response (A) is "[The noun] [cannot] be pushed from place to place.".
The can't push to non-directions rule response (A) is "[regarding the noun][They] [aren't] a direction.".
The can't push vertically rule response (A) is "[The noun] [cannot] be pushed up or down.".
The can't push from within rule response (A) is "[The noun] [cannot] be pushed from here.".
The block pushing in directions rule response (A) is "[The noun] [cannot] be pushed from place to place.".

section 16 (blocked actions and generic responses)

[You'll need to "get in front" of these rules or delist if you want to use these actions for something other than printing default messages.]

The block showing rule response (A) is "[The second noun] [are] unimpressed.".
The block waking rule response (A) is "That [seem] unnecessary.".
The futile to throw things at inanimate objects rule response (A) is "Futile.".
The block throwing at rule response (A) is "[We] [lack] the nerve when it [if story tense is the past tense]came[otherwise]comes[end if] to the crucial moment.".
The block attacking rule response (A) is "Violence [aren't] the answer to this one.".
The kissing yourself rule response (A) is "[We] [don't] get much from that.".
The block kissing rule response (A) is "[The noun] [might not] like that.".
The standard report waiting rule response (A) is "Time [pass].".
The standard report waiting rule response (B) is "[The actor] [wait].".
The report touching yourself rule response (A) is "[We] [achieve] nothing by this.".
The report touching yourself rule response (B) is "[The actor] [touch] [themselves].".
The report touching other people rule response (A) is "[The noun] [might not like] that.".
The report touching other people rule response (B) is "[The actor] [touch] [us].".
The report touching other people rule response (C) is "[The actor] [touch] [the noun].".
The report touching things rule response (A) is "[We] [feel] nothing unexpected.".
The report touching things rule response (B) is "[The actor] [touch] [the noun].".
The can't wave what's not held rule response (A) is "But [we] [aren't] holding [regarding the noun][those].".
The report waving things rule response (A) is "[We] [wave] [the noun].".
The report waving things rule response (B) is "[The actor] [wave] [the noun].".
The innuendo about squeezing people rule response (A) is "[The noun] [might not like] that.".
The report squeezing rule response (A) is "[We] [achieve] nothing by this.".
The report squeezing rule response (B) is "[The actor] [squeeze] [the noun].".
The block burning rule response (A) is "This dangerous act [would achieve] little.".
The block waking up rule response (A) is "The dreadful truth [are], this [are not] a dream.".
The block thinking rule response (A) is "What a good idea.".
The report smelling rule response (A) is "[We] [smell] nothing unexpected.".
The report smelling rule response (B) is "[The actor] [sniff].".
The report listening rule response (A) is "[We] [hear] nothing unexpected.".
The report listening rule response (B) is "[The actor] [listen].".
The report tasting rule response (A) is "[We] [taste] nothing unexpected.".
The report tasting rule response (B) is "[The actor] [taste] [the noun].".
The block cutting rule response (A) is "Cutting [regarding the noun][them] up [would achieve] little.".
The report jumping rule response (A) is "[We] [jump] on the spot.".
The report jumping rule response (B) is "[The actor] [jump] on the spot.".
The block tying rule response (A) is "[We] [would achieve] nothing by this.".
The block drinking rule response (A) is "[There's] nothing suitable to drink here.".
The block saying sorry rule response (A) is "Oh, don't [if American dialect option is active]apologize[otherwise]apologise[end if].".
The block swinging rule response (A) is "[There's] nothing sensible to swing here.".
The can't rub another person rule response (A) is "[The noun] [might not like] that.".
The report rubbing rule response (A) is "[We] [rub] [the noun].".
The report rubbing rule response (B) is "[The actor] [rub] [the noun].".
The block setting it to rule response (A) is "No, [we] [can't set] [regarding the noun][those] to anything.".
The report waving hands rule response (A) is "[We] [wave].".
The report waving hands rule response (B) is "[The actor] [wave].".
The block buying rule response (A) is "Nothing [are] on sale.".
The block climbing rule response (A) is "Little [are] to be achieved by that.".
The block sleeping rule response (A) is "[We] [aren't] feeling especially drowsy.".
The can't eat unless edible rule response (A) is "[regarding the noun][They're] plainly inedible.".
The can't eat clothing without removing it first rule response (A) is "(first taking [the noun] off)[command clarification break]".
The can't eat other people's food rule response (A) is "[The owner] [might not appreciate] that.".
The standard report eating rule response (A) is "[We] [eat] [the noun]. Not bad.".
The standard report eating rule response (B) is "[The actor] [eat] [the noun].".

section 17 (communication)

The block answering rule response (A) is "[There] [are] no reply.".
The telling yourself rule response (A) is "[We] [talk] to [ourselves] a while.".
The block telling rule response (A) is "This [provoke] no reaction.".
The block asking rule response (A) is "[There] [are] no reply.".
The block saying yes rule response (A) is "That was a rhetorical question.".
The block saying no rule response (A) is "That was a rhetorical question.".


chapter 9 (scope and visibility)

[You probably will not want to do anything with these, unless you are experimenting with visibility and scope. And a lot of the time, the error isn't really related to the player, it's the result of some programming.]

[This is an errror message about darkness. It fires when the light is suddenly cut off.]

The adjust light rule response (A) is "[It] [are] [if story tense is present tense]now [end if]pitch dark in [if story tense is present tense]here[else]there[end if]!".

[this is what prints when attempting to interact with something that must be visible in a dark room]

The basic visibility rule response (A) is "Det [if story tense is present tense]er[otherwise if story tense is past tense]var[end if] bælgmørkt, og [we] [if story tense is present tense]kan[otherwise if story tense is past tense]kunde[end if] ikke se noget.".

[I've only triggered this one by trying to physically interact with a direction: "take south" for instance. Perhaps it could be applied to other nouns (a direction is a noun), but I've never seen it done. Note that you can circumvent this with a "before" rule, because visibility and accessibility are still mushy. For instance...

before climbing up:
	try going up instead.

...works, but...

instead of climbing up:
	try going up.

...doesn't, because "instead" happens too late in action processing.]

The basic accessibility rule response (A) is "You must name something more substantial.".

[This is a strange one. Most often it results from code rather than player action, for instance redirecting an action to a noun that isn't present]

The access through barriers rule response (A) is "[regarding the noun][Those] [aren't] available.".

[I believe this only prints when trying to manipulate an object inside (or from within) a closed, transparent container.

EXCEPTION: this is only true if there is something in the chest. Otherwise, the rather unhelpful parser nothing error internal rule response (E) will report that the empty, transparent container is empty. Be sure to check it as well!]

The can't reach inside closed containers rule response (A) is "[The noun] [aren't] open.".
The can't reach outside closed containers rule response (A) is "[The noun] [aren't] open.".

[this usually means you changed the scope of the player and they are trying to interact with something in another room. you'll have to disable the reach inside rooms rule if you want something different. note that this can cause really weird things to happen]

The can't reach inside rooms rule response (A) is "[We] [can't] reach into [the noun].".

section 10 (the list writer)

[I have no advice, though messing with this seems hazardous]

The list writer internal rule response (A) is " (".
The list writer internal rule response (B) is ")".
The list writer internal rule response (C) is " and ".
The list writer internal rule response (D) is "providing light".
The list writer internal rule response (E) is "closed".
The list writer internal rule response (F) is "empty".
The list writer internal rule response (G) is "closed and empty".
The list writer internal rule response (H) is "closed and providing light".
The list writer internal rule response (I) is "empty and providing light".
The list writer internal rule response (J) is "closed, empty[if serial comma option is active],[end if] and providing light".
The list writer internal rule response (K) is "providing light and being worn".
The list writer internal rule response (L) is "being worn".
The list writer internal rule response (M) is "open".
The list writer internal rule response (N) is "open but empty".
The list writer internal rule response (O) is "closed".
The list writer internal rule response (P) is "closed and locked".
The list writer internal rule response (Q) is "containing".
The list writer internal rule response (R) is "on [if the noun is a person]whom[otherwise]which[end if] ".
The list writer internal rule response (S) is ", on top of [if the noun is a person]whom[otherwise]which[end if] ".
The list writer internal rule response (T) is "in [if the noun is a person]whom[otherwise]which[end if] ".
The list writer internal rule response (U) is ", inside [if the noun is a person]whom[otherwise]which[end if] ".
The list writer internal rule response (V) is "[regarding list writer internals][are]".
The list writer internal rule response (W) is "[regarding list writer internals][are] nothing".
The list writer internal rule response (X) is "Nothing".
The list writer internal rule response (Y) is "nothing".

section 11 (caution is advised)

[these are substitutions for other rule responses. changing them is not recommended.]

The parser clarification internal rule response (F) is "those things".
The parser clarification internal rule response (G) is "that".
The parser clarification internal rule response (H) is " or ".

[printed names for the protagonist. These shouldn't come up much, and always seem awkward when they do. take care to avoid weird sentences and test heavily. (C) suggests a problem in code.]

The print protagonist internal rule response (A) is "[We]".
The print protagonist internal rule response (B) is "[ourselves]".
The print protagonist internal rule response (C) is "[our] former self".

[pronoun lister]

The announce the pronoun meanings rule response (A) is "At the moment, ".
The announce the pronoun meanings rule response (B) is "means ".
The announce the pronoun meanings rule response (C) is "is unset".
The announce the pronoun meanings rule response (D) is "no pronouns are known to the game.".

[lists items in commands applied to multiple things, i.e. "take all" or "put all in chest". hazardous, probably]

The announce items from multiple object lists rule response (A) is "[current item from the multiple object list]: [run paragraph on]".


chapter 99999999 (vestigal)

section 1 (confirmed)

The generate action rule response (A) is "(considering the first sixteen objects only)[command clarification break]".
The generate action rule response (B) is "Nothing to do!".
The parser error internal rule response (F) is "You seem to have said too little!".
The parser error internal rule response (G) is "[We] [aren't] holding that!".
The parser error internal rule response (I) is "You can only use multiple objects once on a line.".
The parser error internal rule response (O) is "That's not something you need to refer to in the course of this game.".
The parser error internal rule response (P) is "I didn't understand the way that finished.".
The print obituary headline rule response (A) is " You have died ".
The print obituary headline rule response (B) is " You have won ".




section 2 (not sure how to trigger or if it's possible)

The parser nothing error internal rule response (A) is "Nothing to do!".
The immediately undo rule response (D) is "'Undo' failed. Sorry!".

[these seem to be a failsafe for something other than an actor closing or opening things.]

The standard report opening rule response (C) is "[The noun] [open].".
The standard report closing rule response (C) is "[The noun] [close].".

[Inform doesn't seem to mind excluding excluded things. Vestigal?]

The parser error internal rule response (L) is "You excepted something not included anyway!".

[I can't recreate this. Inform returns "There is no reply."]

The parser error internal rule response (S) is "To repeat a command like 'frog, jump', just say 'again', not 'frog, again'.".

Volume - Testing (not for release)

To say plural of (name of kind of value K):
	carry out the printing the plural name activity with a random K.


