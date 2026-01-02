Gender.

Handling gender.

@h Gender.
=
Volume - Gender

@ Danish has two grammatical genders: Common gender (fælleskøn) and neuter gender (intetkøn). All common nouns have a grammatical gender. Nouns are inflected based on the grammatical gender, as are adjectives.

The tables mapping an object's GNA (Gender, Number, Animation) to articles
and pronouns are set in //DanishLanguageKit//, and this routine calculates
the GNA of an object for that use. 

@ One exception needs to be handled first: nothing. Although I don't think anything in the standard rules tries to
calculate the GNA of the special dummy object "nothing", we might want to in our routines, so for robustness's sake
let's set it explicitly. It doesn't have a gender in Danish since it's not a noun (it's a pronoun), and it will never
want an article, but like other dummy pronouns ("det", "der") it behaves as if it's neuter in that it inflects
adjectives as neuter.

@ Then, to get an object's GNA, we follow this algorithm:

(*) If the object is animate (ie. it is a person, in Inform parlance, which includes animals), and it is not neuter, then we set its grammatical gender according to its natural gender.
(*) If the object is inanimate, or it's animate and neuter, we use its grammatical gender.

@define NO_KNOWN_GENDERS 3
@define COMMON_GENDER 1
@define NEUTER_GENDER 2
@define FEMININE_GENDER 3

=
Include (-
    [ GetGNAOfObject obj case gender;
        if (obj == nothing) return 8;
        if (obj has animate && obj hasnt neuter) {
            if (obj has male) gender = male;
            if (obj has female) gender = female;
        } else {
            case = 6;
            if (obj.grammatical_gender == 1) gender = common; ![ TODO it probably makes stuff messed up that we reordered these ]
            if (obj.grammatical_gender == 2) gender = neuter;
            ! if (obj.grammatical_gender == COMMON_GENDER) gender = common;
            ! if (obj.grammatical_gender == NEUTER_GENDER) gender = neuter;
        }

        if (gender == 0) {
            if (case == 0) gender = LanguageAnimateGender;
            else gender = LanguageInanimateGender;
        }

        if (gender == female)   case = case + 1;
        if (gender == neuter)   case = case + 2;
        if (obj has pluralname) case = case + 3;
        return case;
    ];
-) replacing "GetGNAOfObject" [ (in CommandParserKit) ].

@h Prior named gender.

We create a new variable, the prior named gender, modelled after the prior
named object (the last object that was printed).
=
Include (-
    Global prior_named_gender; ! for adaptive text generation
-).

The prior named gender is a grammatical gender that varies.
The prior named gender variable is defined by Inter as "prior_named_gender".

@ Why would we need that? Since we already have the prior named object, can't
we just check its grammatical gender? After all, every object has a grammatical
gender, as we defined in the //Preamble//.

The special dummy object |nothing| is considered an object (and in adaptive
text we often want to both set the prior named object to nothing explicitly,
and check if it is nothing), but it doesn't have any properties, so trying to
access its grammatical gender results in a run-time error. Not good!

So every time we set the prior named object, we also set the prior named
gender, so it can be checked without having to go through an object.

I wonder if the prior named list should be set to 0 if the prior named object
is nothing, but it might blow up something, so I won't.
=
Include (-
    [ RegardingSingleObject obj;
        prior_named_list = 1; ! Should this be 0 if obj == nothing?
        prior_named_list_gender = -1;
        prior_named_noun = obj;
        if (obj == nothing) prior_named_gender = 2; ! TODO check ordering
        else prior_named_gender = obj.grammatical_gender;
    ];
-) replacing "RegardingSingleObject".

Include (-
    [ RegardingNumber n;
        prior_named_list = n;
        prior_named_list_gender = -1;
        prior_named_noun = nothing;
        prior_named_gender = 2; ! TODO check if this still works after redefining the order of grammatical genders.
    ];
-) replacing "RegardingNumber".

Include (-
    [ RegardingLWI;
        prior_named_list = LWI_Storage-->0;
        prior_named_list_gender = LWI_Storage-->1;
        prior_named_noun = LWI_Storage-->2;
        if (prior_named_noun == nothing) prior_named_gender = 2; ! TODO check ordering here too.
        else prior_named_gender = prior_named_noun.grammatical_gender;
    ];
-) replacing "RegardingLWI".

@h List Number and Gender.

Maybe you noticed the intriguing variable |prior_named_list_gender| above? I
didn't define it, so it's built into Inform.

In addition to the above appearances, it's also set every time a list is
printed. If all the objects in the list have the same gender (which is the GNA,
but modulus 3, so that it can only be singular male, female or neuter), then
this variable contains that gender; if the objects don't all share a gender,
it's set to -1. This is of course unused in English Inform, and it also isn't
useful in Danish, so we won't bother with it. It might be useful to know about
it for other translations, though.

However, one the list functions also sets the prior named noun, so we might
want to set the prior named gender there too. Its behavior is a bit strange:
It sets the prior named object to the FIRST object in the list. I'm not sure if
this is a bug or not. Regardless, we'll keep the behavior for the prior named
gender.

There's another function that sets the prior named list gender,
|WriteListOfMarkedObjects|, but it doesn't set the prior named object, so we
won't change it to set the prior named gender either.

=
Include (-
    [ RegardingMarkedObjects
        obj length g gc;
        gc = -2;
        objectloop (obj ofclass Object && obj has workflag2) {
            length++;
            g = GetGNAOfObject(obj); g = g%3;
            if (gc == -2) {
                gc = g;
                prior_named_noun = obj; ! Bug?
                if (obj == nothing) prior_named_gender = 2; ! TODO check ordering
                else prior_named_gender = obj.grammatical_gender;
            } else if (gc ~= g) gc = -1;
        }
        prior_named_list = length;
        prior_named_list_gender = gc;
        if (length == 0) {
            prior_named_noun = nothing;
            prior_named_list_gender = -1;
            prior_named_gender = 2; ! TODO check ordering
        }
        return;
    ];
-) replacing "RegardingMarkedObjects".