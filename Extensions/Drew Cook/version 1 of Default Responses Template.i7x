version 1 of Default Responses Template by Drew Cook begins here.

[

This is a list of built-in responses, with explanations where needed.

To make adjustments, simply change the quoted text. Additional suggestions are below in the documentation section.

This isn't meant to be a replacement for or rework of Nathanael Nerode's "Neutral Standard Responses," which includes rewritten responses and some useful code besides. My aim is to 1) offer more explanations regarding the use and triggering of messages and 2) provide players an easy way to write their own messages.

I haven't yet decided to publish it. I don't think it does anything transformative, though so far as I know nobody has documentented methods for triggering every parser error.

]


section 1 (parser errors related to NPCs)


[this happens when an NPC is asked to do something, but no persuasion rule is set]

The requested actions require persuasion rule response (A) is "[The noun] [have] better things to do.".

[a generic, all-encompassing response when an NPC is asked to do something that is impossible or blocked: "bob, eat [something inedible]"]

The carry out requested actions rule response (A) is "[The noun] [are] unable to do that.".

[this happens when an NPC is asked to perform an out of world action. "bob, save"]

The action processing internal rule response (A) is "[bracket]That command asks to do something outside of play, so it can only make sense from you to me. [The noun] cannot be asked to do this.[close bracket]".

[this is the equivalent to "I don't understand that sentence," only it prints when giving instructions to an NPC. "Bob, put key adfakjhgkasdjf" for instance.]

The action processing internal rule response (K) is "I didn't understand that instruction.".


section 2  (general parser error messages)


[despite appearances, these seem to appear because of incomplete or flawed code. they are not really player feedback. the cause is when an action or command is incompletely remapped. For instance:
	
understand "grab" as taking

occurs when an "understand" phrase does not include a token for the thing to be acted upon or a rule for handling the missing noun. Typing "grab" alone on a command line will return a "you must supply a noun" message. Customize these if you wish, but the problem isn't the message, it's the code.

I'm not completely clear on the method for triggering C, E, G, and I since adding extra nouns/objects to understand phrases results in compile errors.

See 18.32 in the docs, "supplying a missing noun."]

The action processing internal rule response (B) is "You must name an object.".
The action processing internal rule response (C) is "You may not name an object.".
The action processing internal rule response (D) is "You must supply a noun.".
The action processing internal rule response (E) is "You may not supply a noun.".
The action processing internal rule response (F) is "You must name a second object.".
The action processing internal rule response (G) is "You may not name a second object.".
The action processing internal rule response (H) is "You must supply a second noun.".
The action processing internal rule response (I) is "You may not supply a second noun.".


[this one is funny. if you have something happen that makes a command invalid, this will fire. Very rare. For instance, if the player types "take all" but your project includes...

after taking the lamp:
	move the player to the closet.
	
...the "take all" has been disrupted.]


The action processing internal rule response (J) is "(Since something dramatic has happened, your list of commands has been cut short.)".

[incomplete command with gibberish for a second noun.

"put me alskdjfh"]

The parser error internal rule response (A) is "I didn't understand that sentence.".

[adding gibberish after a command applying to one thing. Note that it's going to print part of the player's command, so the format is important.

"examine me alsdkjh"]

The parser error internal rule response (B) is "I only understood you as far as wanting to ".

[adding gibberish after a complete go command. format should be preserved

"south adskljh"]

The parser error internal rule response (C) is "I only understood you as far as wanting to (go) ".

[the command requires a number, but the player typed text or gibberish instead

"count to asdkfjl"]

The parser error internal rule response (D) is "I didn't understand that number.".

