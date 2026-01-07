Responses.

To replace the Default Responses with Danish versions.

@ Based on Default Responses Template by Drew Cook: https://kamin3ko.itch.io/default-reponses-template
=
Volume - Default Responses

@h Parser errors related to NPCs.
=
Section 1 (parser errors related to NPCs)

@ This happens when an NPC is asked to do something, but no persuasion rule is set.
=
The requested actions require persuasion rule response (A) is "[Substantivet] [har] bedre ting at gøre.".

@ A generic, all-encompassing response when an NPC is asked to do something that is impossible or blocked: "bob, eat [something inedible]".
=
The carry out requested actions rule response (A) is "[Substantivet] [er] ute af stand til at gøre det.".

@ This happens when an NPC is asked to perform an out of world action. "bob, save"
=
The action processing internal rule response (A) is "[bracket]Den kommando beder om at gøre noget uden for spillet, så den kan kun give mening fra dig til mig. [Substantivet] kan ikke bedes om at gøre dette.[close bracket]".

@ This is the equivalent to "I don't understand that sentence," only it prints when giving instructions to an NPC. "Bob, put key adfakjhgkasdjf" for instance.
=
The action processing internal rule response (K) is "Jeg forstod ikke den instruktion.".

@h General parser error messages.
=
Section 2 (general parser error messages)

@ Despite appearances, these seem to appear because of incomplete or flawed code. they are not really player feedback. the cause is when an action or command is incompletely remapped. For instance:
	
>> understand "grab" as taking

occurs when an "understand" phrase does not include a token for the thing to be acted upon or a rule for handling the missing noun. Typing "grab" alone on a command line will return a "you must supply a noun" message. Customize these if you wish, but the problem isn't the message, it's the code.

I'm not completely clear on the method for triggering C, E, G, and I since adding extra nouns/objects to understand phrases results in compile errors.

See 18.32 in the docs, "supplying a missing noun."
=
The action processing internal rule response (B) is "Du skal navngive en genstand.".
The action processing internal rule response (C) is "Du må ikke navngive en genstand.".
The action processing internal rule response (D) is "Du skal angive et navneord.".
The action processing internal rule response (E) is "Du må ikke angive et substantiv.".
The action processing internal rule response (F) is "Du skal navngive en anden genstand.".
The action processing internal rule response (G) is "Du må ikke navngive en anden genstand.".
The action processing internal rule response (H) is "Du skal angive et andet navneord.".
The action processing internal rule response (I) is "Du må ikke angive et andet navneord.".

@ If you have something happen that makes a command invalid, this will fire. Very rare. For instance, if the player types "take all" but your project includes...

>> after taking the lamp:
>>     move the player to the closet.
	
...the "take all" has been disrupted.

=
The action processing internal rule response (J) is "(Da der er sket noget dramatisk, er din liste over kommandoer blevet forkortet.)".

@ incomplete command with gibberish for a second noun.

"put me alskdjfh"
=
The parser error internal rule response (A) is "Jeg forstod ikke den sætning.".

@ adding gibberish after a command applying to one thing. Note that it's going to print part of the player's command, so the format is important.

"examine me alsdkjh"

Note also that this response normally prints out the command as written, but we want to print out the infinitive.
That's handled elsewhere. [ TODO PrintCommand ]

Also, if you write "examine me foo", the response will be "I only understood you as far as wanting to examine yourself",
which is fine. But if the story viewpoint is third person singular, for example, it will be "examine himself", which is
weird and doesn't work in Danish. We don't want the reflexive pronoun here.
=
The parser error internal rule response (B) is "Jeg forstod dig kun i den grad, at du ville ". [ TODO infinitive ]

@ adding gibberish after an "inferred" go command. format should be preserved

"south adskljh"
=
The parser error internal rule response (C) is "Jeg forstod dig kun i den grad, at du ville (gå) mod ".

@ the command requires a number, but the player typed text or gibberish instead

"count to asdkfjl"
=
The parser error internal rule response (D) is "Jeg forstod ikke det tal.".

@ the most familiar of all these responses, perhaps. Prints when the player's command refers to a noun that is not visible or in scope. or else the noun (or a typo) does not exist anywhere in the game. Be careful with snark.
=
The parser error internal rule response (E) is "[Du] [kan] ikke se noget sådant.".

@ Very few actions allow multiple nouns or "all."
=
The parser error internal rule response (H) is "Du kan ikke bruge flere objekter med det verbum.".

@ using a pronoun when Inform 7 can't discern what it is referring to.

"examine her" when there is no "her" in the location
=
The parser error internal rule response (J) is "Jeg er ikke sikker på, hvem eller hvad [citat][pronoun i6 dictionary word][citat slut] refererer til.".

@ the last noun referred to is not in the current location, so Inform 7 doesn't understand the pronoun used

"examine him" after leaving the room
=
The parser error internal rule response (K) is "[Du] [kan] ikke se [pronoun i6 dictionary word] ([substantivet]) lige nu.".

@ attempting to do something that can only be done to things designated as applying to people only (in command grammar).

"kiss hat"
=
The parser error internal rule response (M) is "Det kan man kun gøre med noget levende.".

@ begin a command with something that is not a valid verb
=
The parser error internal rule response (N) is "Det er ikke et verbum jeg genkender.".

@ trying to do something to a specific number of a kind, but the number can't work (too high for instance)

"take three shoes" when there are only two shoes in the location.
=
The parser error internal rule response (Q) is "[if number understood is 0]Ingen[otherwise]Kun [number understood in words][end if] af de [regarding the number understood][er] tilgængelig[e].".

@ a kind is specified in command grammar, but the command is used for something else.

For instance:

understand "frob [any shoe]" as frobbing"

">frob hat"
=
The parser error internal rule response (R) is "Det navneord gav ikke mening i denne sammenhæng.".

@ what it says
=
The parser error internal rule response (T) is "Du kan ikke begynde med et komma.".

