Command Grammar.

The Danish grammar for parsing typed commands in play.

@h Command Grammar.

We redefine all the commands from the standard rules here.
=
Part - Command Grammar (in place of Part Six - Grammar in Standard Rules by Graham Nelson)

Understand "tag [things]" as taking.
Understand "tag [things] op" as taking.
Understand "tag op [things]" as taking.
Understand "tag af [something]" as taking off.
Understand "tag [something] af" as taking off.
Understand "tag [things inside] fra [something]" as removing it from.
Understand "tag [something] fra [something]" as removing it from. [ For better error messages. ]
Understand "tag [things inside] af [something]" as removing it from.
Understand "tag [something] af [something]" as removing it from. [ For better error messages. ]
Understand "tag på [something preferably held]" as wearing.
Understand "tag [something preferably held] på" as wearing.
Understand the commands "ta'", "ta", "bær" and "hold" as "tag".

Understand "gå ind" as entering.
Understand "gå ud/ned/op ad/af/--" as exiting.
Understand "gå ind/indeni på/i/-- [something]" as entering.
Understand "gå ud/ned/op ad/af/-- [something]" as getting off.
Understand "gå gennem/igennem [something]" as entering.
Understand "gå til [something]" as going.

Understand "pluk op [things]" or "pluk [things] op" as taking.

Understand "stå" or "stå op" as exiting.
Understand "stå på [something]" as entering.

Understand "fjern [something preferably held]" as taking off.
Understand "fjern [things inside] fra [something]" as removing it from.
Understand "fjern [something] fra [something]" as removing it from. [ For better error messages. ]

Understand "iklæ [something preferably held]" as wearing.
Understand "afklæ [something preferably held]" as taking off.

Understand "læg [other things] in/indeni/i [something]" as inserting it into.
Understand "læg [other things] på/ovenpå [something]" as putting it on.
Understand "læg ned [things preferably held]" or "læg [things preferably held] ned" as dropping.

Understand "sæt [other things] in/inside/into [something]" as inserting it into.
Understand "læg [other things] på/ovenpå [something]" as putting it on.
Understand "læg ned [things preferably held]" or "læg [things preferably held] ned" as dropping.

Understand "smid [things preferably held]" as dropping.
Understand "smid [other things] in/into/down [something]" as inserting it into.
Understand "smid [other things] on/onto [something]" as putting it on.
Understand "smid [something preferably held] at/against [something]" as throwing it at.
Understand the commands "kast" and "slip" and "tab" as "smid".

Understand "giv [something preferably held] to [someone]" as giving it to.
Understand "giv [someone] [something preferably held]" as giving it to (with nouns reversed).
Understand the commands "gi'", "gi", "pay" and "offer" and "feed" as "giv".

Understand "vis [someone] [something preferably held]" as showing it to (with nouns reversed).
Understand "vis [something preferably held] til [someone]" as showing it to.
Understand the commands "præsenter" and "fremvis" as "vis".

Understand "gå" as going.
Understand "gå [direction]" as going.
Understand "gå [something]" as entering.
Understand "gå ind/indeni/på i/-- [something]" as entering.
Understand "gå ud/ned/op ad/af/--" as exiting.
Understand the commands "walk" and "løb" as "gå".

Understand "inventory" as taking inventory.
Understand the commands "status", "i" and "inv" as "inventory".

Understand "se" as looking.
Understand "se på [something]" as examining.
Understand "se [something]" as examining.
Understand "se indeni/ind/gennem/igennem [something]" as searching.
Understand "se under [something]" as looking under.
Understand the commands "kig" and "l" as "se".

Understand "konsulter [something] om/angående [text]" as consulting it about.

Understand "åbne [something]" as opening.
Understand "åbne for [something]" as opening.
Understand "åbne [something] med [something preferably held]" as unlocking it with.
Understand "åbne for [something] med [something preferably held]" as unlocking it with.
Understand the commands "åbn", "unwrap", "uncover" as "åbne".

Understand "luk [something]" as closing.
Understand "luk for [something]" as closing.
Understand "luk op [something]" as opening.
Understand "luk op for [something]" as opening.
Understand "luk for [something]" as switching off.
Understand the commands "shut" and "cover" as "luk".

Understand "sid på toppen af [something]" as entering.
Understand "sid på/i/indeni [something]" as entering.

Understand "undersøg [something]" as examining.
Understand the commands "x", "watch", "describe" and "check" as "undersøg".

Understand "læs [something]" as examining.
Understand "læs om [text] i [something]" as consulting it about (with nouns reversed).
Understand "læs [text] i [something]" as consulting it about (with nouns reversed).

Understand "ja" as saying yes.
Understand the command "j" as "ja".

Understand "nei" as saying no.

Understand "unskyld", "beklager" and "omforladels" as saying sorry.

Understand "søg [something]" as searching.
Understand "led i/indeni/efter/-- [something]" as searching.

Understand "vink" as waving hands.

Understand "vift [something]" as waving.

Understand "set [something] til [text]" as setting it to.
Understand "stil ind [something] til [text]" as setting it to.
Understand the command "indstil" as "set".

Understand "træk [something]" as pulling.
Understand the command "drag" as "træk".

Understand "skub [something]" as pushing.
Understand "skub [something] [direction]" or "skub [something] til [direction]" as pushing it to.
Understand the commands "flyt", "skift" as "skub".