[the most familiar of all these responses, perhaps. Prints when the player's command refers to a noun that is not visible or in scope. or else the noun (or a typo) does not exist anywhere in the game. Be careful with snark.]

The parser error internal rule response (E) is "[We] [can't] see any such thing.".

[very few actions allow multiple nouns or "all."

"examine all"]

The parser error internal rule response (H) is "You can't use multiple objects with that verb.".

[using a pronoun when Inform 7 can't discern what it is referring to.

"examine her" when there is no "her" in the location]

The parser error internal rule response (J) is "I'm not sure what ['][pronoun i6 dictionary word]['] refers to.".

[the last noun referred to is not in the current location, so Inform 7 doesn't understand the pronoun used

"examine him" after leaving the room]

The parser error internal rule response (K) is "[We] [can't] see ['][pronoun i6 dictionary word]['] ([the noun]) at the moment.".

[attempting to do something that can only be done to things designated as applying to people only (in command grammar).

"kiss hat"]

The parser error internal rule response (M) is "You can only do that to something animate.".

[begin a command with something that is not a valid verb]

The parser error internal rule response (N) is "That's not a verb I [if American dialect option is active]recognize[otherwise]recognise[end if].".

[trying to do something to a specific number of a kind, but the number can't work (too high for instance)

"take three shoes" when there are only two shoes in the location.]

The parser error internal rule response (Q) is "[if number understood is 0]None[otherwise]Only [number understood in words][end if] of those [regarding the number understood][are] available.".

[a kind is specified in command grammar, but the command is used for something else.

For instance:

understand "frob [any shoe]" as frobbing"

">frob hat"]

The parser error internal rule response (R) is "That noun did not make sense in this context.".

[what it says]

The parser error internal rule response (T) is "You can't begin with a comma.".

[attempting to talk to someone who is not in the room:
	
"bob, jump" or "asdkluhasdfk, jump"]

The parser error internal rule response (U) is "You seem to want to talk to someone, but I can't see whom.".

[talking to a thing that isn't a person]

The parser error internal rule response (V) is "You can't talk to [the noun].".

[add something after the addressed person but before the comma in a "person, [action]" construction,

"bob asldkf, jump"]

The parser error internal rule response (W) is "To talk to someone, try 'someone, hello' or some such.".

[enter an empty (blank) command]

The parser error internal rule response (X) is "I beg your pardon?".

[some cases of specifying "all" in a command when there are no matching nouns

"put all in chest" when the player is not carrying anything]

The parser nothing error internal rule response (B) is "[There] [adapt the verb are from the third person plural] none at all available!".

[this error is triggered when attempting to take all from something that is not carrying anything. as you can see, the error doesn't actually apply to that situation.

a bug has been reported; perhaps this will be different in a future release. The original is preserved in this comment, but because it is bugged I have rewritten it.

The parser nothing error internal rule response (C) is "[regarding the noun][Those] [seem] to belong to [the noun].".
]

The parser nothing error internal rule response (C) is "[The noun] [aren't] carrying anything at the moment.".

[putting things in something that is is not a container

"put coin in sword]

The parser nothing error internal rule response (D) is "[regarding the noun][Those] [can't] contain things.".

[trying to take something from a closed opaque container, whether there's anything there or not. Alternately, trying to take all from an empty transparent container, because there's nothing there to create a "can't reach into containers" message. Trust me! If you want to account for both transparent and opaque contaienrs, here's an example with conditional text.

The parser nothing error internal rule response (E) is "[The noun][if the noun is transparent] [are] clearly empty[otherwise] [aren't] open[end if].".]

The parser nothing error internal rule response (E) is "[The noun] [aren't] open.".

[Different from the examine and search containers rules below. Instead, applies to things like

"get all from chest" when chest is empty.]

The parser nothing error internal rule response (F) is "[The noun] [are] empty.".

[the printed name of a dark room. affects the status line only, not the room description]

The darkness name internal rule response (A) is "Darkness".

[attempting to correct something with "OOPS" when the command is fine, the correction is not allowed (out of world commands for instance, or the correction is wrong

"oops take" or "oops save" or "oops asdlkjh"]

The parser command internal rule response (A) is "Sorry, that can't be corrected.".

[triggered by typing "oops" by itself at the command prompt without any corrected text.]

The parser command internal rule response (B) is "Think nothing of it.".

[exactly as stated

"oops take ball"]

The parser command internal rule response (C) is "'Oops' can only correct a single word.".

[using the again command on the first turn of a game. restoring a save should not have this effect since saves contain previous command information]

The parser command internal rule response (D) is "You can hardly repeat that.".

[a disambiguation question for commands that are directed to a person.

"person, jump" or "take person" when there is more than one person in the room.]

The parser clarification internal rule response (A) is "Who do you mean, ".

[a very familiar disambiguation question. You can handle this with a rule instead, as in "rule for asking which do you mean:"]
.
The parser clarification internal rule response (B) is "Which do you mean, ".

[using "all" in certain disambiguation answers when multiple nouns are not permitted, i.e."

>x shoe
Which do you mean, the sneaker or heel?

>all
Sorry, you can only have one item here. Which exactly?

also note that this appears to be missing a line break, so I've added one.]

The parser clarification internal rule response (C) is "Sorry, you can only have one item here. Which exactly?[line break]".

[a slightly different variant of the who do you mean question. The most obvious diffence is "whom" as opposed to "who." It is triggered when command grammar specifies a person."

"kiss person" will trigger this response, but "examine person" will trigger parser clarification internal rule response (A).]

The parser clarification internal rule response (D) is "Whom do you want [if the noun is not the player][the noun] [end if]to [parser command so far]?".

[applies when there is not enough information to ask a which do you mean question

"take" in a room full of things.]

The parser clarification internal rule response (E) is "What do you want [if the noun is not the player][the noun] [end if]to [parser command so far]?".

[text printed for an "if the player consents phrase".]

The yes or no question internal rule response (A) is "Please answer yes or no.".

[built in addition for explicit taking, i.e. "wear shirt" when the shirt isn't held by the player.]

The standard implicit taking rule response (A) is "(first taking [the noun])[command clarification break]".

[implicit taking when persuading an NPC, ie "janet, wear shirt".]

The standard implicit taking rule response (B) is "([the second noun] first taking [the noun])[command clarification break]".

[better to use "end the story saying "something"".]

The print obituary headline rule response (C) is " The End ".



section 3 (out of world and meta)

[only happens if you declare "use undo prevention" in your project.]

The immediately undo rule response (A) is "The use of 'undo' is forbidden in this story.".

[using "undo" at the beginning of a game.]

The immediately undo rule response (B) is "You can't 'undo' what hasn't been done!".

[hopefully this never comes up, unless the project targets retro systems with limited resources. perhaps not even then. I'm not aware of a specific interpreter with this limitation, especially not one capable of running Glulx games.]

The immediately undo rule response (C) is "Your interpreter does not provide 'undo'. Sorry!".

[standard Undo response. If you want more control over undo behavior, I recommend the extension "undo output control" by nathanael nerode.]

The immediately undo rule response (E) is "[bracket]Previous turn undone.[close bracket]".

[the undo stack is held in memory, and the number of turns that can be undone will vary according to computing conditions. but once you're out, you're out.]

The immediately undo rule response (F) is "'Undo' capacity exhausted. Sorry!".

[standard responses based on starting stopping etc]

The quit the game rule response (A) is "Are you sure you want to quit? ".
The save the game rule response (A) is "Save failed.".
The save the game rule response (B) is "Ok.".
The restore the game rule response (A) is "Restore failed.".
The restore the game rule response (B) is "Ok.".
The restart the game rule response (A) is "Are you sure you want to restart? ".
The restart the game rule response (B) is "Failed.".
The verify the story file rule response (A) is "The game file has verified as intact.".
The verify the story file rule response (B) is "The game file did not verify as intact, and may be corrupt.".
The switch the story transcript on rule response (A) is "Transcripting is already on.".
The switch the story transcript on rule response (B) is "Start of a transcript of:".
The switch the story transcript on rule response (C) is "Attempt to begin transcript failed.".
The switch the story transcript off rule response (A) is "Transcripting is already off.".
The switch the story transcript off rule response (B) is "[line break]End of transcript.".
The switch the story transcript off rule response (C) is "Attempt to end transcript failed.".

[changing room description preferences. rarely used these days.]

The standard report preferring abbreviated room descriptions rule response (A) is " is now in its 'superbrief' mode, which always gives short descriptions of locations (even if you haven't been there before).".
The standard report preferring unabbreviated room descriptions rule response (A) is " is now in its 'verbose' mode, which always gives long descriptions of locations (even if you've been there before).".
The standard report preferring sometimes abbreviated room descriptions rule response (A) is " is now in its 'brief' printing mode, which gives long descriptions of places never before visited and short descriptions otherwise.".

[pertaining to endings and final questions]

The print the final prompt rule response (A) is "> [run paragraph on]".
The print the final question rule response (A) is "Would you like to ".
The print the final question rule response (B) is " or ".
The standard respond to final question rule response (A) is "Please give one of the answers above.".

section 4 (scoring)

The announce the score rule response (A) is "[if the story has ended]In that game you scored[otherwise]You have so far scored[end if] [score] out of a possible [maximum score], in [turn count] turn[s]".
The announce the score rule response (B) is ", earning you the rank of ".
The announce the score rule response (C) is "[There] [are] no score in this story.".
The announce the score rule response (D) is "[bracket]Your score has just gone up by [number understood in words] point[s].[close bracket]".
The announce the score rule response (E) is "[bracket]Your score has just gone down by [number understood in words] point[s].[close bracket]".
The standard report switching score notification on rule response (A) is "Score notification on.".
The standard report switching score notification off rule response (A) is "Score notification off.".


section 5 (descriptions and appearances)

[I don't think changing these will be productive for many authors, but I'll leave them up here because they print so often.]

[when we have asserted an "initial appearance" for something, it will get its own paragraph in the room description. other litems will be listed, constructed from A through F]

The you-can-also-see rule response (A) is "[We] ".
The you-can-also-see rule response (B) is "On [the domain] [we] ".
The you-can-also-see rule response (C) is "In [the domain] [we] ".
The you-can-also-see rule response (D) is "[regarding the player][can] also see ".
The you-can-also-see rule response (E) is "[regarding the player][can] see ".
The you-can-also-see rule response (F) is " here".

[used for listing contents of supporters in room descriptions]

The use initial appearance in room descriptions rule response (A) is "On [the item] ".
The describe what's on scenery supporters in room descriptions rule response (A) is "On [the item] ".
The describe what's on mentioned supporters in room descriptions rule response (A) is "On [the item] ".

[unlike The darkness name internal rule response (A), this prints as a room name while looking, but doesn't change the status bar]

The room description heading rule response (A) is "Darkness".

[room description of a dark room]

The room description body text rule response (A) is "[It] [are] pitch dark, and [we] [can't see] a thing.".

[prints when a player is in or on an enterable container / supporter]

The room description heading rule response (B) is " (on [the intermediate level])".
The room description heading rule response (C) is " (in [the intermediate level])".

Section 6 (looking, examining, and searching)

The other people looking rule response (A) is "[The actor] [look] around.".
The examine directions rule response (A) is "[We] [see] nothing unexpected in that direction.".
The examine containers rule response (A) is "In [the noun] ".
The examine containers rule response (B) is "[The noun] [are] empty.".
The examine supporters rule response (A) is "On [the noun] ".
The examine devices rule response (A) is "[The noun] [are] [if story tense is present tense]currently [end if]switched [if the noun is switched on]on[otherwise]off[end if].".
The examine undescribed things rule response (A) is "[We] [see] nothing special about [the noun].".
The report other people examining rule response (A) is "[The actor] [look] closely at [the noun].".
The standard looking under rule response (A) is "[We] [find] nothing of interest.".
The report other people looking under rule response (A) is "[The actor] [look] under [the noun].".
The can't search unless container or supporter rule response (A) is "[We] [find] nothing of interest.".
The can't search closed opaque containers rule response (A) is "[We] [can't see] inside, since [the noun] [are] closed.".
The standard search containers rule response (A) is "In [the noun] ".
The standard search containers rule response (B) is "[The noun] [are] empty.".
The standard search supporters rule response (A) is "On [the noun] ".
The standard search supporters rule response (B) is "[There] [are] nothing on [the noun].".
The report other people searching rule response (A) is "[The actor] [search] [the noun].".

[consulting involves checking a noun for a topic, ie looking something up in an encyclopedia.]

The block consulting rule response (A) is "[We] [discover] nothing of interest in [the noun].".
The block consulting rule response (B) is "[The actor] [look] at [the noun].".

section 7 (inventory)

[these rules don't change much, as the listed items are what people are looking for in an inventory response. that will require a custom rule, which is high effort (but a good experience!) for beginning authors looking for a challenge. See 6.7 in the Inform 10.2 documentation, along with the provided examples for more information.]

The print empty inventory rule response (A) is "[We] [are] carrying nothing.".
The print standard inventory rule response (A) is "[We] [are] carrying:[line break]".
The report other people taking inventory rule response (A) is "[The actor] [look] through [their] possessions.".

section 8 (taking, dropping, inserting, putting)

[the rule names here are happily comprehensible. some are high-risk in my opinion, so test thoroughly. Note as always that container and supporter responses are scattered everywhere, so take care to be consistent while changing those.]

The can't take yourself rule response (A) is "[We] [are] always self-possessed.".
The can't take other people rule response (A) is "I don't suppose [the noun] [would care] for that.".
The can't take component parts rule response (A) is "[regarding the noun][Those] [seem] to be a part of [the whole].".

[IMPORTANT: This rule only applies to TAKING things that are held by NPCs. REMOVING things, or TAKING things FROM is a separate action that has its own ruleset. Those cases are generally covered by the The can't remove from people rule response (A). If the NPC is not holding anything, a parser error is generated instead: the parser nothing error internal rule response (C).]

The can't take people's possessions rule response (A) is "[regarding the noun][Those] [seem] to belong to [the owner].".
The can't take items out of play rule response (A) is "[regarding the noun][Those] [aren't] available.".
The can't take what you're inside rule response (A) is "[We] [would have] to get [if noun is a supporter]off[otherwise]out of[end if] [the noun] first.".
The can't take what's already taken rule response (A) is "[We] already [have] [regarding the noun][those].".
The can't take scenery rule response (A) is "[regarding the noun][They're] hardly portable.".
The can only take things rule response (A) is "[We] [cannot] carry [the noun].".
The can't take what's fixed in place rule response (A) is "[regarding the noun][They're] fixed in place.".
The use player's holdall to avoid exceeding carrying capacity rule response (A) is "(putting [the transferred item] into [the current working sack] to make room)[command clarification break]".
The can't exceed carrying capacity rule response (A) is "[We]['re] carrying too many things already.".
The standard report taking rule response (A) is "Taken.".
The standard report taking rule response (B) is "[The actor] [pick] up [the noun].".
The can't remove what's not inside rule response (A) is "But [regarding the noun][they] [aren't] there now.".

[IMPORTANT: This rule only applies to REMOVING (or TAKING) things FROM NPCs. TAKING things that are held by an NPC involves a separate action that has its own ruleset. Those cases are generally covered by the The can't take people's possessions rule response (A). If the NPC is not holding anything, a parser error is generated instead: the parser nothing error internal rule response (C).]

The can't remove from people rule response (A) is "[regarding the noun][Those] [seem] to belong to [the owner].".
The can't drop yourself rule response (A) is "[We] [lack] the dexterity.".
The can't drop body parts rule response (A) is "[We] [can't drop] part of [ourselves].".
The can't drop what's already dropped rule response (A) is "[The noun] [are] already here.".
The can't drop what's not held rule response (A) is "[We] [haven't] got [regarding the noun][those].".
The can't drop clothes being worn rule response (A) is "(first taking [the noun] off)[command clarification break]".
The can't drop if this exceeds carrying capacity rule response (A) is "[There] [are] no more room on [the receptacle].".
The can't drop if this exceeds carrying capacity rule response (B) is "[There] [are] no more room in [the receptacle].".
The standard report dropping rule response (A) is "Dropped.".
The standard report dropping rule response (B) is "[The actor] [put] down [the noun].".
The can't put something on itself rule response (A) is "[We] [can't put] something on top of itself.".
The can't put onto what's not a supporter rule response (A) is "Putting things on [the second noun] [would achieve] nothing.".
The can't put clothes being worn rule response (A) is "(first taking [regarding the noun][them] off)[command clarification break]".
The can't put if this exceeds carrying capacity rule response (A) is "[There] [are] no more room on [the second noun].".
The concise report putting rule response (A) is "Done.".
The standard report putting rule response (A) is "[The actor] [put] [the noun] on [the second noun].".
The can't insert what's already inserted rule response (A) is "[The noun] [are] already there.".
The can't insert something into itself rule response (A) is "[We] [can't put] something inside itself.".
The can't insert into closed containers rule response (A) is "[The second noun] [are] closed.".
The can't insert into what's not a container rule response (A) is "[regarding the second noun][Those] [can't contain] things.".
The can't insert clothes being worn rule response (A) is "(first taking [regarding the noun][them] off)[command clarification break]".
The can't insert if this exceeds carrying capacity rule response (A) is "[There] [are] no more room in [the second noun].".
The concise report inserting rule response (A) is "Done.".
The standard report inserting rule response (A) is "[The actor] [put] [the noun] into [the second noun].".

section 9 (going and traversal)

[even though travelling features many messages, some are quite uncommon. others are hard to replace in a way that gives all needed information. I didn't break these up and move some to the end (caution advised section), but modifying some of these have potential for making trouble.]

The block vaguely going rule response (A) is "You'll have to say which compass direction to go in.".
The stand up before going rule response (A) is "(first getting off [the chaise])[command clarification break]".
The can't travel in what's not a vehicle rule response (A) is "[We] [would have] to get off [the nonvehicle] first.".
The can't travel in what's not a vehicle rule response (B) is "[We] [would have] to get out of [the nonvehicle] first.".
The can't go through undescribed doors rule response (A) is "[We] [can't go] that way.".
The can't go through closed doors rule response (A) is "(first opening [the door gone through])[command clarification break]".
The can't go that way rule response (A) is "[We] [can't go] that way.".
The can't go that way rule response (B) is "[We] [can't], since [the door gone through] [lead] nowhere.".
The describe room gone into rule response (A) is "[The actor] [go] up".
The describe room gone into rule response (B) is "[The actor] [go] down".
The describe room gone into rule response (C) is "[The actor] [go] [noun]".
The describe room gone into rule response (D) is "[The actor] [arrive] from above".
The describe room gone into rule response (E) is "[The actor] [arrive] from below".
The describe room gone into rule response (F) is "[The actor] [arrive] from [the back way]".
The describe room gone into rule response (G) is "[The actor] [arrive]".
The describe room gone into rule response (H) is "[The actor] [arrive] at [the room gone to] from above".
The describe room gone into rule response (I) is "[The actor] [arrive] at [the room gone to] from below".
The describe room gone into rule response (J) is "[The actor] [arrive] at [the room gone to] from [the back way]".
The describe room gone into rule response (K) is "[The actor] [go] through [the noun]".
The describe room gone into rule response (L) is "[The actor] [arrive] from [the noun]".
The describe room gone into rule response (M) is "on [the vehicle gone by]".
The describe room gone into rule response (N) is "in [the vehicle gone by]".
The describe room gone into rule response (O) is ", pushing [the thing gone with] in front, and [us] along too".
The describe room gone into rule response (P) is ", pushing [the thing gone with] in front".
The describe room gone into rule response (Q) is ", pushing [the thing gone with] away".
The describe room gone into rule response (R) is ", pushing [the thing gone with] in".
The describe room gone into rule response (S) is ", taking [us] along".
The can't enter what's already entered rule response (A) is "But [we]['re] already on [the noun].".
The can't enter what's already entered rule response (B) is "But [we]['re] already in [the noun].".
The can't enter what's not enterable rule response (A) is "[regarding the noun][They're] not something [we] [can] stand on.".
The can't enter what's not enterable rule response (B) is "[regarding the noun][They're] not something [we] [can] sit down on.".
The can't enter what's not enterable rule response (C) is "[regarding the noun][They're] not something [we] [can] lie down on.".
The can't enter what's not enterable rule response (D) is "[regarding the noun][They're] not something [we] [can] enter.".
The can't enter closed containers rule response (A) is "[We] [can't get] into the closed [noun].".
The can't enter if this exceeds carrying capacity rule response (A) is "[There] [are] no more room on [the noun].".
The can't enter if this exceeds carrying capacity rule response (B) is "[There] [are] no more room in [the noun].".
The can't enter something carried rule response (A) is "[We] [can] only get into something free-standing.".
The implicitly pass through other barriers rule response (A) is "(getting off [the current home])[command clarification break]".
The implicitly pass through other barriers rule response (B) is "(getting out of [the current home])[command clarification break]".
The implicitly pass through other barriers rule response (C) is "(getting onto [the target])[command clarification break]".
The implicitly pass through other barriers rule response (D) is "(getting into [the target])[command clarification break]".
The implicitly pass through other barriers rule response (E) is "(entering [the target])[command clarification break]".
The standard report entering rule response (A) is "[We] [get] onto [the noun].".
The standard report entering rule response (B) is "[We] [get] into [the noun].".
The standard report entering rule response (C) is "[The actor] [get] into [the noun].".
The standard report entering rule response (D) is "[The actor] [get] onto [the noun].".
The can't exit when not inside anything rule response (A) is "But [we] [aren't] in anything at the [if story tense is present tense]moment[otherwise]time[end if].".
The can't exit closed containers rule response (A) is "You can't get out of the closed [cage].".
The standard report exiting rule response (A) is "[We] [get] off [the container exited from].".
The standard report exiting rule response (B) is "[We] [get] out of [the container exited from].".
The standard report exiting rule response (C) is "[The actor] [get] out of [the container exited from].".
The can't get off things rule response (A) is "But [we] [aren't] on [the noun] at the [if story tense is present tense]moment[otherwise]time[end if].".
The standard report getting off rule response (A) is "[The actor] [get] off [the noun].".