@ attempting to talk to someone who is not in the room: "bob, jump" or "asdkluhasdfk, jump"
=	
The parser error internal rule response (U) is "Det virker som, at du ønsker at tale med nogen, men jeg kan ikke se hvem.".

@ talking to a thing that isn't a person
=
The parser error internal rule response (V) is "Du kan ikke tale med [substantivet].".

@ add something after the addressed person but before the comma in a "person, [action]" construction,

"bob asldkf, jump"
=
The parser error internal rule response (W) is "For at tale til nogen, prøv [citat]nogen, hej[citat slut] eller noget i den stil.".

@ enter an empty (blank) command
=
The parser error internal rule response (X) is "Hvad behager?".

@ some cases of specifying "all" in a command when there are no matching nouns

"put all in chest" when the player is not carrying anything
=
The parser nothing error internal rule response (B) is "[Der] [er] intet tilgængeligt!".

@ this error is triggered when attempting to take all from something that is not carrying anything.
=
The parser nothing error internal rule response (C) is "[Substantivet] [har] intet.".

@ putting things in something that is is not a container

"put coin in sword"
=
The parser nothing error internal rule response (D) is "[om substantivet][De] [kan] ikke indeholde noget.".

@ trying to take something from a closed opaque container, whether there's anything there or not. Alternately, trying to take all from an empty transparent container, because there's nothing there to create a "can't reach into containers" message. Trust me! If you want to account for both transparent and opaque contaienrs, here's an example with conditional text.
=
The parser nothing error internal rule response (E) is "[Substantivet][if the noun is transparent] [er] åbenbart [tom][otherwise] [er] ikke [åben][end if].".

@ Different from the examine and search containers rules below. Instead, applies to things like

"get all from chest" when chest is empty.
=
The parser nothing error internal rule response (F) is "[Substantivet] [er] [tomt].".

@ the printed name of a dark room. affects the status line only, not the room description
=
The darkness name internal rule response (A) is "Mørke".

@ attempting to correct something with "OOPS" when the command is fine, the correction is not allowed (out of world commands for instance, or the correction is wrong)

"oops take" or "oops save" or "oops asdlkjh"
=
The parser command internal rule response (A) is "Beklager, det kan ikke korrigeres.".

@ triggered by typing "oops" by itself at the command prompt without any corrected text.
=
The parser command internal rule response (B) is "Pyt, alt i orden.".

@ exactly as stated

"oops take ball"
=
The parser command internal rule response (C) is "[citat]Ups[citat slut] kan kun korrigere et enkelt ord.".

@ using the again command on the first turn of a game. restoring a save should not have this effect since saves contain previous command information
=
The parser command internal rule response (D) is "Du kan ikke gentage det.".

@ a disambiguation question for commands that are directed to a person.

"person, jump" or "take person" when there is more than one person in the room.
=
The parser clarification internal rule response (A) is "Hvem mener du, ".

@ a very familiar disambiguation question. You can handle this with a rule instead, as in "rule for asking which do you mean:"
=
The parser clarification internal rule response (B) is "Hvilken mener du, ".

@ using "all" in certain disambiguation answers when multiple nouns are not permitted, i.e."

>x shoe
Which do you mean, the sneaker or heel?

>all
Sorry, you can only have one item here. Which exactly?

also note that this appears to be missing a line break, so I've added one.
=
The parser clarification internal rule response (C) is "Beklager, du kan kun have én ting her. Præcis hvilken mener du?[line break]".

@ a slightly different variant of the who do you mean question. The most obvious diffence is "whom" as opposed to "who." It is triggered when command grammar specifies a person."

"kiss person" will trigger this response, but "examine person" will trigger parser clarification internal rule response (A).

TODO: Hack to get infinitive command. Will probably fail in many cases!
=
The parser clarification internal rule response (D) is "Hvem ønsker du at [if the noun is not the player][substantivet] skal [end if][parser command so far]e?".

@ applies when there is not enough information to ask a which do you mean question

"take" in a room full of things.

TODO: Hack to get infinitive command. Will probably fail in many cases!
=
The parser clarification internal rule response (E) is "Hvad ønsker du at [if the noun is not the player][substantivet] skal [end if][parser command so far]e?".

@ text printed for an "if the player consents phrase".
=
The yes or no question internal rule response (A) is "Venligst svar ja eller nej.".

@ built in addition for explicit taking, i.e. "wear shirt" when the shirt isn't held by the player.
=
The standard implicit taking rule response (A) is "(efter at have taget [substantivet])[command clarification break]".

@ implicit taking when persuading an NPC, ie "janet, wear shirt".
=
The standard implicit taking rule response (B) is "(efter at [the second noun] først haver taget [substantivet])[command clarification break]".

@ better to use "end the story saying "something"".
=
The print obituary headline rule response (C) is " Slut ".


@h Out of world and meta.
=
Section 3 (out of world and meta)

@ only happens if you declare "use undo prevention" in your project.
=
The immediately undo rule response (A) is "At fortryde er forbudt i denne historie.".

@ using "undo" at the beginning of a game.
=
The immediately undo rule response (B) is "Du kan ikke fortryde det, der ikke er sket endnu!".

@ hopefully this never comes up, unless the project targets retro systems with limited resources. perhaps not even then. I'm not aware of a specific interpreter with this limitation, especially not one capable of running Glulx games.
=
The immediately undo rule response (C) is "Din fortolker understøtter ikke [citat]fortryd[citat slut]. Beklager!".

@ standard Undo response. If you want more control over undo behavior, I recommend the extension "undo output control" by nathanael nerode.
=
The immediately undo rule response (E) is "[bracket]Forrige træk fortrudt.[close bracket]".

@ the undo stack is held in memory, and the number of turns that can be undone will vary according to computing conditions. but once you're out, you're out.
=
The immediately undo rule response (F) is "[citat]Fortryd[citat slut]-kapacitet udtømt. Beklager!".

