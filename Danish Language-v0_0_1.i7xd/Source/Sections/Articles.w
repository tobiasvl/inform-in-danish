Articles.

Handling articles.

@h Selective articles.

Just like English, Danish uses articles before nouns in the indefinite (a girl -- en pige).

However, in the definite, it is more complicated.

If a noun is modified by adjectives, it should have an article (the little
girl -- den lille pige). If it stands alone, with no adjectives, it should not
have an article, but a suffix instead (the girl -- pigen).

=
Include (-
[ PrefaceByArticle obj acode pluralise capitalise i artform findout artval;

	if (obj provides short_name) {
        ! if !indef_mode OR short_name is multiple words: print_article = true. otherwise, false.
    }


    if (obj provides articles) {
        artval=(obj.&articles)-->(acode+short_name_case*LanguageCases);
        if (capitalise)
            print (Cap) artval;
        else
            print (string) artval;
        if (pluralise) return;
        print (PSN__) obj; return;
    }

    i = GetGNAOfObject(obj);
    if (pluralise) {
        if (i < 3 || (i >= 6 && i < 9)) i = i + 3;
    }
    i = LanguageGNAsToArticles-->i;

    artform = LanguageArticles + 3*WORDSIZE*(short_name_case + i*LanguageCases);

    #Ifdef TARGET_ZCODE;
    if (standard_interpreter ~= 0 && findout) {
        StorageForShortName-->0 = SHORT_NAME_BUFFER_LEN;
        @output_stream 3 StorageForShortName;
        if (pluralise) print (number) pluralise; else print (PSN__) obj;
        @output_stream -3;
        acode = acode + 3*LanguageContraction(StorageForShortName + 2);
    }
    #Ifnot; ! TARGET_GLULX
    if (findout) {
        if (pluralise)
            Glulx_PrintAnyToArrayUni(StorageForShortName, SHORT_NAME_BUFFER_LEN, EnglishNumber, pluralise);
        else
            Glulx_PrintAnyToArrayUni(StorageForShortName, SHORT_NAME_BUFFER_LEN, PSN__, obj);
        acode = acode + 3*LanguageContraction(StorageForShortName);
    }
    #Endif; ! TARGET_

    Cap (artform-->acode, ~~capitalise); ! print article
    if (pluralise) return;
    print (PSN__) obj;
];
-) replacing "PrefaceByArticle" [ in BasicInformKit ].

Include (-
[ STANDARD_PLURAL_NAME_PRINTING_R obj;
	obj = parameter_value;
	PrintOrRun(obj, plural, true);
];
-) replacing "STANDARD_PLURAL_NAME_PRINTING_R".

Section - Adaptive Text
	[(in place of Section 5 - Adaptive Text in Basic Inform by Graham Nelson)]

[To say substantiv:
	if capitalized nouns option is active, say "[Noun]";
	otherwise, say "[noun]".
To say Substantiv: say "[Noun]".
To say substantivet:
	if capitalized nouns option is active, say "[the Noun]";
	otherwise, say "[the noun]".
To say Substantivet:
	if capitalized nouns option is active, say "[The Noun]";
	otherwise, say "[The noun]".
To say et substantiv:
	if capitalized nouns option is active, say "[a Noun]";
	otherwise, say "[a noun]".
To say Et substantiv:
	if capitalized nouns option is active, say "[A Noun]";
	otherwise, say "[A noun]".]

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

To say en (something - object):
        (- print (a) {something}; -).
To say et (something - object):
        (- print (a) {something}; -).
To say En (something - object):
        (- CIndefArt({something}); -).
To say Et (something - object):
        (- CIndefArt({something}); -).
To say den (something - object):
	[ TODO: sjekk om navnet til something har flere ord, og hvis ikke bruk suffiks? ]
        (- print (the) {something}; -).
To say Den (something - object):
	[ TODO: sjekk om navnet til something har flere ord, og hvis ikke bruk suffiks? ]
        (- print (The) {something}; -).

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

[ TODO: ]  [
<definite-article-table> ::=
        den de den de den de |
        den de den de den de

<indefinite-article-table> ::=
        en   nogle  en  nogle  en  nogle |
        en   nogle  en  nogle  en  nogle
]
-) in the Preform grammar.