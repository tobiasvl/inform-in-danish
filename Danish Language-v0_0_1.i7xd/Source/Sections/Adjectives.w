Adjectives.

Handling adjectives.

@h Adjectives.

In theory, defining adjectives in Inform should be as simple as saying

>> In Danish lille is an adjective.

If this worked, we could not only define all adjectives used in adaptive
responses like this and get all the declensions for free, but also define nouns
with attributive adjectives in their names ("den lille pige") and decline them
automatically as well!

However, this currently does not work, for unknown reasons. I assume it's a
bug, which I have reported as //I7-2626 -> https://inform7.atlassian.net/browse/I7-2626//.

@

Still, let's wax poetic about Danish adjectives.

In English, Inform does not care about the difference between an adjective that
is part of a noun's name, and a compound noun. It doesn't need to.

A "hot dog" is semantically ambiguous -- it can either be a warm feline or a
specific type of sausage -- but syntactically it doesn't matter, since
adjectives aren't inflected in English.

(Adjectives in English do inflect for degrees of comparison, so the dog can get
hotter and hottest, which Inform does support -- see //DanishLanguage// -- but not
when printing adjectives that are part of a noun's name.)

So in English, Inform simply inflects the last word in a noun's name for
number, and leaves all other words alone: a hot dog, the hot dog, some hot
dogs.

In Danish, however, we need to inflect adjectives for gender and
number/definiteness (an adjective inflected in the definite or in the plural
looks the same). Unfortunately, I haven't managed to add bare adjectives (not
connected to properties) to the dictionary.

@

So as a fallback, we define say phrases for some adjectives used in
//Responses//.
=
To say tom:
	if the prior naming context is plural:
		say "tomme";
	otherwise if the prior named gender is masculine gender:
		say "tom";
	otherwise if the prior named gender is neuter gender:
		say "tomt".
To say tomme:
	say tom.
To say tomt:
	say tom.

To say lukket:
	if the prior naming context is plural:
		say "lukkede";
	otherwise:
		say "lukket".

To say åben:
	if the prior naming context is plural:
		say "åbne";
	otherwise if the prior named gender is masculine gender:
		say "åben";
	otherwise if the prior named gender is neuter gender:
		say "åbent".

@h Adjective declensions.

Since declining adjectives currently doesn't work, the following grammar
is incomplete, and should be extended if needed.
=
Include (-
	language Danish

	<s-adjective-list> ::=
		non <indefinite-article> <s-adjective-list-unarticled> |	[ This is from French Language and I'm not sure what it is. ]
		<indefinite-article> <s-adjective-list-unarticled> |	
		<s-adjective-list-unarticled>							

	<s-adjective-list-unarticled> ::=
		non <s-adjective> |										
		<s-adjective> |											
		non <s-adjective> <s-adjective-list-unarticled> |		
		<s-adjective> <s-adjective-list-unarticled>	

	<adjective-to-plural> ::=
		*		0e

	<adjective-to-masculine-singular> ::=
		*		0

	<adjective-to-neuter-singular> ::=
		*		0

	<adjective-to-masculine-plural> ::=
		*		0e

	<adjective-to-neuter-plural> ::=
		*		0e

	<adjective-to-feminine-singular> ::=
		*                0

	<adjective-to-feminine-plural> ::=
		*		0e

	<adjective-to-comparative> ::=
		*	0
	<adjective-to-superlative> ::=
		*	0
	<adjective-to-quiddity> ::=
		*	0tet
-) in the Preform grammar.