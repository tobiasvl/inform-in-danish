Time.

Handling things related to time.

@h Time Values.

These short and sweet definitions are used for adaptive text.
=
Section - Time Values (in place of Section 1 - Time Values in Standard Rules by Graham Nelson)

To say (something - time) in words:
	(- print (PrintTimeOfDayDanish) {something}; -).
To say her:
	say "[if story tense is present tense]her[otherwise]der[end if]".
To say nu:
	say "[if story tense is present tense]nu[otherwise]da[end if]".

@h Time.

=
Section - Time Template

@
Support for parsing and printing times of day.
=
Include (-
	[ PrintTimeOfDay t h;
		if (t<0) { print "<no time>"; return; }
		if (t >= TWENTY_FOUR_HOURS) { t = t - TWENTY_FOUR_HOURS; };
		h = t/ONE_HOUR; if (h==0) h=24;
		t = t%ONE_HOUR;
		LanguageTimeOfDay(h, t);
	];
-) replacing "PrintTimeOfDay" [ (in WorldModelKit) ].

Include (-
	[ PrintDuration t h m;
		if (t<0) { print "minus "; t = -t; }
		h = t/ONE_HOUR; m = t%ONE_HOUR;
		if (h > 0) print h, " time"; if (h > 1) print "r";
		if (h > 0) print " ";
		if (m == 1) print "1 minut";
		else if ((h == 0) || (m > 0)) print m, " minutter";
	];
-) replacing "PrintDuration" [ (in WorldModelKit) ].

@h Print time of day in Danish.

TODO: This hasn't been written yet and is currently just the same as
|PrintTimeOfDayEnglish|.
=
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

@h Understanding.

This I6 grammar token converts words in the player's command to a valid
I7 time, and is heavily based on the one presented as a solution to an
exercise in the DM4.

TODO: These also haven't been written yet and are just the same as in English.
=
Include (-
	[ TIME_TOKEN first_word second_word at length flag
		illegal_char offhour hr mn i original_wn ch;
		original_wn = wn;
		i = TIME_TOKEN_INNER();
		if (i ~= GPR_FAIL) return i;
		wn = original_wn;
		first_word = NextWordStopped();
		switch (first_word) {
			'midnight': parsed_number = 0; return GPR_NUMBER;
			'midday', 'noon': parsed_number = TWELVE_HOURS;
			return GPR_NUMBER;
		}
		! Next try the format 12:02
		at = WordAddress(wn-1); length = WordLength(wn-1);
		for (i=0: i<length: i++) {
			#iftrue (CHARSIZE == 1);
			ch = at->i;
			#Ifnot;
			ch = at-->i;
			#Endif; ! CHARSIZE
			switch (ch) {
				':': if (flag == false && i>0 && i<length-1) flag = true;
				else illegal_char = true;
				'0', '1', '2', '3', '4', '5', '6', '7', '8', '9': ;
				default: illegal_char = true;
			}
		}
		if (length < 3 || length > 5 || illegal_char) flag = false;
		if (flag) {
			#iftrue (CHARSIZE == 1);
			for (i=0: at->i~=':': i++, hr=hr*10) hr = hr + at->i - '0';
			#Ifnot;
			for (i=0: at-->i~=':': i++, hr=hr*10) hr = hr + at-->i - '0';
			#Endif; ! CHARSIZE
			hr = hr/10;
			#iftrue (CHARSIZE == 1);
			for (i++: i<length: i++, mn=mn*10) mn = mn + at->i - '0';
			#Ifnot;
			for (i++: i<length: i++, mn=mn*10) mn = mn + at-->i - '0';
			#Endif; ! CHARSIZE
			mn = mn/10;
			second_word = NextWordStopped();
			parsed_number = HoursMinsWordToTime(hr, mn, second_word);
			if (parsed_number == -1) return GPR_FAIL;
			if (second_word ~= 'pm' or 'am') wn--;
			return GPR_NUMBER;
		}
		! Lastly the wordy format
		offhour = -1;
		if (first_word == 'half') offhour = HALF_HOUR;
		if (first_word == 'quarter') offhour = QUARTER_HOUR;
		if (offhour < 0) offhour = TryNumber(wn-1);
		if (offhour < 0 || offhour >= ONE_HOUR) return GPR_FAIL;
		second_word = NextWordStopped();
		switch (second_word) {
			! "six o'clock", "six"
			'o^clock', 'am', 'pm', -1:
				hr = offhour; if (hr > 12) return GPR_FAIL;
			! "quarter to six", "twenty past midnight"
			'to', 'past':
				mn = offhour; hr = TryNumber(wn);
				if (hr <= 0) {
					switch (NextWordStopped()) {
						'noon', 'midday': hr = 12;
						'midnight': hr = 0;
						default: return GPR_FAIL;
					}
				}
				if (hr >= 13) return GPR_FAIL;
				if (second_word == 'to') {
					mn = ONE_HOUR-mn; hr--; if (hr<0) hr=23;
				}
				wn++; second_word = NextWordStopped();
			! "six thirty"
			default:
				hr = offhour; mn = TryNumber(--wn);
				if (mn < 0 || mn >= ONE_HOUR) return GPR_FAIL;
				wn++; second_word = NextWordStopped();
		}
		parsed_number = HoursMinsWordToTime(hr, mn, second_word);
		if (parsed_number < 0) return GPR_FAIL;
		if (second_word ~= 'pm' or 'am' or 'o^clock') wn--;
		return GPR_NUMBER;
	];
-) replacing "TIME_TOKEN".