@ standard responses based on starting stopping etc
=
The quit the game rule response (A) is "Er du sikker på, at du vil afslutte? ".
The save the game rule response (A) is "Gemning mislykkedes.".
The save the game rule response (B) is "Ok.".
The restore the game rule response (A) is "Hentning mislykkedes.".
The restore the game rule response (B) is "Ok.".
The restart the game rule response (A) is "Er du sikker på, at du vil genstarte? ".
The restart the game rule response (B) is "Mislykkedes.".
The verify the story file rule response (A) is "The game file has verified as intact.".
The verify the story file rule response (B) is "The game file did not verify as intact, and may be corrupt.".
The switch the story transcript on rule response (A) is "Transcripting is already on.".
The switch the story transcript on rule response (B) is "Start of a transcript of:".
The switch the story transcript on rule response (C) is "Attempt to begin transcript failed.".
The switch the story transcript off rule response (A) is "Transcripting is already off.".
The switch the story transcript off rule response (B) is "[line break]End of transcript.".
The switch the story transcript off rule response (C) is "Attempt to end transcript failed.".

@ changing room description preferences. rarely used these days.
=
The standard report preferring abbreviated room descriptions rule response (A) is " er nu i [citat]superkort[citat slut]-tilstand, som altid giver korte beskrivelser af steder (selv hvis du ikke har været der før).".
The standard report preferring unabbreviated room descriptions rule response (A) is " er nu i [citat]udførlig[citat slut]-tilstand, som altid giver lange beskrivelser af steder (selv hvis du har været der før).".
The standard report preferring sometimes abbreviated room descriptions rule response (A) is " er nu i [citat]kort[citat slut]-tilstand, som giver lange beskrivelser af steder du ikke har besøgt før, og korte beskrivelser ellers.".

@ pertaining to endings and final questions
=
The print the final prompt rule response (A) is "> [run paragraph on]".
The print the final question rule response (A) is "Ønsker du at ".
The print the final question rule response (B) is " eller ".
The standard respond to final question rule response (A) is "Venligst giv et af svarene ovenfor.".

@h Scoring.
=
Section 4 (scoring)

The announce the score rule response (A) is "[if the story has ended]In that game you scored[otherwise]You have so far scored[end if] [score] out of a possible [maximum score], in [turn count] turn[s]".
The announce the score rule response (B) is ", earning you the rank of ".
The announce the score rule response (C) is "[Der] [er] ingen points i denne historie.".
The announce the score rule response (D) is "[bracket]Your score has just gone up by [number understood in words] point[s].[close bracket]".
The announce the score rule response (E) is "[bracket]Your score has just gone down by [number understood in words] point[s].[close bracket]".
The standard report switching score notification on rule response (A) is "Score notification on.".
The standard report switching score notification off rule response (A) is "Score notification off.".

@h Descriptions and appearances.
=
Section 5 (descriptions and appearances)

@ when we have asserted an "initial appearance" for something, it will get its own paragraph in the room description. other litems will be listed, constructed from A through F
=
The you-can-also-see rule response (A) is "[Du] [kan] ".
The you-can-also-see rule response (B) is "På [the domain] [kan] [du] ".
The you-can-also-see rule response (C) is "I [the domain] [kan] [du] ".
The you-can-also-see rule response (D) is "også se ".
The you-can-also-see rule response (E) is "se ".
The you-can-also-see rule response (F) is " [her]".

@ used for listing contents of supporters in room descriptions
=
The use initial appearance in room descriptions rule response (A) is "På [the item] ".
The describe what's on scenery supporters in room descriptions rule response (A) is "På [the item] ".
The describe what's on mentioned supporters in room descriptions rule response (A) is "På [the item] ".

@ unlike The darkness name internal rule response (A), this prints as a room name while looking, but doesn't change the status bar
=
The room description heading rule response (A) is "Mørke".

@ room description of a dark room
=
The room description body text rule response (A) is "[Det] [er] bælgmørkt, og [du] [kan] ikke se noget.".

@ prints when a player is in or on an enterable container / supporter]
=
The room description heading rule response (B) is " (på [the intermediate level])".
The room description heading rule response (C) is " (indeni [the intermediate level])".

@h Looking, examining and searching.
=
Section 6 (looking, examining, and searching)

The other people looking rule response (A) is "[The actor] [ser] [dig selv] omkring.". [ TODO reflexive pronoun ]
The examine directions rule response (A) is "[Du] [ser] intet uventet i den retning.".
The examine containers rule response (A) is "I [substantivet] ".
The examine containers rule response (B) is "[Substantivet] [er] [tomme].".
The examine supporters rule response (A) is "På [substantivet] ".
The examine devices rule response (A) is "[Substantivet] [er] [if story tense is present tense]i øjeblikket [end if] [if the noun is switched on]tændt[otherwise]slukket[end if].".
The examine undescribed things rule response (A) is "[Du] [ser] intet særligt ved [substantivet].".
The report other people examining rule response (A) is "[The actor] [kigger] nøje på [substantivet].".
The standard looking under rule response (A) is "[Du] [finder] intet af interesse.".
The report other people looking under rule response (A) is "[The actor] [kigger] under [substantivet].".
The can't search unless container or supporter rule response (A) is "[Du] [finder] intet af interesse.".
The can't search closed opaque containers rule response (A) is "[Du] [kan] ikke se indeni, da [substantivet] [er] lukket.".
The standard search containers rule response (A) is "I [substantivet] ".
The standard search containers rule response (B) is "[Substantivet] [er] [tom].".
The standard search supporters rule response (A) is "På [substantivet] ".
The standard search supporters rule response (B) is "[Der] [er] intet på [substantivet].".
The report other people searching rule response (A) is "[The actor] [kigger] i [substantivet].".

@ consulting involves checking a noun for a topic, ie looking something up in an encyclopedia.
=
The block consulting rule response (A) is "[Du] [finder] intet af interesse i [substantivet].".
The block consulting rule response (B) is "[The actor] [kigger] på [substantivet].".

