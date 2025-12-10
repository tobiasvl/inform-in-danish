
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

Part - Time

Section - Time Values (in place of Section 1 - Time Values in Standard Rules by Graham Nelson)

To say (something - time) in words:
	(- print (PrintTimeOfDayDanish) {something}; -).
To say her:
	say "[if story tense is present tense]her[otherwise]der".
To say nu:
	say "[if story tense is present tense]nu[otherwise]da".

[ TODO remove later ]
To say here: say her.
To say now: say nu.

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

Include (-

language Danish

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


-) in the Preform grammar.