section 10 (locks and locking)

[locking isn't thoroghly implemented in the standard rules. it's worth a bit of research or checking out the locksmith extension by emily short before spending a lot of time here.]

The can't lock without a lock rule response (A) is "[regarding the noun][Those] [don't] seem to be something [we] [can] lock.".
The can't lock what's already locked rule response (A) is "[regarding the noun][They're] locked at the [if story tense is present tense]moment[otherwise]time[end if].".
The can't lock what's open rule response (A) is "First [we] [would have] to close [the noun].".
The can't lock without the correct key rule response (A) is "[regarding the second noun][Those] [don't] seem to fit the lock.".
The standard report locking rule response (A) is "[We] [lock] [the noun].".
The standard report locking rule response (B) is "[The actor] [lock] [the noun].".
The can't unlock without a lock rule response (A) is "[regarding the noun][Those] [don't] seem to be something [we] [can] unlock.".
The can't unlock what's already unlocked rule response (A) is "[regarding the noun][They're] unlocked at the [if story tense is present tense]moment[otherwise]time[end if].".
The can't unlock without the correct key rule response (A) is "[regarding the second noun][Those] [don't] seem to fit the lock.".
The standard report unlocking rule response (A) is "[We] [unlock] [the noun].".
The standard report unlocking rule response (B) is "[The actor] [unlock] [the noun].".