@h Inventory.
=
Section 7 (inventory)

The print empty inventory rule response (A) is "[Du] [bærer] ingenting.".
The print standard inventory rule response (A) is "[Du] [bærer]:[line break]".
The report other people taking inventory rule response (A) is "[The actor] [kigger] gennem [sine] ejendele.". [ TODO reflexive pronoun ]
@h Taking, dropping, inserting, putting.
=
Section 8 (taking, dropping, inserting, putting)

@ the rule names here are happily comprehensible. some are high-risk in my opinion, so test thoroughly. Note as always that container and supporter responses are scattered everywhere, so take care to be consistent while changing those.
=
The can't take yourself rule response (A) is "[Du] [er] altid selvbevidste.".
The can't take other people rule response (A) is "Jeg tror ikke, [substantivet] [vil] lide det.".
The can't take component parts rule response (A) is "[om substantivet][De] [virker] at være en del af [the whole].".

[ IMPORTANT: This rule only applies to TAKING things that are held by NPCs. REMOVING things, or TAKING things FROM is a separate action that has its own ruleset. Those cases are generally covered by the The can't remove from people rule response (A). If the NPC is not holding anything, a parser error is generated instead: the parser nothing error internal rule response (C).]

The can't take people's possessions rule response (A) is "[om substantivet][De] [virker] at høre til [the owner].".
[ The can't take items out of play rule response (A) is "[om substantivet][Those] [aren't] available.".] [ TODO has been removed ]
The can't take what you're inside rule response (A) is "[Du] [vil] måtte gå [if noun is a supporter]af[otherwise]ud af[end if] [substantivet] først.".
The can't take what's already taken rule response (A) is "[Du] [har] [om substantivet][dem] allerede.".
The can't take scenery rule response (A) is "[om substantivet][De] [er] næppe bærbar[e].".
[ The can only take things rule response (A) is "[We] [cannot] carry [the noun].".] [ TODO has been removed ]
The can't take what's fixed in place rule response (A) is "[om substantivet][De] [er] ikke til at flytte.".
The use player's holdall to avoid exceeding carrying capacity rule response (A) is "(efter at have puttet [the transferred item] indeni [the current working sack] for at skabe plads)[command clarification break]".
The can't exceed carrying capacity rule response (A) is "[Du] [bærer] allerede for mange ting.".
The standard report taking rule response (A) is "Taget.".
The standard report taking rule response (B) is "[The actor] [samler] op [substantivet].".
The can't remove what's not inside rule response (A) is "Men [om substantivet][de] [er] der ikke [nu].".

[ IMPORTANT: This rule only applies to REMOVING (or TAKING) things FROM NPCs. TAKING things that are held by an NPC involves a separate action that has its own ruleset. Those cases are generally covered by the The can't take people's possessions rule response (A). If the NPC is not holding anything, a parser error is generated instead: the parser nothing error internal rule response (C).]

The can't remove from people rule response (A) is "[om substantivet][De] [virker] at høre til [the owner].".
The can't drop yourself rule response (A) is "[Du] [mangler] fingerfærdigheden.".
The can't drop body parts rule response (A) is "[Du] [kan] ikke smide en del af [dig selv] selv.". [ TODO reflexive pronoun ]
The can't drop what's already dropped rule response (A) is "[Substantivet] [er] allerede her.".
The can't drop what's not held rule response (A) is "[Du] [har] ikke [om substantivet][dem].".
The can't drop clothes being worn rule response (A) is "(efter at have taget [substantivet] af)[command clarification break]".
The can't drop if this exceeds carrying capacity rule response (A) is "[Der] [er] ikke mere plads på [the receptacle].".
The can't drop if this exceeds carrying capacity rule response (B) is "[Der] [er] ikke mere plads i [the receptacle].".
The standard report dropping rule response (A) is "Smidt.".
The standard report dropping rule response (B) is "[The actor] [lægger] ned [substantivet].".
The can't put something on itself rule response (A) is "[Du] [kan] ikke lægge noget ovenpå sig selv.".
The can't put onto what's not a supporter rule response (A) is "At lægge ting på [det andet substantiv] [vil] ikke opnå noget.".
The can't put clothes being worn rule response (A) is "(efter at have taget [om substantivet][dem] af)[command clarification break]".
The can't put if this exceeds carrying capacity rule response (A) is "[Der] [er] ikke mere plads på [det andet substantiv].".
The concise report putting rule response (A) is "Gjort.".
The standard report putting rule response (A) is "[The actor] [lægger] [substantivet] på [det andet substantiv].".
The can't insert what's already inserted rule response (A) is "[Substantivet] [er] allerede der.".
The can't insert something into itself rule response (A) is "[Du] [kan] ikke lægge noget indeni sig selv.".
The can't insert into closed containers rule response (A) is "[Det andet substantiv] [er] lukket.".
The can't insert into what's not a container rule response (A) is "[regarding the second noun][De] [kan] ikke indeholde ting.".
The can't insert clothes being worn rule response (A) is "(efter at have taget [om substantivet][dem] af)[command clarification break]".
The can't insert if this exceeds carrying capacity rule response (A) is "[Der] [er] ikke mere plads i [det andet substantiv].".
The concise report inserting rule response (A) is "Gjort.".
The standard report inserting rule response (A) is "[The actor] [lægger] [substantivet] ind i [det andet substantiv].".

@h Going and traversal.
=
Section 9 (going and traversal)

The block vaguely going rule response (A) is "Du bliver nødt til at sige, hvilken kompasretning du vil gå.".
The stand up before going rule response (A) is "(efter at have rejst sig fra [the chaise])[command clarification break]".
The can't travel in what's not a vehicle rule response (A) is "[Du] [vil] måtte gå af [the nonvehicle] først.".
The can't travel in what's not a vehicle rule response (B) is "[Du] [vil] måtte gå ud af [the nonvehicle] først.".
The can't go through undescribed doors rule response (A) is "[Du] [kan] ikke gå den vej.".
The can't go through closed doors rule response (A) is "(efter at have åbnet [the door gone through])[command clarification break]".
The can't go that way rule response (A) is "[Du] [kan] ikke gå den vej.".
The can't go that way rule response (B) is "[Du] [kan] ikke, for [the door gone through] [fører] ingen steder hen.".
The describe room gone into rule response (A) is "[The actor] [går] op".
The describe room gone into rule response (B) is "[The actor] [går] ned".
The describe room gone into rule response (C) is "[The actor] [går] [noun]".
The describe room gone into rule response (D) is "[The actor] [ankommer] ovenfra".
The describe room gone into rule response (E) is "[The actor] [ankommer] nedenfra".
The describe room gone into rule response (F) is "[The actor] [ankommer] fra [the back way]".
The describe room gone into rule response (G) is "[The actor] [ankommer]".
The describe room gone into rule response (H) is "[The actor] [ankommer] til [the room gone to] ovenfra".
The describe room gone into rule response (I) is "[The actor] [ankommer] til [the room gone to] nedenfra".
The describe room gone into rule response (J) is "[The actor] [ankommer] til [the room gone to] fra [the back way]".
The describe room gone into rule response (K) is "[The actor] [går] gennem [the noun]".
The describe room gone into rule response (L) is "[The actor] [ankommer] fra [the noun]".
The describe room gone into rule response (M) is "på [the vehicle gone by]".
The describe room gone into rule response (N) is "i [the vehicle gone by]".
The describe room gone into rule response (O) is ", mens [de] [skubber] [the thing gone with] foran, og [dig] med også". [ TODO: check if "[de]" is correct here]
The describe room gone into rule response (P) is ", mens [de] [skubber] [the thing gone with] foran".
The describe room gone into rule response (Q) is ", mens [de] [skubber] [the thing gone with] væk".
The describe room gone into rule response (R) is ", mens [de] [skubber] [the thing gone with] ind".
The describe room gone into rule response (S) is ", og [tager] [dig] med".
The can't enter what's already entered rule response (A) is "Men [du] [er] allerede på [substantivet].".
The can't enter what's already entered rule response (B) is "Men [du] [er] allerede i [substantivet].".
The can't enter what's not enterable rule response (A) is "[om substantivet][De] [er] ikke noget [du] [kan] stå på.".
The can't enter what's not enterable rule response (B) is "[om substantivet][De] [er] ikke noget [du] [kan] sidde på.".
The can't enter what's not enterable rule response (C) is "[om substantivet][De] [er] ikke noget [du] [kan] ligge på.".
The can't enter what's not enterable rule response (D) is "[om substantivet][De] [er] ikke noget [du] [kan] gå ind i.".
The can't enter closed containers rule response (A) is "[Du] [kan] ikke gå ind i [om substantivet][dem] lukkede [noun].". [ TODO fix article? ]
The can't enter if this exceeds carrying capacity rule response (A) is "[Der] [er] ikke mere plads på [substantivet].".
The can't enter if this exceeds carrying capacity rule response (B) is "[Der] [er] ikke mere plads i [substantivet].".
The can't enter something carried rule response (A) is "[Du] [kan] kun komme ind i noget, der står frit.".
The implicitly pass through other barriers rule response (A) is "(efter at have gået af [the current home])[command clarification break]".
The implicitly pass through other barriers rule response (B) is "(efter at have gået ud af [the current home])[command clarification break]".
The implicitly pass through other barriers rule response (C) is "(efter at have gået på [the target])[command clarification break]".
The implicitly pass through other barriers rule response (D) is "(efter at have gået ind i [the target])[command clarification break]".
The implicitly pass through other barriers rule response (E) is "(efter at have gået ind i [the target])[command clarification break]".
The standard report entering rule response (A) is "[Du] [kommer] op på [substantivet].".
The standard report entering rule response (B) is "[Du] [kommer] ind i [substantivet].".
The standard report entering rule response (C) is "[The actor] [kommer] ind i [substantivet].".
The standard report entering rule response (D) is "[The actor] [kommer] op på [substantivet].".
The can't exit when not inside anything rule response (A) is "Men [du] [er] ikke i noget [if story tense is present tense]i øjeblikket[otherwise]på tidspunktet[end if].".
The can't exit closed containers rule response (A) is "[Du] [kan] ikke komme ud af [om substantivet][dem] lukkede [substantivet].".
The standard report exiting rule response (A) is "[Du] [går] af [the container exited from].".
The standard report exiting rule response (B) is "[Du] [går] ud af [the container exited from].".
The standard report exiting rule response (C) is "[The actor] [går] ud af [the container exited from].".
The can't get off things rule response (A) is "Men [du] [er] ikke på [substantivet] [if story tense is present tense]lige nu[otherwise]på tidspunktet[end if].".
The standard report getting off rule response (A) is "[The actor] [går] af [substantivet].".

@h Locks and locking.
=
Section 10 (locks and locking)

The can't lock without a lock rule response (A) is "[om substantivet][De] [ser] ikke ud til at være noget, [du] [kan] låse.".
The can't lock what's already locked rule response (A) is "[om substantivet][De] [er] låst [if story tense is present tense]i øjeblikket[otherwise]på tidspunktet[end if].".
The can't lock what's open rule response (A) is "Først [skal] [du] lukke [substantivet].".
The can't lock without the correct key rule response (A) is "[regarding the second noun][De] [ser] ikke ud til at passe til låsen.".
The standard report locking rule response (A) is "[Du] [låser] [substantivet].".
The standard report locking rule response (B) is "[The actor] [låser] [substantivet].".
The can't unlock without a lock rule response (A) is "[om substantivet][De] [ser] ikke ud til at være noget, [du] [kan] låse op.".
The can't unlock what's already unlocked rule response (A) is "[om substantivet][De] [er] ulåst [if story tense is present tense]i øjeblikket[otherwise]på tidspunktet[end if].".
The can't unlock without the correct key rule response (A) is "[regarding the second noun][De] [ser] ikke ud til at passe til låsen.".
The standard report unlocking rule response (A) is "[Du] [låser] op [substantivet].".
The standard report unlocking rule response (B) is "[The actor] [låser] op [substantivet].".
@h Devices.
=
Section 11 (devices)

The can't switch on unless switchable rule response (A) is "[om substantivet][De] [er] ikke noget, [du] [kan] tænde.".
The can't switch on what's already on rule response (A) is "[om substantivet][De] [er] allerede tændt.".
The standard report switching on rule response (A) is "[The actor] [tænder] [substantivet].".
The can't switch off unless switchable rule response (A) is "[om substantivet][De] [er] ikke noget, [du] [kan] slukke.".
The can't switch off what's already off rule response (A) is "[om substantivet][De] [er] allerede slukket.".
The standard report switching off rule response (A) is "[The actor] [slukker] [substantivet].".

@h Opening and closing.
=
Section 12 (opening and closing)

The can't open unless openable rule response (A) is "[om substantivet][De] [er] ikke noget, [du] [kan] åbne.".
The can't open what's already open rule response (A) is "[om substantivet][De] [er] allerede åbne.".
The can't open what's locked rule response (A) is "[om substantivet][De] [ser] ud til at være låst.".

[ opening an opaque container that contains something]

The reveal any newly visible interior rule response (A) is "[Du] [åbner] [substantivet] og afdækker ".

The standard report opening rule response (A) is "[Du] [åbner] [substantivet].".
The standard report opening rule response (B) is "[The actor] [åbner] [substantivet].".
The can't close unless openable rule response (A) is "[om substantivet][De] [er] ikke noget, [du] [kan] lukke.".
The can't close what's already closed rule response (A) is "[om substantivet][De] [er] allerede lukke[t-de].".
The standard report closing rule response (A) is "[Du] [lukker] [substantivet].".
The standard report closing rule response (B) is "[The actor] [lukker] [substantivet].".

@h Wearing and taking off.
=
Section 13 (wearing and taking off)

The can't wear what's not clothing rule response (A) is "[Du] [kan] ikke tage [om substantivet][dem] på!".
[ The can't wear what's not held rule response (A) is "[Du] [holder] [om substantivet][dem] ikke!". ] [ TODO removed in 10.2? ]
The can't wear what's already worn rule response (A) is "[Du] [har] allerede [om substantivet][dem] på.".
The standard report wearing rule response (A) is "[Du] [tager] [substantivet] på.".
The standard report wearing rule response (B) is "[The actor] [tager] [substantivet] på.".
The can't take off what's not worn rule response (A) is "[Du] [har] ikke [substantivet] på.".
The can't exceed carrying capacity when taking off rule response (A) is "[Du] [bærer] for mange ting allerede.".
The standard report taking off rule response (A) is "[Du] [tager] [substantivet] af.".
The standard report taking off rule response (B) is "[The actor] [tager] [substantivet] af.".
The implicitly remove thrown clothing rule response (A) is "(efter at have taget [substantivet] af)[command clarification break]".

@h Giving.
=
Section 14 (giving)

[ The can't give what you haven't got rule response (A) is "[We] [aren't] holding [the noun].".] [TODO removed in 10.2]
The can't give to yourself rule response (A) is "[Du] [kan] ikke give [substantivet] til [dig selv] selv.". [ TODO reflexive pronoun ]
The can't give to a non-person rule response (A) is "[The second noun] [kan] ikke modtage ting.".
The can't give clothes being worn rule response (A) is "(efter at have taget [substantivet] af)[command clarification break]".
The block giving rule response (A) is "[Det andet substantiv] [virker] ikke interesseret.".
The can't exceed carrying capacity when giving rule response (A) is "[Det andet substantiv] [bærer] for mange ting allerede.".
The standard report giving rule response (A) is "[Du] [giver] [substantivet] til [det andet substantiv].".
The standard report giving rule response (B) is "[The actor] [giver] [substantivet] til [dig].".
The standard report giving rule response (C) is "[The actor] [giver] [substantivet] til [det andet substantiv].".
[ The can't show what you haven't got rule response (A) is "[We] [aren't] holding [the noun].".] [TODO removed in 10.2]

@h Manipulating objects.
=
Section 15 (manipulating objects)

The can't pull what's fixed in place rule response (A) is "[om substantivet][De] [er] ikke til at flytte.".
The can't pull scenery rule response (A) is "[Du] [kan] ikke.".
The can't pull people rule response (A) is "[Substantivet] [kan] måske ikke lide det.".
The report pulling rule response (A) is "Intet åbenbart [sker].".
The report pulling rule response (B) is "[The actor] [trækker] [substantivet].".
The can't push what's fixed in place rule response (A) is "[om substantivet][De] [er] ikke til at flytte.".
The can't push scenery rule response (A) is "[Du] [kan] ikke.".
The can't push people rule response (A) is "[Substantivet] [kan] måske ikke lide det.".
The report pushing rule response (A) is "Intet åbenbart [sker].".
The report pushing rule response (B) is "[The actor] [skubber] [substantivet].".
The can't turn what's fixed in place rule response (A) is "[om substantivet][De] [er] ikke til at flytte.".
The can't turn scenery rule response (A) is "[Du] [kan] ikke.".
The can't turn people rule response (A) is "[Substantivet] [kan] måske ikke lide det.".
The report turning rule response (A) is "Intet åbenbart [sker].".
The report turning rule response (B) is "[The actor] [drejer] [substantivet].".
The can't push unpushable things rule response (A) is "[Substantivet] [kan] ikke  skubbes fra sted til sted.".
The can't push to non-directions rule response (A) is "[om substantivet][De] [er] ikke en retning.".
The can't push vertically rule response (A) is "[Substantivet] [kan] ikke skubbes op eller ned.".
The can't push from within rule response (A) is "[Substantivet] [kan] ikke skubbes herfra.".
The block pushing in directions rule response (A) is "[Substantivet] [kan] ikke skubbes fra sted til sted.".

@h Blocked actions and generic responses.
=
Section 16 (blocked actions and generic responses)

The block showing rule response (A) is "[The second noun] [er] ikke imponeret.".
The block waking rule response (A) is "Det [virker] unødvendigt.".
The futile to throw things at inanimate objects rule response (A) is "Nytteløst.".
The block throwing at rule response (A) is "[Du] [mangler] modet når det [kommer] til stykket."
The block attacking rule response (A) is "Vold [er] ikke svaret på dette.".
The kissing yourself rule response (A) is "[Du] [får] ikke meget ud af det.".
The block kissing rule response (A) is "[The noun] [kan] måske ikke lide det.".
The standard report waiting rule response (A) is "Tiden [går].".
The standard report waiting rule response (B) is "[The actor] [venter].".
The report touching yourself rule response (A) is "[Du] [opnår] ikke noget ved dette.".
The report touching yourself rule response (B) is "[The actor] [rører] ved [dig selv] selv.". [ TODO proper reflexive? ]
The report touching other people rule response (A) is "[Substantivet] [kan] måske ikke lide det.".
The report touching other people rule response (B) is "[The actor] [rører] ved [dig].".
The report touching other people rule response (C) is "[The actor] [rører] ved [substantivet].".
The report touching things rule response (A) is "[Du] [føler] intet uventet.".
The report touching things rule response (B) is "[The actor] [rører] ved [substantivet].".
The can't wave what's not held rule response (A) is "Men [du] [bærer] [om substantivet][dem] ikke.".
The report waving things rule response (A) is "[Du] [vifter] med [substantivet].".
The report waving things rule response (B) is "[The actor] [vifter] med [substantivet].".
The innuendo about squeezing people rule response (A) is "[Substantivet] [kan] måske ikke lide det.".
The report squeezing rule response (A) is "[Du] [opnår] ikke noget ved dette.".
The report squeezing rule response (B) is "[The actor] [klemmer] [substantivet].".
The block burning rule response (A) is "Dette farlige forsøg [vil] ikke opnå meget.".
The block waking up rule response (A) is "Den frygtelige sandhed [er], at dette [er] ingen drøm.".
The block thinking rule response (A) is "Hvilken god idé.".
The report smelling rule response (A) is "[Du] [lugter] intet uventet.".
The report smelling rule response (B) is "[The actor] [snuser].".
The report listening rule response (A) is "[Du] [hører] intet uventet.".
The report listening rule response (B) is "[The actor] [lytter].".
The report tasting rule response (A) is "[Du] [smager] intet uventet.".
The report tasting rule response (B) is "[The actor] [smager] på [substantivet].".
The block cutting rule response (A) is "At skære [om substantivet][dem] op [vil] ikke opnå meget.".
The report jumping rule response (A) is "[Du] [hopper] på stedet.".
The report jumping rule response (B) is "[The actor] [hopper] på stedet.".
The block tying rule response (A) is "[Du] [vil] ikke opnå noget ved dette.".
The block drinking rule response (A) is "[Der] er intet egnet at drikke her.".
The block saying sorry rule response (A) is "Pyt, alt i orden.".
The block swinging rule response (A) is "[Der] er intet fornuftigt at svinge her.".
The can't rub another person rule response (A) is "[Substantivet] [kan] måske ikke lide det.".
The report rubbing rule response (A) is "[Du] [gnider] [substantivet].".
The report rubbing rule response (B) is "[The actor] [gnider] [substantivet].".
The block setting it to rule response (A) is "Nej, [du] [kan] ikke sætte [om substantivet][dem] til noget.".
The report waving hands rule response (A) is "[Du] [vinker].".
The report waving hands rule response (B) is "[The actor] [vinker].".
The block buying rule response (A) is "Intet [er] til salg.".
The block climbing rule response (A) is "Ikke meget [kan] opnås ved det.".
The block sleeping rule response (A) is "[Du] [føler] [dig] ikke særligt søvnig.".
The can't eat unless edible rule response (A) is "[om substantivet][De] [er] åbenbart ikke til at spise.".
The can't eat clothing without removing it first rule response (A) is "(efter at have taget [substantivet] af)[command clarification break]".
The can't eat other people's food rule response (A) is "[The owner] [kan] måske ikke lide det.".
The standard report eating rule response (A) is "[Du] [spiser] [substantivet]. Ikke dårligt.".
The standard report eating rule response (B) is "[The actor] [spiser] [substantivet].".

@h Communication.
=
Section 17 (communication)

The block answering rule response (A) is "[Der] [er] intet svar.".
The telling yourself rule response (A) is "[Du] [taler] lidt med [dig selv] selv.".
The block telling rule response (A) is "Dette [provokerer] ingen reaktion.".
The block asking rule response (A) is "[Der] [er] intet svar.".
The block saying yes rule response (A) is "Det var et retorisk spørgsmål.".
The block saying no rule response (A) is "Det var et retorisk spørgsmål.".

@h Scope and visibility.
=
Chapter 9 (scope and visibility)

@ You probably will not want to do anything with these, unless you are experimenting with visibility and scope. And a lot of the time, the error isn't really related to the player, it's the result of some programming.

@ This is an errror message about darkness. It fires when the light is suddenly cut off.
=
The adjust light rule response (A) is "[Det] blev pludselight bælgmørkt [her]!".

@ this is what prints when attempting to interact with something that must be visible in a dark room
=
The basic visibility rule response (A) is "[Det] [er] bælgmørkt, og [du] [kan] ikke se noget.".

@ I've only triggered this one by trying to physically interact with a direction: "take south" for instance. Perhaps it could be applied to other nouns (a direction is a noun), but I've never seen it done. Note that you can circumvent this with a "before" rule, because visibility and accessibility are still mushy. For instance...

before climbing up:
	try going up instead.
	
...works, but...

instead of climbing up:
	try going up.
	
...doesn't, because "instead" happens too late in action processing.
=
The basic accessibility rule response (A) is "Du må nævne noget mere substantielt.".

@ This is a strange one. Most often it results from code rather than player action, for instance redirecting an action to a noun that isn't present
=
The access through barriers rule response (A) is "[om substantivet][De] [er] ikke tilgængelig[e].".

@ I believe this only prints when trying to manipulate an object inside (or from within) a closed, transparent container.

EXCEPTION: this is only true if there is something in the chest. Otherwise, the rather unhelpful parser nothing error internal rule response (E) will report that the empty, transparent container is empty. Be sure to check it as well!
=
The can't reach inside closed containers rule response (A) is "[Substantivet] [er] ikke åben[t].".
The can't reach outside closed containers rule response (A) is "[Substantivet] [er] ikke åben[t].".

@ this usually means you changed the scope of the player and they are trying to interact with something in another room. you'll have to disable the reach inside rooms rule if you want something different. note that this can cause really weird things to happen
=
The can't reach inside rooms rule response (A) is "[Du] [rækker] ikke ind i [substantivet].".

@h The list writer.
=
Section 10 (the list writer)

The list writer internal rule response (C) is " og ".
The list writer internal rule response (D) is "giver lys".
The list writer internal rule response (E) is "[lukket]".
The list writer internal rule response (F) is "[tom]".
The list writer internal rule response (G) is "[lukket] og [tom]".
The list writer internal rule response (H) is "[lukket] og giver lys".
The list writer internal rule response (I) is "[tom] og giver lys".
The list writer internal rule response (J) is "[lukket], [tom] og giver lys".
The list writer internal rule response (K) is "giver lys og bliver båret".
The list writer internal rule response (L) is "bliver båret".
The list writer internal rule response (M) is "[åben]".
The list writer internal rule response (N) is "[åben] men [tom]".
The list writer internal rule response (O) is "[lukket]".
The list writer internal rule response (P) is "[lukket] og låst".
The list writer internal rule response (Q) is "containing".
The list writer internal rule response (R) is "på [if the noun is a person]hvem[otherwise]hvilken[end if] ".
The list writer internal rule response (S) is ", på toppen af [if the noun is a person]hvem[otherwise]hvilken[end if] ".
The list writer internal rule response (T) is "i [if the noun is a person]hvem[otherwise]hvilken[end if] ".
The list writer internal rule response (U) is ", indeni [if the noun is a person]hvem[otherwise]hvilken[end if] ".
The list writer internal rule response (V) is "[regarding list writer internals][er]".
The list writer internal rule response (W) is "[regarding list writer internals][er] intet".
The list writer internal rule response (X) is "Intet".
The list writer internal rule response (Y) is "intet".

@
=
section 11 (caution is advised)

@ these are substitutions for other rule responses.
=
The parser clarification internal rule response (F) is "de ting".
The parser clarification internal rule response (G) is "som".
The parser clarification internal rule response (H) is " eller ".

@ Printed names for the protagonist.
=
The print protagonist internal rule response (A) is "[Du]".

@ Rule (B) here is "[ourselves]" in English, which
prints out different reflexive pronouns depending on the story viewpoint:
myself, himself, ourselves, etc. This is already awkward in English -- for
example, parser error internal rule response (B) works for certain viewpoints,
but for the third person singular it results in "I only understood you as
far as wanting to examine himself", which is strange. It's even stranger in
Danish, where the reflexive pronoun of all third person viewpoints is "sig".
So we just change this to use the oblique pronoun with "selv" tacked on
the end.
=
The print protagonist internal rule response (B) is "[dig] selv".

@ And here, the grammatical gender of "selv" is neuter, so the first and second
person possessives need to agree with that. For that we use "[regarding
nothing]", which sets the prior named object to be nothing, which is neuter.
=
The print protagonist internal rule response (C) is "[regarding nothing][dit] tidligere selv".

