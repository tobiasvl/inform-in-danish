Nouns.

Handling nouns.

@h Inflection of nouns.

TODO: We need definite inflection and plural definite inflection.
=
Include (-
	language Danish

	<noun-declension> ::=
			*    <da-noun-declension-group> <da-noun-declension-tables>

	<da-noun-declension-group> ::=
			*            1

	<da-noun-declension-tables> ::=
			<da-noun-declension-uninflected>

	<da-noun-declension-uninflected> ::=
			0 | 0 |
			0 | 0

	<singular-noun-to-its-indefinite-article> ::=
		m           en |
		f			en |
		n           et

	<singular-noun-to-its-plural> ::=
	[        <da-singular-adjective-to-its-plural> <da-singular-noun-to-its-plural> |]
			<da-singular-noun-to-its-plural>

	<da-singular-np-to-its-plural> ::=
		<da-singular-adjective-to-its-plural> <da-singular-noun-to-its-plural> |
		<da-singular-noun-to-its-plural>

	<da-singular-noun-to-its-plural> ::=
		... <da-trie-plural-uninflected> |
		... <da-trie-plural-pronouns> |
		... <da-trie-plural-exceptions> |
		... <da-plural-by-ending> |
		... <da-plural-default>

	<da-trie-plural-uninflected> ::=
		sau			0


	<da-trie-plural-exceptions> ::=
		får			0


	<da-plural-by-ending> ::=
		*e			0r |
		*k                      0+er

	<da-plural-default> ::=
		*                       0er

-) in the Preform grammar.