section 11 (devices)

The can't switch on unless switchable rule response (A) is "[regarding the noun][They] [aren't] something [we] [can] switch.".
The can't switch on what's already on rule response (A) is "[regarding the noun][They're] already on.".
The standard report switching on rule response (A) is "[The actor] [switch] [the noun] on.".
The can't switch off unless switchable rule response (A) is "[regarding the noun][They] [aren't] something [we] [can] switch.".
The can't switch off what's already off rule response (A) is "[regarding the noun][They're] already off.".
The standard report switching off rule response (A) is "[The actor] [switch] [the noun] off.".

section 12 (opening and closing)

The can't open unless openable rule response (A) is "[regarding the noun][They] [aren't] something [we] [can] open.".
The can't open what's already open rule response (A) is "[regarding the noun][They're] already open.".
The can't open what's locked rule response (A) is "[regarding the noun][They] [seem] to be locked.".

[opening an opaque container that contains something]

The reveal any newly visible interior rule response (A) is "[We] [open] [the noun], revealing ".

[====]

The standard report opening rule response (A) is "[We] [open] [the noun].".
The standard report opening rule response (B) is "[The actor] [open] [the noun].".
The can't close unless openable rule response (A) is "[regarding the noun][They] [aren't] something [we] [can] close.".
The can't close what's already closed rule response (A) is "[regarding the noun][They're] already closed.".
The standard report closing rule response (A) is "[We] [close] [the noun].".
The standard report closing rule response (B) is "[The actor] [close] [the noun].".

