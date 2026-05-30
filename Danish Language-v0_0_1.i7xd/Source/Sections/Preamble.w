Preamble.

To make Danish the language of play.

@h Preamble.

=
Volume - Preamble

Use authorial modesty.

@h Standard Rules variables.

We need to replace this section to override the default story headline. Most of it will just stay as-is. (Note the special name we have to use for replacing an unindexed section.)
=
Section - Unindexed Standard Rules variables (in place of "Section 7 - Unindexed Standard Rules variables - " in Standard Rules by Graham Nelson)

The story title, the story author, the story headline, the story genre
and the story description are text variables.
The release number and the story creation year are number variables.
The story serial code, the project IFID, the story licence, the story copyright,
the story origin URL, and the story rights history are text variables.
The Inform version number and the Inform build code are text variables.

The release number is usually 1.
The story title variable is defined by Inter as "Story".

@ The story headline could perhaps be "En interaktiv fiktion", but that's
not a common Danish term. However, we could of course proliferate it by using
it here...

This variable is the reason we're replacing this whole section. If we didn't 
replace it, and instead just wrote |The story headline is usually "Et teksteventyr".| in our extension somewhere, Inform would complain since a 
variable can't have two default (ie. "usually") values. However, we can't just 
write |The story headline is "Et teksteventyr".| without the "usually", because 
then authors wouldn't be able to override it in their own stories. 
=
The story headline is usually "Et teksteventyr".

@ We leave the story genre in English, because it's mostly used for
categorization.
=
The story genre is usually "Fiction".

@h Figures.

We override this section to translate a string that I'm not sure is used anywhere.
=
Section - Unindexed Standard Rules variables (for figures language element only) (in place of "Section SR2/6b - Unindexed Standard Rules variables - " in Standard Rules by Graham Nelson)

Figure of cover is the file of cover art ("Omslagskunsten.").

@h Grammatical definitions.

We replace this whole section in order to change a few defaults.
=
Section - Grammatical definitions (in place of Section 1 - Grammatical definitions in English Language by Graham Nelson)

The language of play is a natural language that varies.
The language of play is the Danish language.

A grammatical tense is a kind of value. The grammatical tenses are present tense,
past tense, perfect tense, past perfect tense, future tense and imperative tense.

Present tense translates into Danish as nutid.
Past tense translates into Danish as datid.

@h Narrative viewpoints.

We add a new narrative viewpoint to allow the parser to be "Des" with the
player, ie. addressing the player with the honorifics "De/Dem/Deres".
=
A narrative viewpoint is a kind of value. The narrative viewpoints are first
person singular, second person singular, third person singular, first person
plural, second person plural, third person plural, and second person honorific.

@ Uses the modern "vores" as the catch-all translation of "our(s)" instead of
"vor/vort/vore" depending on grammatical gender and plurality.
=
Use vores spelling translates as (- Constant VORES_SPELLING; -).

@ Uses the archaic plurality form of present tense.
=
Use archaic plural present tense translates as (- Constant ARCHAIC_PLURAL_PRESENT_TENSE; -).

@ Capitalized nouns.
=
Use capitalized nouns translates as the configuration flag CAPITALIZED_NOUNS in DanishLanguageKit.

@h Adaptive text viewpoint.

In English, the adaptive text viewpoint is first person plural, because all the
pronouns need to be different, and that's the only viewpoint where that's true.
But in Danish we might as well use second person singular, which is the same as
the default story viewpoint. 
=
A natural language has a narrative viewpoint called the adaptive text viewpoint.
The adaptive text viewpoint of the English language is first person plural.
The adaptive text viewpoint of the Danish language is second person singular.

To decide if (V - a narrative viewpoint) is third person:
	if V is third person singular or V is third person plural, yes;
	no.

@h Grammatical cases.

These have to be defined for the rest of the grammar to work, even if they're
identical to English, as is the case for Danish (at least more or less - Danish
uses the "oblique" case rather than a strict "accusative", but I believe that's
actually the case in English too).
=
Include (-
language Danish

<grammatical-case-names> ::=
        nominative | accusative
-) in the Preform grammar.

A grammatical case is a kind of value. The grammatical cases are nominative
and accusative.

@h Gender.

We reorder the grammatical genders to make masculine gender the default, and
comment out the feminine gender as Danish doesn't use it. The rest of the
grammar related to gender can be found in //Gender//.

TODO: Check if this reordering breaks these constants: https://ganelson.github.io/inform/inflections-module/3-lc.html
=
A grammatical gender is a kind of value. The grammatical genders are
masculine gender and neuter gender.

Masculine gender translates into Danish as fælleskøn.
Neuter gender translates into Danish as intetkøn.

An object has a grammatical gender.
The grammatical gender property is accessible to Inter as "grammatical_gender".

