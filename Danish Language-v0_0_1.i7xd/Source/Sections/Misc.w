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

When play begins:
	say the list of verbs in brace notation;
	say "[adapt the verb være in present tense]".


@
Force a useful "missing verb" error message. From https://intfiction.org/t/6m62-no-verb-oddness/78143/12.

=
To decide whether verbless parsing is occurring:
	(- (verb_word == 'no.verb') -).

Rule for printing a parser error when the latest parser error is the didn't understand error and verbless parsing is occurring:
	say text of parser error internal rule response (N);
	say line break.