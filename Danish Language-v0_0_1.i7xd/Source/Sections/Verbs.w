Verbs.

Handling verbs.

@h Basic Verbs.

First we translate some important verbs that are defined in Basic Inform.

There's one snag: Inform doesn't let us define a Danish verb with the same
infinitive form as the corresponding English verb. So this doesn't work:

>> In Danish have is a verb meaning to have.

So instead we choose the informal contracted infinitive form "ha'".

=
[In Danish at have is a verb meaning to have.]
In Danish ha' is a verb meaning to have.
In Danish være is a verb meaning to be.

@h Modal verbs.

These modal verbs are defined in the English Language extension.
=
Section - Modal verbs

In Danish kunne is a verb meaning to be able to.
In Danish kunne is a verb meaning to could.
In Danish måtte is a verb meaning to may.
In Danish måtte is a verb meaning to might.
In Danish skulle is a verb meaning to must.
In Danish burde is a verb meaning to should.
In Danish ville is a verb meaning to would.

@h Verbs needed for adaptive text.

These verbs are also defined in the English Language extension.
They're used in //Responses//, and therefore need to be translated
in order to be adaptive (ie. able to be inflected) in parser
feedback.
=
Section - Verbs needed for adaptive text [ TODO ]

In Danish opnå is a verb meaning to achieve.
In Danish værdsætte is a verb meaning to appreciate.
In Danish ankomme is a verb meaning to arrive.
In Danish bryde sig is a verb meaning to care.
In Danish lukke is a verb meaning to close.
In Danish dø is a verb meaning to die.
In Danish opdage is a verb meaning to discover.
In Danish smide is a verb meaning to drop.
In Danish spise is a verb meaning to eat.
In Danish føle is a verb meaning to feel.
In Danish finde is a verb meaning to find.
In Danish få is a verb meaning to get.
In Danish give is a verb meaning to give.
In Danish gå is a verb meaning to go.
In Danish ske is a verb meaning to happen.
In Danish høre is a verb meaning to hear.
In Danish hoppe is a verb meaning to jump.
In Danish mangle is a verb meaning to lack.
In Danish føre is a verb meaning to lead.
In Danish lytte is a verb meaning to listen.
In Danish låse is a verb meaning to lock.
In Danish kigge is a verb meaning to look.
In Danish behøve is a verb meaning to need.
In Danish åbne is a verb meaning to open.
In Danish passere is a verb meaning to pass.
In Danish samle is a verb meaning to pick.
In Danish provokere is a verb meaning to provoke.
In Danish trække is a verb meaning to pull.
In Danish skubbe is a verb meaning to push.
In Danish lægge is a verb meaning to put.
In Danish gnide is a verb meaning to rub.
In Danish sige is a verb meaning to say.
In Danish lede efter is a verb meaning to search.
In Danish se is a verb meaning to see. [ TODO vs. look ]
In Danish virke is a verb meaning to seem.
In Danish sætte is a verb meaning to set.
In Danish lugte is a verb meaning to smell.
In Danish snuse is a verb meaning to sniff.
In Danish klemme is a verb meaning to squeeze.
In Danish skifte is a verb meaning to switch.
In Danish tage is a verb meaning to take.
In Danish tale is a verb meaning to talk.
In Danish smage is a verb meaning to taste.
In Danish røre ved is a verb meaning to touch.
In Danish dreje is a verb meaning to turn.
In Danish vente (han venter, hun ventet, de venter, han er ventende, han har ventet, hun hadde ventet) is a verb meaning to wait.
In Danish vifte is a verb meaning to wave. [ TODO ]
In Danish vinke is a verb meaning to wave. [ TODO ]
In Danish vinde is a verb meaning to win.
In Danish bære is a verb meaning to carry.

In Danish række is a verb.
In Danish tænde is a verb.
In Danish slukke is a verb.
In Danish komme is a verb.

@h Manual verb conjugation.

The author can, in the Inform source text, define some of the different verb forms explicitly when defining a verb:

>> In Danish vente (han venter, de venter, hun ventet, han er ventende) is a verb.

Each form needs to be preceded by a pronoun, and these forms are supported:

(*) present singular
(*) present plural
(*) past
(*) present participle
(*) past participle