Include (-
	[ HoursMinsWordToTime hour minute word x;
		if (hour >= 24) return -1;
		if (minute >= ONE_HOUR) return -1;
		x = hour*ONE_HOUR + minute; if (hour >= 13) return x;
		x = x % TWELVE_HOURS; if (word == 'pm') x = x + TWELVE_HOURS;
		if (word ~= 'am' or 'pm' && hour == 12) x = x + TWELVE_HOURS;
		return x;
	];
-) replacing "HoursMinsWordToTime" [ (in WorldModelKit) ].

@h Relative Time Token.
"Time" is an interesting kind of value since it can hold two conceptually
different ways of thinking about time: absolute times, such as "12:03 PM",
and also relative times, like "ten minutes". For parsing purposes, these
are completely different from each other, and the time token above handles
only absolute times; we need the following for relative ones.

=
Include (-
	[ RELATIVE_TIME_TOKEN first_word second_word offhour mult mn original_wn;
		original_wn = wn;
		wn = original_wn;

		first_word = NextWordStopped(); wn--;
		if (first_word == 'an' or 'a//') mn=1; else mn=TryNumber(wn);

		if (mn == -1000) {
			first_word = NextWordStopped();
			if (first_word == 'half') offhour = HALF_HOUR;
			if (first_word == 'quarter') offhour = QUARTER_HOUR;
			if (offhour > 0) {
				second_word = NextWordStopped();
				if (second_word == 'of') second_word = NextWordStopped();
				if (second_word == 'an') second_word = NextWordStopped();
				if (second_word == 'hour') {
					parsed_number = offhour;
					return GPR_NUMBER;
				}
			}
			return GPR_FAIL;
		}
		wn++;

		first_word = NextWordStopped();
		switch (first_word) {
			'minutes', 'minute': mult = 1;
			'hours', 'hour': mult = 60;
			default: return GPR_FAIL;
		}
		parsed_number = mn*mult;
		if (mult == 60) {
			mn=TryNumber(wn);
			if (mn ~= -1000) {
				wn++;
				first_word = NextWordStopped();
				if (first_word == 'minutes' or 'minute')
					parsed_number = parsed_number + mn;
				else wn = wn - 2;
			}
		}
		return GPR_NUMBER;
	];
-) replacing "RELATIVE_TIME_TOKEN".

@h Scene Questions.

=
Include (-
	[ SceneUtility sc task;
		if (sc <= 0) return 0;
		if (task == 1 or 2) {
			if (scene_endings-->(sc-1) == 0) {
				IssueRTP("SceneHasNotStarted",
					"The scene has not started.", WorldModelKitRTPs);
				print "*** The scene in question is ", (PrintSceneName) sc, ".^";
				rtrue;
			}
		} else {
			if (scene_endings-->(sc-1) <= 1) {
				IssueRTP("SceneHasNotEnded",
					"The scene has not ended.", WorldModelKitRTPs);
				print "*** The scene in question is ", (PrintSceneName) sc, ".^";
				rtrue;
			}
		}
		switch (task) {
			1: return (TWENTY_FOUR_HOURS + the_time - scene_started-->(sc-1))%(TWENTY_FOUR_HOURS);
			2: return scene_started-->(sc-1);
			3: return (TWENTY_FOUR_HOURS + the_time - scene_ended-->(sc-1))%(TWENTY_FOUR_HOURS);
			4: return scene_ended-->(sc-1);
		}
	];
-) replacing "SceneUtility".