section 13 (wearing and taking off)

The can't wear what's not clothing rule response (A) is "[We] [can't wear] [regarding the noun][those]!".
The can't wear what's not held rule response (A) is "[We] [aren't] holding [regarding the noun][those]!".
The can't wear what's already worn rule response (A) is "[We]['re] already wearing [regarding the noun][those]!".
The standard report wearing rule response (A) is "[We] [put] on [the noun].".
The standard report wearing rule response (B) is "[The actor] [put] on [the noun].".
The can't take off what's not worn rule response (A) is "[We] [aren't] wearing [the noun].".
The can't exceed carrying capacity when taking off rule response (A) is "[We]['re] carrying too many things already.".
The standard report taking off rule response (A) is "[We] [take] off [the noun].".
The standard report taking off rule response (B) is "[The actor] [take] off [the noun].".
The implicitly remove thrown clothing rule response (A) is "(first taking [the noun] off)[command clarification break]".

section 14 (giving)

The can't give what you haven't got rule response (A) is "[We] [aren't] holding [the noun].".
The can't give to yourself rule response (A) is "[We] [can't give] [the noun] to [ourselves].".
The can't give to a non-person rule response (A) is "[The second noun] [aren't] able to receive things.".
The can't give clothes being worn rule response (A) is "(first taking [the noun] off)[command clarification break]".
The block giving rule response (A) is "[The second noun] [don't] seem interested.".
The can't exceed carrying capacity when giving rule response (A) is "[The second noun] [are] carrying too many things already.".
The standard report giving rule response (A) is "[We] [give] [the noun] to [the second noun].".
The standard report giving rule response (B) is "[The actor] [give] [the noun] to [us].".
The standard report giving rule response (C) is "[The actor] [give] [the noun] to [the second noun].".
The can't show what you haven't got rule response (A) is "[We] [aren't] holding [the noun].".