@ Pronoun lister (when typing "pronouns").
=
The announce the pronoun meanings rule response (A) is "Akkurat nu: ".
The announce the pronoun meanings rule response (B) is "betyder ".
The announce the pronoun meanings rule response (C) is "betyder ingenting".
The announce the pronoun meanings rule response (D) is "ingen stedord er kendte for spillet.".

@ lists items in commands applied to multiple things, i.e. "take all" or "put all in chest".
=
The announce items from multiple object lists rule response (A) is "[current item from the multiple object list]: [run paragraph on]".

@
=
chapter 99999999 (vestigal)

@
=
section 1 (confirmed)

The generate action rule response (A) is "(considering the first sixteen objects only)[command clarification break]".
The generate action rule response (B) is "Intet at gøre!".
The parser error internal rule response (F) is "You seem to have said too little!".
The parser error internal rule response (G) is "[Du] [bærer] det ikke!".
The parser error internal rule response (I) is "You can only use multiple objects once on a line.".
The parser error internal rule response (O) is "That's not something you need to refer to in the course of this game.".
The parser error internal rule response (P) is "I didn't understand the way that finished.".
The print obituary headline rule response (A) is " You have died ".
The print obituary headline rule response (B) is " You have won ".

@
=
section 2 (not sure how to trigger or if it's possible)

The parser nothing error internal rule response (A) is "Intet at gøre!".
The immediately undo rule response (D) is "'Undo' failed. Sorry!".

@ these seem to be a failsafe for something other than an actor closing or opening things.
=
The standard report opening rule response (C) is "[Substantivet] [åbner] sig.".
The standard report closing rule response (C) is "[Substantivet] [lukker] sig.".

@ Inform doesn't seem to mind excluding excluded things. Vestigal?
=
The parser error internal rule response (L) is "You excepted something not included anyway!".

@ I can't recreate this. Inform returns "There is no reply."
=
The parser error internal rule response (S) is "To repeat a command like 'frog, jump', just say 'again', not 'frog, again'.".