@ The |short_name_indef| Inter variable actually comes with Basic Inform, but
it's not used by Inform. However, |plural_indef| is new.
=
An object has a text called printed indefinite name.
The printed indefinite name property is defined by Inter as "short_name_indef".

An object has a text called printed plural indefinite name.
The printed plural indefinite name property is accessible to Inter as "plural_indef".

To decide which text is the plural indefinite of (O - an object):
	if the printed plural indefinite name of O is empty:
		decide on the printed plural name of O; [ All objects have one, right? ]
	otherwise:
		decide on the printed plural indefinite name of O.

@ Some Danish variable and routine names for adaptive text.
=
The substantivet is an object that varies.
The substantivet variable is defined by Inter as "noun".
The navneordet is an object that varies.
The navneordet variable is defined by Inter as "noun".
The det andet substantiv is an object that varies.
The det andet substantiv variable is defined by Inter as "second".

To say om (item - an object): (- RegardingSingleObject({item}); -).

To say om (N - a number): (- RegardingNumber({N}); -).

To say om list writer internals: (- RegardingLWI(); -).

To say om (D - a description of objects):
	say regarding D.

@ The rest below is identical to the English Language.
=
The story tense is a grammatical tense that varies.
The story tense variable is defined by Inter as "story_tense".
The story viewpoint is a narrative viewpoint that varies.
The story viewpoint variable is defined by Inter as "story_viewpoint".

To say regarding (item - an object): (- RegardingSingleObject({item}); -).

To say regarding (N - a number): (- RegardingNumber({N}); -).

To say regarding list writer internals: (- RegardingLWI(); -).

To decide if the prior naming context is plural:
	(- ((prior_named_list >= 2) || (prior_named_noun && prior_named_noun has pluralname)) -).

@ Just a quick note on this routine. The Inform 6 function called below,
|RegardingMarkedObjects|, sets a variable accessible to Inform 7 as "the prior
named list gender", which will contain the gender of the objects in the list if
they all have the same gender, and -1 otherwise. This isn't useful to either
Danish or English (where it's unused), but could be useful to other languages.
Even so, the function might need to be patched, because even though it uses the
GNA of each object for this, it only returns either male, female or neuter, and
throws away any information about plurality (although to be fair, that's
accessible as "the prior naming context", see above) and animation. One other
thing to note is that it sets "the prior named object" to the first object that
is listed, not the last, in case that matters in some language.

=
To say regarding (D - a description of objects): (-
		objectloop({-my:1} ofclass Object)
			if ({-matches-description:1:D}) 
				give {-my:1} workflag2;
			else
				give {-my:1} ~workflag2;
		RegardingMarkedObjects();
	-).

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

The yourself object is accessible to Inter as "selfobj".

@h Special characters.

=
Section - Saying Special Characters

@
Although we only support Danish as the language of play, we still provide
some Danish substitutions so adaptive text looks natural.
=
To say kantet parentes -- running on: say bracket.
To say luk kantet parentes -- running on: say close bracket.
To say apostrof -- running on: say apostrophe.

To say citat -- running on:
	if the angled quotes option is active:
		say "»";
	otherwise if the curly quotes option is active:
		say "„";
	otherwise:
		say quotation mark.

To say citat slut -- running on:
	if the angled quotes option is active:
		say "«";
	otherwise if the curly quotes option is active:
		say "“";
	otherwise:
		say quotation mark.

To say anførselstegn -- running on:
	say citat.
To say luk anførselstegn -- running on:
	say citat slut.
To say luk citat -- running on:
	say citat slut.

Use angled quotes translates as the configuration value QUOTE_STYLE = 1 in DanishLanguageKit.
Use curly quotes translates as the configuration value QUOTE_STYLE = 2 in DanishLanguageKit.

Include (-
	[ PrintQuoteOpen;
		switch (DanishLanguageKit`QUOTE_STYLE_CFGV) {
			1: print "»";
			2: print "„";
			default: print "~";
		}
	];
	
	[ PrintQuoteClose;
		switch (DanishLanguageKit`QUOTE_STYLE_CFGV) {
			1: print "«";
			2: print "“";
			default: print "~";
		}
	];
-).

@h Final question.

=
Section - Final question options (in place of Section 6 - Final question options in Standard Rules by Graham Nelson)

Table of Final Question Options
final question wording		only if victorious	topic		final response rule		final response activity
"GENSTART"					false				"genstart"	immediately restart the VM rule	--
"HENT et gemt spil"			false				"hent"	immediately restore saved game rule	--
"se nogle forslag til noget SJOVT at gøre"	true	"sjovt"	--	amusing a victorious player
"AFSLUT"					false				"afslut"		immediately quit rule	--
"FORTRYD the last command"	false				"fortryd"		immediately undo rule	--