This syntax is tailored for English. In English, the present participle is more 
common (he is waiting), while it's rarely used in Danish. A bigger problem is 
that regular verb forms in English are more often identical to the infinitive 
(to wait, I wait), except for the second person singular present (he waits).
This means that if the author doesn't supply the present plural form, for
example, it's set to be the same as the infinitive. This works for English (to
wait, they wait), but rarely works well for Danish (at vente, de vente), since
it obviously should be the same as the other present tenses (han venter, de 
venter). For that reason, all tenses should probably be explicitly defined even 
though Danish doesn't conjugate verbs for plurality.

Note that this syntax is deprecated, because it generalises badly to other
languages than English (as demonstrated), and the source text is only allowed
to define some forms of the verb (for example, there's no way to define the
imperative form). Still, we might as well support it, in case the author wants
to make up a verb with very irregular forms.

=
Include (-
    language Danish

    <conjugation> ::=
        <subject-pronoun> er ... |  ==> { 0, RP[1], <<is-participle>> = TRUE }
        <subject-pronoun> ...       ==> { 0, RP[1], <<is-participle>> = FALSE }

    <participle-like> ::=
        <probable-participle> *** |
        *** <probable-participle>
-) in the Preform grammar.

@h Automatic verb conjugation.

For the general Danish verbs you'll find in a dictionary, we'll write a
producing Preform grammar which can construct all the forms automatically.

We will need the following verb forms:

(1) Infinitive
(2) Present participle [ TODO: gerund / verbal noun? ]
(2) Past participle
(3) Present tense
(4) Past tense
(5) Past perfect
(6) Imperative
[ (7) Present participle?? TODO ]

@h Infinitive (form type 1).

Inform reserves the first verb form for the infinitive, which is fine for
Danish.

By default, Inform uses this as the base form of the verb as well ("form type
0"), but it doesn't need to be identical to the infinitive. The imperative (see
below) could potentially have worked better as the base form; in Danish the
imperative form of a verb is usually its stem, and the infinitive is the
stem/imperative form plus an -e suffix. We'll still use the infinitive as the
base form, but we'll define it based on the imperative.

We let authors define verbs by writing the infinitive form in the source code,
either with or without the infinitive marker "at".

=
Include (-
    language Danish

    <infinitive-declaration> ::=
        at <infinitive-usage> ( ... ) |
        at <infinitive-usage> |
        <infinitive-usage> ( ... ) |
        <infinitive-usage>
-) in the Preform grammar.

@h Present participle (form type 2). [ TODO: gerund / verbal noun ]

