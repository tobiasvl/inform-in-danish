Pronouns.

Handling pronouns.

@h Saying pronouns.

This section could replace Section 2 - Saying pronouns in English Language by
Graham Nelson, as nothing uses those phrases anymore. However, I'm not sure
exactly if one language bundle should replace stuff in another language bundle.
It's probably fine but it feels weird.
=
Section - Saying pronouns (for interactive fiction language element only) [ (in place of Section 2 - Saying pronouns in English Language by Graham Nelson) ]

To say du: [we]
	if the story viewpoint is:
		-- first person singular: say "jeg";
		-- second person singular: say "du";
		-- second person honorific: say "De";
		-- third person singular:
			if the player is male:
				say "han";
			otherwise:
				say "hun";
		-- first person plural: say "vi";
		-- second person plural: say "I";
		-- third person plural: say "de";
	now the prior named object is the player.

To say dig: [us]
	if the story viewpoint is:
		-- first person singular: say "mig";
		-- second person singular: say "dig";
		-- second person honorific: say "Dem";
		-- third person singular:
			if the player is male:
				say "ham";
			otherwise:
				say "hende";
		-- first person plural: say "os";
		-- second person plural: say "jer";
		-- third person plural: say "dem";
	now the prior named object is the player.

To say din: [ our/ours with male object ]
	if the story viewpoint is first person singular:
		if the prior naming context is plural:
			say "mine";
		otherwise if the prior named gender is masculine gender:
			say "min";
		otherwise if the prior named gender is neuter gender:
			say "mit";
	if the story viewpoint is second person singular:
		if the prior naming context is plural:
			say "dine";
		otherwise if the prior named gender is masculine gender:
			say "din";
		otherwise if the prior named gender is neuter gender:
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
		otherwise if the prior naming context is plural:
			say "vore";
		otherwise if the prior named gender is masculine gender:
			say "vor";
		otherwise if the prior named gender is neuter gender:
			say "vort";
	if the story viewpoint is second person plural:
		say "jeres";
	if the story viewpoint is third person plural:
		say "deres";
	now the prior named object is the player.

To say dit: say din.
To say dine: say din.

To say din/dit/dine (O - an object): [ our/ours ]
	say "[regarding O][din] [O]".	

To say sin: [ reflexive possessive ]
	if the story viewpoint is first person singular:
		if the prior naming context is plural:
			say "mine";
		otherwise if the prior named gender is masculine gender:
			say "min";
		otherwise if the prior named gender is neuter gender:
			say "mit";
	if the story viewpoint is second person singular:
		if the prior naming context is plural:
			say "dine";
		otherwise if the prior named gender is masculine gender:
			say "din";
		otherwise if the prior named gender is neuter gender:
			say "dit";
	if the story viewpoint is second person honorific:
		say "Deres";
	if the story viewpoint is third person:
		if the prior naming context is plural:
			say "sine";
		otherwise if the prior named gender is masculine gender:
			say "sin";
		otherwise if the prior named gender is neuter gender:
			say "sit";
	if the story viewpoint is first person plural:
		if vores spelling option is active:
			say "vores";
		otherwise if the prior naming context is plural:
			say "vore";
		otherwise if the prior named gender is masculine gender:
			say "vor";
		otherwise if the prior named gender is neuter gender:
			say "vort";
	if the story viewpoint is second person plural:
		say "jeres";
	now the prior named object is the player.

To say sit: say sin.
To say sine: say sin.

To say sin/sit/sine (O - an object): [ our/ours ]
	say "[regarding O][sin] [O]".

