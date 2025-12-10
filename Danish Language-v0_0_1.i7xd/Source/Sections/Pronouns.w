Pronouns.

Handling pronouns.

@h Pronouns.

=
Section - Saying pronouns (for interactive fiction language element only) [TODO (in place of Section 2 - Saying pronouns in English Language by Graham Nelson)]
[ TODO: Support English pronouns as well, but redirect them to the Danish ones? ]

To say vi: [we]
	now the prior named object is the player;
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
		-- third person plural: say "de".

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
		say "mig";
	if the story viewpoint is second person singular:
		say "dig";
	if the story viewpoint is second person honorific:
		say "Dem";
	if the story viewpoint is third person singular:
		say "sig";
	if the story viewpoint is first person plural:
		say "os";
	if the story viewpoint is second person plural:
		say "jer";
	if the story viewpoint is third person plural:
		say "sig".

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
		say "Mig";
	if the story viewpoint is second person singular:
		say "Dig";
	if the story viewpoint is second person honorific:
		say "Dem";
	if the story viewpoint is third person singular:
		say "Sig";
	if the story viewpoint is first person plural:
		say "Os";
	if the story viewpoint is second person plural:
		say "Jer";
	if the story viewpoint is third person plural:
		say "Sig".

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
<da-trie-plural-reflexive-pronouns> ::=
	mig	os |
	dig 	jere  |
	hende 	dem  |
	ham 	dem  |
	den 	dem  |
	det 	dem  |
	dem 	dem 
[ TODO oneself ]
]
-) in the Preform grammar.

@ Danish pronouns.

These nonterminals are not parsed by Preform but are instead used to stock
small word sets.

Each row represents one case: so for Danish, there are two rows, nominative
(i.e. for subject pronouns) and then oblique (object). Within a row, the
sequence is neuter singular, neuter plural, masculine singular, masculine plural,
feminine singular, feminine plural.

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