section 15 (manipulating objects)

The can't pull what's fixed in place rule response (A) is "[regarding the noun][They] [are] fixed in place.".
The can't pull scenery rule response (A) is "[We] [are] unable to.".
The can't pull people rule response (A) is "[The noun] [might not like] that.".
The report pulling rule response (A) is "Nothing obvious [happen].".
The report pulling rule response (B) is "[The actor] [pull] [the noun].".
The can't push what's fixed in place rule response (A) is "[regarding the noun][They] [are] fixed in place.".
The can't push scenery rule response (A) is "[We] [are] unable to.".
The can't push people rule response (A) is "[The noun] [might not like] that.".
The report pushing rule response (A) is "Nothing obvious [happen].".
The report pushing rule response (B) is "[The actor] [push] [the noun].".
The can't turn what's fixed in place rule response (A) is "[regarding the noun][They] [are] fixed in place.".
The can't turn scenery rule response (A) is "[We] [are] unable to.".
The can't turn people rule response (A) is "[The noun] [might not like] that.".
The report turning rule response (A) is "Nothing obvious [happen].".
The report turning rule response (B) is "[The actor] [turn] [the noun].".
The can't push unpushable things rule response (A) is "[The noun] [cannot] be pushed from place to place.".
The can't push to non-directions rule response (A) is "[regarding the noun][They] [aren't] a direction.".
The can't push vertically rule response (A) is "[The noun] [cannot] be pushed up or down.".
The can't push from within rule response (A) is "[The noun] [cannot] be pushed from here.".
The block pushing in directions rule response (A) is "[The noun] [cannot] be pushed from place to place.".

section 16 (blocked actions and generic responses)

