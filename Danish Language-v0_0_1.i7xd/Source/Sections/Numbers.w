Numbers.

Handling things related to numbers.

@h LanguageNumber.

This routine prints out the given number |n| in Danish words.

It should preferably be in //DanishLanguageKit//, along with all the other |Language|-prefixed overrides, but for historical reasons the
routine it replaces is in |BasicInformKit|.
=
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
-) replacing "LanguageNumber" [ (in BasicInformKit) ].

@h Cardinals.

Currently, these don't work and are commented out, because defining "to" as a
cardinal number is not possible as long as the "Language of Syntax" is English,
where "to" is the infinitive marker... This has been reported as bug //I7-2643 -> https://inform7.atlassian.net/browse/I7-2643//.
= (text as code)
Include (-
	language Danish

	<cardinal-number-in-words> ::=
			nul |
			en |
			to | [ TODO bug I7-2643 ]
			tre |
			fire |
			fem |
			seks |
			syv |
			otte |
			ni |
			ti |
			elleve |
			tolv
-) in the Preform grammar.

@ Ordinals.
=
Include (-
	language Danish
	<ordinal-number-in-words> ::=
			nulte |
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
-) in the Preform grammar.

@h Say Number.
The global variable |say__n| is set to the numerical value of any quantity
printed. In English it's used for the text substitution "[s]", so that
"You have been awake for [turn count] turn[s]." will expand correctly.

In Danish we would probably want to conjugate the noun correctly instead?
Also this variable isn't updated when the prior naming context is plural,
only when a number is literally printed. See discussion at
https://intfiction.org/t/text-substitution-regarding-number-does-not-affect-s/68942

=
The prior number printed is a number that varies.
The prior number printed variable is defined by Inter as "say__n".

To say -er:
	if the prior number printed is not 1, say "er".

To say -r:
	if the prior number printed is not 1, say "r".

To say e:
	if the prior number printed is not 1 or the prior naming context is plural:
		say "e";
	otherwise if the prior named gender is neuter gender:
		say "t".
To say -e:
	say e.
To say t:
	say e.
To say -t:
	say e.

To say t-de:
	if the prior number printed is not 1 or the prior naming context is plural:
		say "de";
	otherwise:
		say "t".
