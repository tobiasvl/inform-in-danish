Misc.

Miscellaneous stuff.

@h Preamble.
=
Volume - Testing (not for release)

@h Pluralization.
Routine to say the plural inflection of a noun, since Inform makes that a bit hard. From https://intfiction.org/t/to-say-a-plural/48808/5.

=
To say plural of (name of kind of value K):
	carry out the printing the plural name activity with a random K.

@h Other stuff.

=
Volume - Misc

@

This enables the player to refer to objects by either their definite name (that's already the case by default) or their indefinite name. However, it
only works if the player writes the entire property. So both "pigen" and
"pige" will match the object pigen, but "lille" and "pige" will match
"den lille pige" (because they both appear in the definite name), while
"pigen" will not. We will need to fix this in ||DanishLanguageKit|| with
some Inter code.
=
Understand the printed indefinite name property as describing a thing.
Understand the printed indefinite name property as describing a room.
Understand the printed plural indefinite name property as describing a thing.
Understand the printed plural indefinite name property as describing a room.

@
Force a useful "missing verb" error message. From https://intfiction.org/t/6m62-no-verb-oddness/78143/12.

=
To decide whether verbless parsing is occurring:
	(- (verb_word == 'no.verb') -).

Rule for printing a parser error when the latest parser error is the didn't understand error and verbless parsing is occurring:
	say text of parser error internal rule response (N);
	say line break.