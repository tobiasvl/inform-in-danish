Articles.

Handling articles.

@h Selective articles.

Just like English, Danish uses articles before nouns in the indefinite (a girl -- en pige).

However, in the definite, it is more complicated.

If a noun is modified by attributive adjectives, it should have an article (the
little girl -- den lille pige). If it stands alone, with no adjectives, it
should not have an article, but a suffix instead (the girl -- pigen).

=
To decide if (O - an object) is attributive:
	let N be the printed name of O;
	decide on whether or not the number of words in N is greater than 1.

Include (-
	[ IsAttributive obj foo;
		return (TEXT_TY_BlobAccess(obj.short_name, WORD_BLOB) > 1);
	];
-).

@
=
Include (-
	[ DefArt obj i s;
		i = indef_mode; indef_mode = false; s = self; self = obj;
		if ((~~obj ofclass Object) || obj has proper) {
			indef_mode = NULL; print (PSN__) obj; indef_mode = i; self = s;
			return;
		}
		if (IsAttributive(obj)) {
			PrefaceByArticle(obj, 1);
		} else {
			print (PSN__) obj;
		}
		indef_mode = i; self = s;
	];
-) replacing "DefArt".

@
This routine is complicated by having to capitalize the first letter of the
printed name if it shouldn't have an article. TODO: I'm not sure if this works
on the Z-machine, but we should be able to just use CPrintOrRun there.
=
Include (-
	[ CDefArt obj i s  len;
		i = indef_mode; indef_mode = false; s = self; self = obj;
		if ((obj ofclass Object) && (obj has proper || obj == player)) {
			indef_mode = NULL;
			caps_mode = true;
			print (PSN__) obj;
			indef_mode = i;
			caps_mode = false;
			self = s;
			return;
		}
		if ((~~obj ofclass Object) || obj has proper) {
			indef_mode = NULL; print (PSN__) obj; indef_mode = i; self = s;
			return;
		}
		if (IsAttributive(obj)) {
			PrefaceByArticle(obj, 0);
		} else {
			caps_mode = true;
			print (PSN__) obj;
			caps_mode = false;
		}
		indef_mode = i; self = s;
	];
-) replacing "CDefArt".

Include (-
	[ STANDARD_PLURAL_NAME_PRINTING_R obj;
		obj = parameter_value;
		if (~indef_mode || obj hasnt plural_indef) PrintOrRun(obj, plural, true);
		else PrintOrRun(obj, plural_indef, true);
	];
-) replacing "STANDARD_PLURAL_NAME_PRINTING_R" [ in BasicInformKit ].

@h Adaptive text.

The first part is commented out because I'm not sure how to handle capitalized
nouns. It should probably be handled in //DanishLanguageKit//'s
|LanguagePrintShortName|.
=
[ Section - Adaptive Text
	(in place of Section 5 - Adaptive Text in Basic Inform by Graham Nelson)

To say substantiv:
	if capitalized nouns option is active, say "[Noun]" in sentence case;
	otherwise, say "[noun]".
To say Substantiv: say "[Noun]" in sentence case.
To say substantivet:
	if capitalized nouns option is active, say "[the Noun]";
	otherwise, say "[the noun]".
To say Substantivet:
	if capitalized nouns option is active, say "[The Noun]" in sentence case;
	otherwise, say "[The noun]".
To say et substantiv:
	if capitalized nouns option is active, say "[a Noun]";
	otherwise, say "[a noun]".
To say Et substantiv:
	if capitalized nouns option is active, say "[A Noun]";
	otherwise, say "[A noun]". ]

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

To say det andre substantiv:
	say the second noun.
To say Det andre substantiv:
	say The second noun.
To say et andet substantiv:
	say a second noun.
To say Et andet substantiv:
	say A second noun.

To say en (something - object):
        (- print (a) {something}; -).
To say et (something - object):
        (- print (a) {something}; -).
To say En (something - object):
        (- CIndefArt({something}); -).
To say Et (something - object):
        (- CIndefArt({something}); -).
To say den (something - object):
        (- DefArt({something}); -).
To say Den (something - object):
        (- print (The) {something}; -).

@h Articles.

=
Include (-
	language Danish

	<article-declension> ::=
		m           <da-masculine-article-declension> |
		n           <da-neuter-article-declension>

	<da-masculine-article-declension> ::=
		en          en   en
					nogle nogle |
		den         den  den
					de   dem

	<da-neuter-article-declension> ::=
		en          et   et
					nogle nogle |
		den         det  det
					de   dem
-) in the Preform grammar.

@h Definite articles.

This is commented out because I'm not sure how to handle different genders here.

= (text as code)
Include (-
	language Danish

	<definite-article-table> ::=
			den de den de den de |
			den de den de den de

	<indefinite-article-table> ::=
			en   nogle  en  nogle  en  nogle |
			en   nogle  en  nogle  en  nogle
-) in the Preform grammar.