[You'll need to "get in front" of these rules or delist if you want to use these actions for something other than printing default messages.]

The block showing rule response (A) is "[The second noun] [are] unimpressed.".
The block waking rule response (A) is "That [seem] unnecessary.".
The futile to throw things at inanimate objects rule response (A) is "Futile.".
The block throwing at rule response (A) is "[We] [lack] the nerve when it [if story tense is the past tense]came[otherwise]comes[end if] to the crucial moment.".
The block attacking rule response (A) is "Violence [aren't] the answer to this one.".
The kissing yourself rule response (A) is "[We] [don't] get much from that.".
The block kissing rule response (A) is "[The noun] [might not] like that.".
The standard report waiting rule response (A) is "Time [pass].".
The standard report waiting rule response (B) is "[The actor] [wait].".
The report touching yourself rule response (A) is "[We] [achieve] nothing by this.".
The report touching yourself rule response (B) is "[The actor] [touch] [themselves].".
The report touching other people rule response (A) is "[The noun] [might not like] that.".
The report touching other people rule response (B) is "[The actor] [touch] [us].".
The report touching other people rule response (C) is "[The actor] [touch] [the noun].".
The report touching things rule response (A) is "[We] [feel] nothing unexpected.".
The report touching things rule response (B) is "[The actor] [touch] [the noun].".
The can't wave what's not held rule response (A) is "But [we] [aren't] holding [regarding the noun][those].".
The report waving things rule response (A) is "[We] [wave] [the noun].".
The report waving things rule response (B) is "[The actor] [wave] [the noun].".
The innuendo about squeezing people rule response (A) is "[The noun] [might not like] that.".
The report squeezing rule response (A) is "[We] [achieve] nothing by this.".
The report squeezing rule response (B) is "[The actor] [squeeze] [the noun].".
The block burning rule response (A) is "This dangerous act [would achieve] little.".
The block waking up rule response (A) is "The dreadful truth [are], this [are not] a dream.".
The block thinking rule response (A) is "What a good idea.".
The report smelling rule response (A) is "[We] [smell] nothing unexpected.".
The report smelling rule response (B) is "[The actor] [sniff].".
The report listening rule response (A) is "[We] [hear] nothing unexpected.".
The report listening rule response (B) is "[The actor] [listen].".
The report tasting rule response (A) is "[We] [taste] nothing unexpected.".
The report tasting rule response (B) is "[The actor] [taste] [the noun].".
The block cutting rule response (A) is "Cutting [regarding the noun][them] up [would achieve] little.".
The report jumping rule response (A) is "[We] [jump] on the spot.".
The report jumping rule response (B) is "[The actor] [jump] on the spot.".
The block tying rule response (A) is "[We] [would achieve] nothing by this.".
The block drinking rule response (A) is "[There's] nothing suitable to drink here.".
The block saying sorry rule response (A) is "Oh, don't [if American dialect option is active]apologize[otherwise]apologise[end if].".
The block swinging rule response (A) is "[There's] nothing sensible to swing here.".
The can't rub another person rule response (A) is "[The noun] [might not like] that.".
The report rubbing rule response (A) is "[We] [rub] [the noun].".
The report rubbing rule response (B) is "[The actor] [rub] [the noun].".
The block setting it to rule response (A) is "No, [we] [can't set] [regarding the noun][those] to anything.".
The report waving hands rule response (A) is "[We] [wave].".
The report waving hands rule response (B) is "[The actor] [wave].".
The block buying rule response (A) is "Nothing [are] on sale.".
The block climbing rule response (A) is "Little [are] to be achieved by that.".
The block sleeping rule response (A) is "[We] [aren't] feeling especially drowsy.".
The can't eat unless edible rule response (A) is "[regarding the noun][They're] plainly inedible.".
The can't eat clothing without removing it first rule response (A) is "(first taking [the noun] off)[command clarification break]".
The can't eat other people's food rule response (A) is "[The owner] [might not appreciate] that.".
The standard report eating rule response (A) is "[We] [eat] [the noun]. Not bad.".
The standard report eating rule response (B) is "[The actor] [eat] [the noun].".

section 17 (communication)

The block answering rule response (A) is "[There] [are] no reply.".
The telling yourself rule response (A) is "[We] [talk] to [ourselves] a while.".
The block telling rule response (A) is "This [provoke] no reaction.".
The block asking rule response (A) is "[There] [are] no reply.".
The block saying yes rule response (A) is "That was a rhetorical question.".
The block saying no rule response (A) is "That was a rhetorical question.".


chapter 9 (scope and visibility)

[You probably will not want to do anything with these, unless you are experimenting with visibility and scope. And a lot of the time, the error isn't really related to the player, it's the result of some programming.]

[This is an errror message about darkness. It fires when the light is suddenly cut off.]

The adjust light rule response (A) is "[It] [are] [if story tense is present tense]now [end if]pitch dark in [if story tense is present tense]here[else]there[end if]!".

[this is what prints when attempting to interact with something that must be visible in a dark room]

The basic visibility rule response (A) is "[It] [are] pitch dark, and [we] [can't see] a thing.".

[I've only triggered this one by trying to physically interact with a direction: "take south" for instance. Perhaps it could be applied to other nouns (a direction is a noun), but I've never seen it done. Note that you can circumvent this with a "before" rule, because visibility and accessibility are still mushy. For instance...

before climbing up:
	try going up instead.
	
...works, but...

instead of climbing up:
	try going up.
	
...doesn't, because "instead" happens too late in action processing.]

The basic accessibility rule response (A) is "You must name something more substantial.".

[This is a strange one. Most often it results from code rather than player action, for instance redirecting an action to a noun that isn't present]

The access through barriers rule response (A) is "[regarding the noun][Those] [aren't] available.".

[I believe this only prints when trying to manipulate an object inside (or from within) a closed, transparent container.

EXCEPTION: this is only true if there is something in the chest. Otherwise, the rather unhelpful parser nothing error internal rule response (E) will report that the empty, transparent container is empty. Be sure to check it as well!]

The can't reach inside closed containers rule response (A) is "[The noun] [aren't] open.".
The can't reach outside closed containers rule response (A) is "[The noun] [aren't] open.".

[this usually means you changed the scope of the player and they are trying to interact with something in another room. you'll have to disable the reach inside rooms rule if you want something different. note that this can cause really weird things to happen]

The can't reach inside rooms rule response (A) is "[We] [can't] reach into [the noun].".

section 10 (the list writer)

[I have no advice, though messing with this seems hazardous]

The list writer internal rule response (A) is " (".
The list writer internal rule response (B) is ")".
The list writer internal rule response (C) is " and ".
The list writer internal rule response (D) is "providing light".
The list writer internal rule response (E) is "closed".
The list writer internal rule response (F) is "empty".
The list writer internal rule response (G) is "closed and empty".
The list writer internal rule response (H) is "closed and providing light".
The list writer internal rule response (I) is "empty and providing light".
The list writer internal rule response (J) is "closed, empty[if serial comma option is active],[end if] and providing light".
The list writer internal rule response (K) is "providing light and being worn".
The list writer internal rule response (L) is "being worn".
The list writer internal rule response (M) is "open".
The list writer internal rule response (N) is "open but empty".
The list writer internal rule response (O) is "closed".
The list writer internal rule response (P) is "closed and locked".
The list writer internal rule response (Q) is "containing".
The list writer internal rule response (R) is "on [if the noun is a person]whom[otherwise]which[end if] ".
The list writer internal rule response (S) is ", on top of [if the noun is a person]whom[otherwise]which[end if] ".
The list writer internal rule response (T) is "in [if the noun is a person]whom[otherwise]which[end if] ".
The list writer internal rule response (U) is ", inside [if the noun is a person]whom[otherwise]which[end if] ".
The list writer internal rule response (V) is "[regarding list writer internals][are]".
The list writer internal rule response (W) is "[regarding list writer internals][are] nothing".
The list writer internal rule response (X) is "Nothing".
The list writer internal rule response (Y) is "nothing".