Understand "vrid [something]" as turning.
Understand the commands "rotere" and "skru" as "vrid".

Understand "tænd [something]" or "tænd for [something]" as switching on.
Understand "tænd op [something]" as burning.

Understand "slå til [something]" as switching on.
Understand "slå fra [something]" as switching off.
Understand "slå for [something]" as closing.
Understand "slå op [text] i [something]" as consulting it about (with nouns reversed).
Understand "slå efter [text] i [something]" as consulting it about (with nouns reversed).
Understand "slå [something]" as attacking.
Understand "slå ihjel [someone]" as attacking.
Understand "slå ned [someone]" as attacking.
Understand "slå ud [someone]" as attacking.
Understand "slå ind [something]" as attacking.

Understand "sluk [something]" or "sluk for [something]" as switching off.

Understand "stop [something]" as switching off.

Understand "lås [something] med [something preferably held]" as locking it with.

Understand "lås op [something] med [something preferably held]" as unlocking it with.

Understand "angrib [something]" as attacking.
Understand the commands "ødelæg", "myrd" and "dræb" as "angrib".

Understand "vent" as waiting.
Understand the command "z" as "vent".

Understand "svar [text] til [someone]" as answering it that (with nouns reversed).
Understand the commands "sig", "råb" and "tal" as "svar".

Understand "fortæl [someone] om [text]" as telling it about.

Understand "spørg [someone] om [text]" as asking it about.
Understand "spørg [someone] efter [something]" as asking it for.
Understand "bed [someone] om [something]" as asking it for.

Understand "spis [something preferably held]" as eating.
Understand the commands "æd" and "gnask" as "spis".

Understand "sov" as sleeping.
Understand the command "blund" as "sov".

Understand "klatre [something]" or "klatre op/over [something]" as climbing.
Understand the command "klavre" as "klatre".

Understand "køb [something]" as buying.

Understand "klem [something]" as squeezing.
Understand the command "press" and "knib" and "tryk" as "klem".

Understand "gyng [something]" or "gyng på [something]" as swinging. [ TODO: What is this actually ]

Understand "vågn", "vågne", "vågn op" or "vågne op" as waking up.

Understand "væk [someone]" or "væk [someone] op" or "væk op [someone]" as waking.
Understand the commands "opvæk" and "opvække" as "væk".

Understand "kys [someone]" as kissing.
Understand the commands "knus", "omfavn", "omfavne" and "kram" as "kys".

Understand "tænk" as thinking.

Understand "lugt" as smelling.
Understand "lugt [something]" as smelling.
Understand the command "sniff" as "lugt".

Understand "lyt" as listening to.
Understand "hør [something]" as listening to.
Understand "lyt til [something]" as listening to.

Understand "smag på/-- [something]" as tasting.

Understand "rør ved/-- [something]" as touching.
Understand the command "føl" as "rør".

Understand "gnid [something]" as rubbing.
Understand the commands "gnub", "skrub", "skur" and "vask" as "gnid".

Understand "bind [something] til [something]" as tying it to.
Understand the command "fæst" as "bind".

Understand "brænd [something]" as burning.
Understand the commands "fyr" and "antænd" as "brænd".

Understand "drik [something]" as drinking.
Understand the commands "svælg" and "søb" as "drik".

Understand "skær [something]" as cutting.

Understand "spring" as jumping.
Understand the commands "hop" as "spring".

Understand "score" as requesting the score.
Understand "afslut" or "q" as quitting the game.
Understand "gem" as saving the game.
Understand "genstart" as restarting the game.
Understand "hent" as restoring the game.
Understand "bekræft" as verifying the story file.
Understand "version" or "udgave" as requesting the story file version.
Understand "copyright" or "ophavsret" as requesting copyright licences. [ TODO: Will be released in the next Inform version]
Understand "script" or "script on" or "transcript" or "transcript on" or "udskrift" or "udskrift til" as switching the story transcript on.
Understand "script off" or "transcript off" or "udskrift fra" as switching the story transcript off.
Understand "superbrief" or "short" or "kort" or "korte" as preferring abbreviated room descriptions.
Understand "verbose" or "long" or "lang" or "lange" as preferring unabbreviated room descriptions.
Understand "brief" or "normal" or "normale" as preferring sometimes abbreviated room descriptions.
Understand "pronomen", "pronominer", "pronomener" or "stedord" as requesting the pronoun meanings.
Understand "notify" or "notify on" or "meddelelser" or "meddelelser til" as switching score notification on.
Understand "notify off" or "meddelelser fra" as switching score notification off.

@h Dialogue-related grammar.

Note: This section is commented out as of December 2025, as //DialogueKit -> https://ganelson.github.io/inform/DialogueKit//
doesn't compile for me yet.

= (text as code)
Section 2 - Dialogue-related grammar (for dialogue language element only) (in place of Section 2 - Dialogue-related grammar in Standard Rules by Graham Nelson)

Understand "spørg om [concept]" as talking about.
Understand "spørg om [visible thing]" as talking about.
Understand "tal om [concept]" as talking about.
Understand "tal om [visible thing]" as talking about.
Understand "snak om [concept]" as talking about.
Understand "snak om [visible thing]" as talking about.