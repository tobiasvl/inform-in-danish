Preamble.

To make Danish the language of play.

@h Preamble.

=
Volume - Preamble

Use authorial modesty.

@ We need to replace this section to override the default story headline.
=
[ Section - Unindexed Standard Rules variables (in place of "Section 7 - Unindexed Standard Rules variables" in Standard Rules by Graham Nelson) ]

The story title, the story author, the story headline, the story genre
and the story description are text variables.
The release number and the story creation year are number variables.

The release number is usually 1.

@ The story headline could perhaps be "En interaktiv fiktion", but that's
not a common Danish term. However, we could of course proliferate it by using
it here...
=
The story headline is usually "Et teksteventyr".

@ We leave the story genre in English, because it's mostly used for
categorization.
=
The story genre is usually "Fiction".

[ The story title variable translates into Inter as "Story". ]

@ We override this.
=
Section - Unindexed Standard Rules variables (for figures language element only) (in place of "Section SR2/6b - Unindexed Standard Rules variables" in Standard Rules by Graham Nelson)

Figure of cover is the file of cover art ("Omslagskunsten.").

@h Grammatical definitions.

We replace this whole section in order to change a few things.
=
Section - Grammatical definitions (in place of Section 1 - Grammatical definitions in English Language by Graham Nelson)

The language of play is a natural language that varies.
The language of play is the Danish language.

A grammatical tense is a kind of value. The grammatical tenses are present tense,
past tense, perfect tense, past perfect tense, [and] future tense and imperative tense.

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

@ Uses the modern "vores" as the catch-all translation of "our(s)" instead of
"vor/vort/vore" depending on grammatical gender and plurality.
=
Use vores spelling translates as (- Constant VORES_SPELLING; -).

@ Uses the archaic plurality form of present tense.
=
Use archaic plural present tense translates as (- Constant ARCHAIC_PLURAL_PRESENT_TENSE; -).

@ Capitalizes nouns.
=
Use capitalized nouns translates as (- Constant CAPITALIZED_NOUNS; -).

@h Adaptive text viewpoint.

In English, the adaptive text viewpoint is first person plural, because all the
pronouns need to be different, and that's the only viewpoint where that's true.
But in Danish we might as well use second person singular, which is the same as
the default story viewpoint. 
=
A natural language has a narrative viewpoint called the adaptive text viewpoint.
The adaptive text viewpoint of the English language is first person plural.
The adaptive text viewpoint of the Danish language is second person singular.

A grammatical case is a kind of value. The grammatical cases are nominative
and accusative. [ nominativ & oblik ]

@h Gender.

We reorder the grammatical genders to make masculine gender the default, and
comment out the feminine gender as Danish doesn't use it. The rest of the
grammar related to gender can be found in //Gender//.
=
A grammatical gender is a kind of value. The grammatical genders are
masculine gender, neuter gender[, feminine gender].
[ TODO check if reordering breaks the constants https://ganelson.github.io/inform/inflections-module/3-lc.html ]

Masculine gender translates into Danish as fælleskøn.
Neuter gender translates into Danish as intetkøn.

An object has a grammatical gender.

The grammatical gender property translates into I6 as "grammatical_gender".

@ The rest is identical to the English Language.
=
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

@h People.

We need to replace this section wholesale to get at the description of |yourself|.
While we're here, we also do another change: A person is now usually transparent
instead of always, to make ||concealment -> https://ganelson.github.io/inform-website/book/WI_3_24.html||
slightly easier.

=
Section - People (in place of Section 11 - People in Standard Rules by Graham Nelson)

The specification of person is "Despite the name, not necessarily
a human being, but anything animate enough to envisage having a
conversation with, or bartering with."

A person can be female or male. A person is usually male.
A person can be neuter. A person is usually not neuter.

A person has a number called carrying capacity.
The carrying capacity of a person is usually 100.

A person can be transparent. A person is usually transparent.

The yourself is an undescribed person. The yourself is proper-named.

The yourself is privately-named.
Understand "dit tidligere jeg" or "mit tidligere jeg" or "tidligere jeg" or
	"tidligere" as yourself when the player is not yourself.

The description of yourself is usually "Lige så smuk som altid."

The yourself object translates into Inter as "selfobj".

@h Special characters.

=
Section - Saying Special Characters

[ Although we only support Danish as the language of play, we still provide
some Danish substitutions so adaptive text looks natural. ]

To say kantet parentes -- running on: say bracket.
To say luk kantet parentes -- running on: say close bracket.
To say apostrof -- running on: say apostrophe.
To say anførselstegn -- running on: say quotation mark.

@h Directions.

Translates parts of Section 4 - Directions in Standard Rules by Graham Nelson.

We keep the English direction names and abbreviations for convenience/muscle memory, except for "se" which now means "look".

=
Section - Directions

North translates into Danish as nord.
Northeast translates into Danish as nordøst.
Northwest translates into Danish as nordvest.
South translates into Danish as syd.
Southeast translates into Danish as sydøst.
Southwest translates into Danish as sydvest.
East translates into Danish as øst.
West translates into Danish as vest.
Up translates into Danish as op.
Down translates into Danish as ned.
Inside translates into Danish as ind.
Outside translates into Danish as ud.

Understand "n" as north.
Understand "nø" as northeast.
Understand "nv" as northwest.
Understand "sø" as southeast.
Understand the command "se" as something new. [ look ]
Understand "sv" as southwest.
Understand "ø" as east.
Understand "v" as west.
Understand "o" or "opad" as up.
Understand "nedad" as down.
Understand "indenfor" or "indeni" as inside.
Understand "udenfor" as outside.


@h Final question.

=
Section - Final question options (in place of Section 6 - Final question options in Standard Rules by Graham Nelson)

Table of Final Question Options
final question wording	only if victorious	topic		final response rule		final response activity
"OMSTART"				false				"restart"	immediately restart the VM rule	--
"RESTORE a saved game"	false				"restore"	immediately restore saved game rule	--
"see some suggestions for AMUSING things to do"	true	"amusing"	--	amusing a victorious player
"QUIT"					false				"quit"		immediately quit rule	--
"UNDO the last command"	false				"undo"		immediately undo rule	--

Include (-

language Danish

<grammatical-case-names> ::=
        nominative | accusative
        [nominativ | oblik]

-) in the Preform grammar.