section 11 (caution is advised)

[these are substitutions for other rule responses. changing them is not recommended.]

The parser clarification internal rule response (F) is "those things".
The parser clarification internal rule response (G) is "that".
The parser clarification internal rule response (H) is " or ".

[printed names for the protagonist. These shouldn't come up much, and always seem awkward when they do. take care to avoid weird sentences and test heavily. (C) suggests a problem in code.]

The print protagonist internal rule response (A) is "[We]".
The print protagonist internal rule response (B) is "[ourselves]".
The print protagonist internal rule response (C) is "[our] former self".

[pronoun lister]

The announce the pronoun meanings rule response (A) is "At the moment, ".
The announce the pronoun meanings rule response (B) is "means ".
The announce the pronoun meanings rule response (C) is "is unset".
The announce the pronoun meanings rule response (D) is "no pronouns are known to the game.".

[lists items in commands applied to multiple things, i.e. "take all" or "put all in chest". hazardous, probably]

The announce items from multiple object lists rule response (A) is "[current item from the multiple object list]: [run paragraph on]".


chapter 99999999 (vestigal)

section 1 (confirmed)

The generate action rule response (A) is "(considering the first sixteen objects only)[command clarification break]".
The generate action rule response (B) is "Nothing to do!".
The parser error internal rule response (F) is "You seem to have said too little!".
The parser error internal rule response (G) is "[We] [aren't] holding that!".
The parser error internal rule response (I) is "You can only use multiple objects once on a line.".
The parser error internal rule response (O) is "That's not something you need to refer to in the course of this game.".
The parser error internal rule response (P) is "I didn't understand the way that finished.".
The print obituary headline rule response (A) is " You have died ".
The print obituary headline rule response (B) is " You have won ".




section 2 (not sure how to trigger or if it's possible)

The parser nothing error internal rule response (A) is "Nothing to do!".
The immediately undo rule response (D) is "'Undo' failed. Sorry!".

[these seem to be a failsafe for something other than an actor closing or opening things.]

The standard report opening rule response (C) is "[The noun] [open].".
The standard report closing rule response (C) is "[The noun] [close].".

[Inform doesn't seem to mind excluding excluded things. Vestigal?]

The parser error internal rule response (L) is "You excepted something not included anyway!".

[I can't recreate this. Inform returns "There is no reply."]

The parser error internal rule response (S) is "To repeat a command like 'frog, jump', just say 'again', not 'frog, again'.".







Default Responses Template ends here.



---- DOCUMENTATION ----

On its own, this extension does nothing when installed. It is all redundant to code in the Standard Rules. Default Responses Template is meant to list every parser and action response built into Inform 7, including comments or examples where needed. You can copy/paste into your own project, or edit and install as an extension to use in projects.

Every built-in response is accounted for here, though changing some will not seem worth the effort. Others will be very challenging (in a technical sense) to adjust. If you are trying to hack the list writer, for instance, you probably don't need this extension.

It's very important to understand that, speaking very generally, this extension contains two types of messages. Some occur while Inform is parsing a commmand. Others occur afterward, while Inform is attempting to respond to the parsed command (Sections 1 and 2 in this document). In the second case (Nearly everything after Section 2), Inform has determined the action and relevant nouns (if any). Things like scope and visibility are usually (there are exceptions!) decided upon. These texts are mostly action processing responses, then, and most of us will be on familiar ground, since writing action processing rules is one of the first things authors learn. If you need more information regarding the ways in which these action responses are triggered, you can look them up in Graham Nelson's Standard Rules extension. Just search for the relevant rule, i.e., "report listening rule" (do not include "response" in your search).

With regard to messages printed during parsing: since the command has not yet been fully parsed, it may be there there is not yet a "[the noun]" or "[the number understood]" or "[the current action]". In other cases, as we can see above, these things are known. Take care when writing parser messages, and verify tokens and substitutions as you work.

Book 1 (brief craft suggestions)

Some general advice: it can be hard to find replies that always apply, especially with low-level things like parser errors. For instance, while giving an error that a noun is not present, the error might simply mean that it is not currently visible. It could also mean that there is no such thing in the world of the game! Getting tester feedback is essential.

Note that players will be very frustrated with snark if messages repeat often, especially if some of the author's own writing may cause confusion (mentioning nouns in descriptions that aren't implemented, for instance). Players also scan over parser messages after a while, so be careful with long reponses

Book 2 (adaptations and substitutions)

Regarding adaptive text: these default messages are written so that they can make sense, logic-wise (the narrative voice is another question!) anywhwehere. To have a response that works in every game, the voice must be less specific, certainly, and some allowances must be made for different verb tenses, pronouns, and so forth. Inform 7 is very smart about this kind of thing. You can read about it in Chapter 10 of the Inform 10.2 documentation. If you are writing responses for a specific game, you are free to specify relevant nouns and verb tenses in those reponses. After all, you control the tenses and pronouns in your own game.

	https://zedlopez.github.io/i7doc/WI_14.html

As an example, this is the kind of thing one might write for a message that must work anywhere and everywhere:
	
	The report listening rule response (A) is "[We] [hear] nothing unexpected.".

This response, on the other hand, is completely tailored for a single game and its voice:
	
	The report listening rule response (A) is "You can hear my voice, can't you? What else matters?".
	
As always, it is the author's perogative to choose between portability and accuracy according to the goals of their project.