Inform reserves the second verb form for the present participle. Present
participle is common in English (as what they, somewhat incorrectly
linguistically speaking, call "gerund": "playing on computers is fun"), which
isn't used in Danish, and as the finite progressive/continuous form ("they are
always playing"), which is rarely used in Danish. However, the present
participle is used adjectively in Danish ("the playing children", "de lekende
børn"), so it's still useful for us here.

However, English conflates the gerund and the present participle. Inform calls
this form present participle, but it uses it as the gerund when defining verbs
as actions:

>> Smoothing is an action applying to one thing.

Here we obviously can't use the Danish present participle, we have to use the
verbal/gerundian noun (nomen actionis), as it is a verb acting as a noun. But
Inform doesn't have a concept of the gerund and the present participle being
different, so we'll have to separate them.

@h Past participle (form type 3).

Inform reserves the third verb form for the past participle. For Danish this is
the perfect passive participle of the verb, which is used to form the past
perfect ("har sunget") and the past pluperfect (plusquamperfect) ("havde
sunget").

@h Adjoint infinitive (form type 4).

Inform reserves the fourth verb form for what it calls the "adjoint
infinitive", which is when a modal verb construction is used and the second
verb is in the infinitive ("be able to touch").

@h Present tense (form type 5).

Just like English Inform does, we define the fifth verb form to be the present
tense.

=
To say present tense of (V - a verb):
	(- {V}(5); -).
	
@h Past tense (form type 6).

And also just like English Inform, the sixth verb form is the past tense
(preterite/imperfect).

=
To say past tense of (V - a verb):
	(- {V}(6); -).

@h Imperative mood (form type 7).

In English, the imperative form is identical to the infinitive form, but in
Danish it's different. We therefore define the seventh verb form as the
imperative.

In Danish the imperative is finite, and it can't be conjugated. (Archaic Danish
had a plural imperative, and also a passive imperative, but these are no longer
used and we don't bother implementing them.) It's therefore not useful for
adaptive text, ie. it can't be adapted to the story tense and story viewpoint.
However, an author might still want to adapt verbs to the imperative manually, 
especially because the player is likely to write all their commands in the
imperative.
=
Imperative tense is a grammatical tense.

To say the/-- imperative mood/-- of (V - a verb):
	(- {V}(7); -).

@h Verb form type definitions.

As stated, Inform also reserves verb form type zero as the base form, but it
will be identical to the infinitive (although that's not required to be the
case). We then end up with these forms:

@define BASE_FORM_TYPE 0
@define INFINITIVE_FORM_TYPE 1
@define PRESENT_PARTICIPLE_FORM_TYPE 2
@define PAST_PARTICIPLE_FORM_TYPE 3
@define ADJOINT_INFINITIVE_FORM_TYPE 4
@define PRESENT_TENSE_FORM_TYPE 5
@define PAST_TENSE_FORM_TYPE 6
@define IMPERATIVE_FORM_TYPE 7

Or:

(1) Infinitive
(2) Present participle (præsens partisipp) (syngende) -- TODO: Is this only used adjectivally in Danish?
(3) Past participle (perfektum) (har + perfektum passiv partisipp)
(4) Adjoint infinitive
(5) Present (præsens/nutid)
(6) Past (præteritum/datid)
(7) Imperative

These are referred to with their numbers in the conjugation tries below.

@h Verb tense definitions.

=
Include (-
    language Danish

    <verb-conjugation-instructions> ::=
        være            <to-be-conjugation> |
        [ kunne ...  <to-be-able-to-auxiliary> |
        kunne      <to-be-able-to-conjugation> |
        kunne           <modal-conjugation> |
        måtte             <modal-conjugation> |
        skulle            <modal-conjugation> |
        burde          <modal-conjugation> |
        ville           <modal-conjugation> | ]
        gøre              <to-do-conjugation> |
            ...             <regular-verb-conjugation>

    <to-be-conjugation> ::=
        2 0nde |
        3 1t |
        7 1 |
        <to-be-tabulation>

    <to-be-tabulation> ::=
        a1+        er |
        a1-        er ikke |
        a2+        var |
        a2-        var ikke

    <to-have-conjugation> ::=
        2 0nde |
        3 haft |
        7 1 |
    [    <auxiliary-verb-only> | ]
        <not-instance-of-verb-at-run-time> |
        <to-have-tabulation>

    <to-have-tabulation> ::=
        a1+        har |
        a1-        har ikke |
        a2+        havde |
        a2-        havde ikke

@

=
    <regular-verb-conjugation> ::=
        2         <da-trie-present-participle> |
        3         <da-trie-past-participle> |
        5         <da-trie-present-verb-form> |
        6         <da-trie-past> |
        7         <da-trie-imperative> |
        <regular-verb-tabulation>

    <regular-verb-tabulation> ::=
        a1+       5 |
        a1-       5 ikke |
        a2+       6 |
        a2-       6 ikke |
        a3        ( t1 auxiliary-have ) 3 |
        a4        ( t2 auxiliary-have ) 3 |
        a5+       vil 1 |
        a5-       vil ikke 1 |
        p*        3 af

@h Verb conjugation grammar.

And finally we come to the Preform grammars that generates all of the above.

These tries have been generated based on the corpus //Det Centrale Ordregister (COR) -> https://ordregister.dk/doc/COR.html//
created by //Dansk Sprognævn -> https://dsn.dk//, which contains 7493 Danish
verbs.

@h Conjugating present participle.

Almost all present participles are formed in the same way, ending in -ende but
without a double e if the infinitive already ends with it. The exceptions are a
handful of words that do end up with -eende after all; really just a few
one-syllable words, plus compound words ending in those one-syllable words.

=

    <da-trie-present-participle> ::=
        ske			0ende  |
        se			0ende  |
        te			0ende  |
        sne			0ende  |
        le			0ende  |
        forudse		0ende  |
        gennemse	0ende  |
        overse		0ende  |
        indse		0ende  |
        hense		0ende  |
        udse		0ende  |
        imødese		0ende  |
        anse		0ende  |
        undse		0ende  |
        tilgodese	0ende  |
        påse		0ende  |
        forbise		0ende  |
        afse		0ende  |
        efterse		0ende  |
        bortse		0ende  |
        gense		0ende  |
        tilse		0ende  |
        forse		0ende  |
        bese		0ende  |
        udle		0ende  |
        skoggerle	0ende  |
        hånle		0ende  |
        klukle		0ende  |
        *e			1nde   |
        *			0ende     [ TODO check that this is correct ]

@h Conjugating past participle.

=

    <da-trie-past-participle> ::=
        <da-trie-irregular-past-participle> |
        <da-trie-vowel-past-participle> |
        <da-trie-double-consonant-past-participle>

    <da-trie-irregular-past-participle> ::=
        *gøre	3jort	|
        *sætte	4at		|
        *bringe	4agt	|
        *lægge	4agt	|
        *rive   3evet	|
        *inde	4undet	|
        *yde	3udt	|
        *ære	3året	|
        *strække	4akt |
        *trække	4ukket	|
        *række	4akt	|
        *kke	4ukket	|
        *nge	4unget	|
        synes	2tes	|
        skyldes	2tes	|
        mødes	2tes	|
        findes  fandtes |
        strides 4edes |
        følges  fulgtes	|
        skændes	2tes 	|
        *rives  4eves	|
        brydes  brødes	|
        omgås	1edes	|
        have	haft	|
        slås	2oges	|
        kvæle	3alt	|
        krybe	3øbet	|
        *ibe	3ebet	|
        *ige	3eget	|
        *ide	3edet	|
        *æde	3ådt	| [ træde ]
        *fryse	3osset  |
        *ryge	3øget	|
        *sige	3agt	|
        *svælge 0t		| [ regular ]
        *vælge	4algt	|
        *sælge	4olgt	|
        *følge	4ulgt	|
        *spørge	4urgt	|
        *tælle	4alt	|
        *lyve	3øjet	|
        *træffe	3uffet	|
        *smøre	3urt	|
        *stjæle	3ålet	|
        *hjælpe	4ulpet	|
        *synke	4unket	|
        *slippe	4uppet


        <da-trie-vowel-past-participle> ::=
            *es		1des |
            *<aiouæøå>		0et |
            udle	0et |
            te		0et |
            skoggerle	0et |
            sne		0et |
            le		0et | [ TODO lo ]
            hånle	0et |
            klukle	0et |
            småle	0et
        
        <da-trie-double-consonant-past-participle> ::=
            *bestille	2t |
            *gemme	2t 	|
            *drømme	2t	|
            *glemme	2t 	|
            *stemme	2t	|
            ramme	2t	|
            klemme	2t	|
            *dømme	2t	


    [	
        <da-trie-double-consonant-past-participle> ::=
            *lle	0t	|
            *mme	0t	|
            *nne	0t	|
            *kke	0t	|
            *e		1t  |
            *e		0t
    ]
	

@h Conjugating present tense.

The present tense is simple in Danish. There are just a handful of irregular
exceptions.

=
    <da-trie-present-verb-form> ::=
        ha'		har  |
        have	har  |
        skulle	skal |
        turde	tør  |
        burde	bør  |
        kunne	kan  |
        måtte	må   |
        være	er   |
        vide	ved  | [ There's also another verb "at vide (ud)" which we ignore ]
        ville	vil  |
        *gøre	1    |
        slås	0    |
        *es		0    | [ Passive verbs ] [ or simply *s ?]
        *		0r

@h Conjugating past tense.

=
    <da-trie-past> ::=
        nedfare 3or     |
        stjæle  3al     |
        *lægge  4agde   |
        bringe  4agte   |
        kunne   0       |
        spørge  4urgte  |
        træffe  4af     |
        slippe  4ap     |
        hjælpe  4alp    |
        tykkes  3tes    |
        findes  5andtes |
        brydes  4ødes   |
        følges  5ulgtes |
        række   4akte   |
        tælle   4alte   |
        kvæle   3alte   |
        ligge   4å      |
        *ølge   4ulgte  |
        vælge   4algte  |
        sælge   4olgte  |
        smøre   3urte   |
        sætte   4atte   |
        fryse   3øs     |
        gælde   4jaldt  |
        *inde   4andt   |
        træde   3ådte   |
        sidde   4ad     |
        krybe   3øb     |
        *ides   4edes   |
        rives   4eves   |
        omgås   2ikkes  |
        *kke    4ak     |
        *nke    4ank    |
        *age    3og     |
        *nge    4ang    |
        *ige    3eg     |
        sige    3agde   |
        ryge    3øg     |
        *ive    3ev     |
        give    3av     |
        have    1de     |
        ha'     1vde    |
        lyve    3øj     |
        gøre    3jorde  |
        *ære    3ar     |
        *lde    1t      |
        *ide    3ed     |
        lade    3od     |
        *æde    3åd     |
        *yde    3ød     |
        *ibe    3eb     |
        slås    2oges   |
        ske     0te     |
        *de     3ad     |
        æde     åd      |
        stå     1od     |
        slå     1og     |
        *es     1des    |
        *es     2tes    |
        ses     2ås     |
        *e      2te     |
        *e      1te     |
        le      1o      |
        *e      0       |
        *e      2       |
        *e      1       |
        se      1å      |
        *å      1ik     |
        *       0de     |
        *       0ede

@h Conjugation imperative mood.
=
    <da-trie-imperative> ::=
        *		1

-) in the Preform grammar.

@ Other stuff.
=

Include (-
    [ PrintVerb v;
        if (WorldModelKit`NO_VERB_VERB_EXISTS) {
            if (v == 'no.verb') { print "gøre noget med"; rtrue; }
        }
        rfalse;
    ];
-) replacing "PrintVerb".

@h Print command so far.

TODO: This is commented out, but could be tailored to print the verb in the
parser command so far in the infinitive rather than the imperative.
= (text as code)
To say parser command so far:
	(- PrintCommand(0); -).

Include (-
    [ PrintCommand from i k spacing_flag;
        if (from == 0) {
            i = verb_word;
            if (LanguageVerb(i) == 0)
                if (PrintVerb(i) == 0) { print (address) i; print "e"; } ! TODO if printverb didn't print anything we want to print the infinitive
            from++; spacing_flag = true;
        }
        for (k=from : k<pcount : k++) {
            i = pattern-->k;
            if (i == PATTERN_NULL) continue;
            if (spacing_flag) print (char) ' ';
            if (i == 0) { PARSER_CLARIF_INTERNAL_RM('F'); jump TokenPrinted; }
            if (i == 1) { PARSER_CLARIF_INTERNAL_RM('G'); jump TokenPrinted; }
            if (i >= REPARSE_CODE)
                print (address) VM_NumberToDictionaryAddress(i-REPARSE_CODE);
            else {
                if (i ofclass K3_direction) { ! && LanguageVerbLikesAdverb(i)) {
                    print (LanguageDirection) i; ! the direction name as adverb
                } else {
                    print (the) i;
                }
            }
        .TokenPrinted;
            spacing_flag = true;
        }
    ];
-) replacing "PrintCommand".

@h Showverb Command.
SHOWVERB is a holdover from old I6 days, but still quite useful. It writes
out the I6 command verb grammar for the supplied command.

TODO: Add functionality to write out the I7 verb information too.

=
Section - Show Verb command (not for release)

Include (-
    [ ShowVerbSub address lines i x;
        wn = 2; x = NextWordStopped();
        if (WordMarkedAsVerb(x) == false)
            "Try typing ~showverb~ and then the name of a verb.";
        i = DictionaryWordToVerbNum(x);
        address = VM_CommandTableAddress(i);
        lines = address->0;
        address++;
        print "Verb ";
        if (WordMarkedAsMeta(x)) print "meta ";
        VM_PrintCommandWords(i);
        new_line;
        if (lines == 0) print "has no grammar lines.^";
        for (: lines>0 : lines-- ) {
            address = UnpackGrammarLine(address);
            print "    "; DebugGrammarLine(); new_line;
        }
        ParaContent();
    ];
-) replacing "ShowVerbSub".