To say dig selv: [ ourselves ]
	if the story viewpoint is first person singular:
		say "mig";
	if the story viewpoint is second person singular:
		say "dig";
	if the story viewpoint is second person honorific:
		say "Dem";
	if the story viewpoint is third person:
		say "sig";
	if the story viewpoint is first person plural:
		say "os";
	if the story viewpoint is second person plural:
		say "jer";
	now the prior named object is the player. [ TODO: This shouldn't be done if the actor is not the player. ]

To say Du:
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
		say "De";
	now the prior named object is the player.

To say Dig:
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
		say "Dem";
	now the prior named object is the player.

To say Din: [ our/ours with male object ]
	if the story viewpoint is first person singular:
		if the prior naming context is plural:
			say "Mine";
		otherwise if the prior named gender is masculine gender:
			say "Min";
		otherwise if the prior named gender is neuter gender:
			say "Mit";
	if the story viewpoint is second person singular:
		if the prior naming context is plural:
			say "Dine";
		otherwise if the prior named gender is masculine gender:
			say "Din";
		otherwise if the prior named gender is neuter gender:
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
		otherwise if the prior naming context is plural:
			say "Vore";
		otherwise if the prior named gender is masculine gender:
			say "Vor";
		otherwise if the prior named gender is neuter gender:
			say "Vort";
	if the story viewpoint is second person plural:
		say "Jeres";
	if the story viewpoint is third person plural:
		say "Deres";
	now the prior named object is the player.

To say Dit/Dine: say Din.

To say Din/Dit/Dine (O - an object): [ our/ours ]
	say "[regarding O][Din] [O]";
	now the prior named object is O.

To say Sin: [ reflexive possessive ]
	if the story viewpoint is first person singular:
		if the prior naming context is plural:
			say "Mine";
		otherwise if the prior named gender is masculine gender:
			say "Min";
		otherwise if the prior named gender is neuter gender:
			say "Mit";
	if the story viewpoint is second person singular:
		if the prior naming context is plural:
			say "Dine";
		otherwise if the prior named gender is masculine gender:
			say "Din";
		otherwise if the prior named gender is neuter gender:
			say "Dit";
	if the story viewpoint is second person honorific:
		say "Deres";
	if the story viewpoint is third person:
		if the prior naming context is plural:
			say "Sine";
		otherwise if the prior named gender is masculine gender:
			say "Sin";
		otherwise if the prior named gender is neuter gender:
			say "Sit";
	if the story viewpoint is first person plural:
		if vores spelling option is active:
			say "Vores";
		otherwise if the prior naming context is plural:
			say "Vore";
		otherwise if the prior named gender is masculine gender:
			say "Vor";
		otherwise if the prior named gender is neuter gender:
			say "Vort";
	if the story viewpoint is second person plural:
		say "Jeres";
	now the prior named object is the player.

To say Sit: say Sin.
To say Sine: say Sin.

To say Sin/Sit/Sine (O - an object): [ our/ours ]
	say "[regarding O][Sin] [O]".

To say Dig selv:
	if the story viewpoint is first person singular:
		say "Mig";
	if the story viewpoint is second person singular:
		say "Dig";
	if the story viewpoint is second person honorific:
		say "Dem";
	if the story viewpoint is third person:
		say "Sig";
	if the story viewpoint is first person plural:
		say "Os";
	if the story viewpoint is second person plural:
		say "Jer";
	now the prior named object is the player. [ TODO shouldn't be done if the actor is not the player. ]

Section - Further pronouns (for interactive fiction language element only) [TODO (in place of Section 3 - Further pronouns in English Language by Graham Nelson)]

To say de:
	let the item be the prior named object;
	if the prior naming context is plural:
		say "de";
	otherwise if the item is the player:
		say "[du]";
	otherwise if the item is a male person and item is not neuter:
		say "han";
	otherwise if the item is a female person and item is not neuter:
		say "hun";
	otherwise if the prior named gender is masculine gender:
		say "den";
	otherwise if the prior named gender is neuter gender:
		say "det";

To say De:
	let the item be the prior named object;
	if the prior naming context is plural:
		say "De";
	otherwise if the item is the player:
		say "[Du]";
	otherwise if the item is a male person and item is not neuter:
		say "Han";
	otherwise if the item is a female person and item is not neuter:
		say "Hun";
	otherwise if the prior named gender is masculine gender:
		say "Den";
	otherwise if the prior named gender is neuter gender:
		say "Det";

To say deres:
	let the item be the prior named object;
	if the prior naming context is plural:
		say "deres";
	otherwise if the item is the player:
		say "[din item]";
	otherwise if the item is a male person and item is not neuter:
		say "hans";
	otherwise if the item is a female person and item is not neuter:
		say "hendes";
	otherwise if the prior named gender is masculine gender:
		say "dens";
	otherwise if the prior named gender is neuter gender:
		say "dets";

To say Deres:
	let the item be the prior named object;
	if the prior naming context is plural:
		say "Deres";
	otherwise if the item is the player:
		say "[Din item]";
	otherwise if the item is a male person and item is not neuter:
		say "Hans";
	otherwise if the item is a female person and item is not neuter:
		say "Hendes";
	otherwise if the prior named gender is masculine gender:
		say "Dens";
	otherwise if the prior named gender is neuter gender:
		say "Dets";

To say dem:
	let the item be the prior named object;
	if the prior naming context is plural:
		say "dem";
	otherwise if the item is the player:
		say "[dig]";
	otherwise if the item is a male person and item is not neuter:
		say "ham";
	otherwise if the item is a female person and item is not neuter:
		say "hende";
	otherwise if the prior named gender is masculine gender:
		say "den";
	otherwise if the prior named gender is neuter gender:
		say "det";

To say Dem:
	let the item be the prior named object;
	if the prior naming context is plural:
		say "Dem";
	otherwise if the item is the player:
		say "[Dig]";
	otherwise if the item is a male person and item is not neuter:
		say "Ham";
	otherwise if the item is a female person and item is not neuter:
		say "Hende";
	otherwise if the prior named gender is masculine gender:
		say "Den";
	otherwise if the prior named gender is neuter gender:
		say "Det";

To say themselves:
	let the item be the prior named object;
	if the prior naming context is plural:
		say "dem selv";
	otherwise if the item is the player:
		say "[dig selv]";
	otherwise if the item is a male person and item is not neuter:
		say "ham selv";
	otherwise if the item is a female person and item is not neuter:
		say "hende selv";
	otherwise if the prior named gender is masculine gender:
		say "den selv";
	otherwise if the prior named gender is neuter gender:
		say "det selv";

To say Themselves:
	let the item be the prior named object;
	if the prior naming context is plural:
		say "Dem selv";
	otherwise if the item is the player:
		say "[Dig selv]";
	otherwise if the item is a male person and item is not neuter:
		say "Ham selv";
	otherwise if the item is a female person and item is not neuter:
		say "Hende selv";
	otherwise if the prior named gender is masculine gender:
		say "Den selv";
	otherwise if the prior named gender is neuter gender:
		say "Det selv";

@h Dummy pronouns. 

We also have two dummy pronouns in Danish, which map very cleanly to the English ones.

=
To say det:
	say "[regarding nothing]det".

To say der:
	say "[regarding nothing]der".

To say Det:
	say "[regarding nothing]Det".

To say Der:
	say "[regarding nothing]Der".

@h Possessives.

Danish possessives (genitive) work like his:

=
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
		say "[din]";
	otherwise if the printed name of the item is s-terminated:
		say "[the item][apostrophe]";
	otherwise:
		say "[the item]s";
	[ otherwise if the printed name of the item is an acronym:
		say "[the item][apostrophe]s";] [ TODO ]

To say Possessive: [ Possessive / Genitive]
	let the item be the prior named object;
	if the item is the player:
		say "[Din]";
	otherwise if the printed name of the item is s-terminated:
		say "[The item][apostrophe]";
	otherwise:
		say "[The item]s".
	[ otherwise if the printed name of the item is an acronym:
		say "[The item][apostrophe]s";] [ TODO ]

To say s:
	say possessive.

To say genitiv:
	say possessive.
To say Genitiv:
	say possessive.

Include (-
	language Danish

	<da-trie-plural-pronouns> ::=
			...       <da-trie-plural-regular-pronouns> [|
			... selv  <da-trie-plural-reflexive-pronouns>]

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
	[ TODO oneself ]
	<da-trie-plural-reflexive-pronouns> ::=
		mig	os |
		dig 	jere  |
		hende 	dem  |
		ham 	dem  |
		den 	dem  |
		det 	dem  |
		dem 	dem 
	]
-) in the Preform grammar.

@ Danish pronouns.

These nonterminals are not parsed by Preform but are instead used to stock
small word sets.

Each row represents one case: so for Danish, there are two rows, nominative
(i.e. for subject pronouns) and then oblique (object). Within a row, the
sequence is neuter singular, neuter plural, masculine singular, masculine
plural, feminine singular, feminine plural.

=
Include (-
	language Danish

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
-) in the Preform grammar.

@h Descriptors.
In grammatical terms, a descriptor appears at the front of an English noun
phrase and clarifies the quantity or specific identity of what is referred
to: for instance, {\it my} mirror, {\it the} dwarf, {\it that} woman.
(Numbers, as in {\it four} duets, are also descriptors in linguistics:
but the I6 parser doesn't handle them that way.)

In Danish, the words "det" and "den" can function either as pronouns or as
definite articles (descriptors). This function makes some naive assumptions
about whether or not the currently parsed word is being used as a pronoun.
=
Include (-
	[ IsDescriptorPronoun o o_prev x;
		o_prev = o;
		o = NextWordStopped();

		! If the word is last in a command, and matches a pronoun, it's
		! probably one
		if (o == -1 or THEN1__WD) {
			for(x=1: x<=LanguagePronouns-->0: x = x + 3) {
				if(o_prev == LanguagePronouns-->x) {
					wn--;
					wn--;
					rtrue;
				}
			}
		}
		wn--;
		o = o_prev;

		rfalse;
	];
-).

@h Parsing Descriptors.

//Parse Token Letter C -> https://ganelson.github.io/inform/CommandParserKit/prsr.html#SP29//

@h Parsing Descriptors.
The |Descriptors()| routine parses the descriptors at the head of a noun
phrase, leaving the current word marker |wn| at the first word of the
noun phrase's body. It is allowed to set up for a plural only if |allow_p|
is set; it returns a parser error number, or 0 if no error occurred.
=
Include (-
	[ Descriptors  o x flag cto type n o_prev;
		ResetDescriptors();
		if (wn > num_words) return 0;

		for (flag=true : flag :) {
			o = NextWordStopped(); flag = false;

			for (x=1 : x<=LanguageDescriptors-->0 : x=x+4)
				if (o == LanguageDescriptors-->x) {
					flag = true;
					type = LanguageDescriptors-->(x+2);
					
					if (type == DEFART_PK) {
						if (IsDescriptorPronoun(o)) return 0;
					} else indef_mode = true;

					indef_possambig = true;
					indef_cases = indef_cases & (LanguageDescriptors-->(x+1));

					if (type == POSSESS_PK) {
						cto = LanguageDescriptors-->(x+3);
						switch (cto) {
						0: indef_type = indef_type | MY_BIT;
						1: indef_type = indef_type | THAT_BIT;
						default:
							indef_owner = PronounValue(cto);
							if (indef_owner == NULL) indef_owner = nothing;
						}
					}

					if (type == LIGHTED_PK)  indef_type = indef_type | LIT_BIT;
					if (type == UNLIGHTED_PK) indef_type = indef_type | UNLIT_BIT;
				}

			if (o == OTHER1__WD or OTHER2__WD or OTHER3__WD) {
				indef_mode = 1; flag = 1;
				indef_type = indef_type | OTHER_BIT;
			}
			if (o == ALL1__WD or ALL2__WD or ALL3__WD or ALL4__WD or ALL5__WD) {
				indef_mode = 1; flag = 1; indef_wanted = INDEF_ALL_WANTED;
				if (take_all_rule == 1) take_all_rule = 2;
				indef_type = indef_type | PLURAL_BIT;
			}
			if (allow_plurals) {
				if (NextWordStopped() ~= -1 or THEN1__WD) { wn--; n = TryNumber(wn-1); } else { n=0; wn--; }
				if (n == 1) { indef_mode = 1; flag = 1; }
				if (n > 1) {
					indef_guess_p = 1;
					indef_mode = 1; flag = 1; indef_wanted = n;
					indef_nspec_at = wn-1;
					indef_type = indef_type | PLURAL_BIT;
				}
			}
			if (flag == 1 && NextWordStopped() ~= OF1__WD or OF2__WD or OF3__WD or OF4__WD)
				wn--;  ! Skip 'of' after these
		}
		wn--;
		return 0;
	];
-) replacing "Descriptors".

@h Announcing pronoun meanings.

We redefine this just to replace the quotation marks with Danish ones.
=
Include (-
	[ ANNOUNCE_PRONOUN_MEANINGS_R x y c d;
		if (actor ~= player) rfalse;
		ANNOUNCE_PRONOUN_MEANINGS_RM('A');

		c = (LanguagePronouns-->0)/3;
		if (player ~= selfobj) c++;

		if (c==0) { ANNOUNCE_PRONOUN_MEANINGS_RM('D'); rtrue; }

		for (x = 1, d = 0 : x <= LanguagePronouns-->0: x = x+3) {
			PrintQuoteOpen();
			print (address) LanguagePronouns-->x;
			PrintQuoteClose();
			print " ";
			y = LanguagePronouns-->(x+2);
			if (y == NULL) ANNOUNCE_PRONOUN_MEANINGS_RM('C');
			else { ANNOUNCE_PRONOUN_MEANINGS_RM('B'); print (the) y; }
			d++;
			if (d < c-1) print ", ";
			if (d == c-1) {
				if (BasicInformKit`SERIAL_COMMA_CFGF) print ",";
				LW_Response('C');
			}
		}
		if (player ~= selfobj) {
			PrintQuoteOpen();
			print (address) ME1__WD;
			PrintQuoteClose();
			print " ";
			ANNOUNCE_PRONOUN_MEANINGS_RM('B');
			c = player; player = selfobj;
			print (the) c; player = c;
		}
		".";
	];
-) replacing "ANNOUNCE_PRONOUN_MEANINGS_R" [ in BasicInformKit ].
