Example: *** Et slør af mørke
Title: Et slør af mørke

This example is based on work by Roger Firth (original Inform 6 implementation),
Thomas Bøvith (translation to Danish), Emily Short and Graham Nelson (Inform 7
implementation).

    {*} "Et slør af mørke" (in Danish)

    The story headline is "A basic IF demonstration."

    The maximum score is 2.

Whatever room we define first becomes the starting room of the game, in the
absence of other instructions:

    Foyer of the Opera House is a room.  "Du står i en rummelig foyer, som er
    pragtfuldt udsmykket i røde og gyldne farver med funklende kandelabre i
    loftet. Indgangen fra gaden ligger mod nord, og der er døråbninger mod syd og
    vest."

    Instead of going north in the Foyer, say "Du er kun lige ankommet, og desuden
    virker det som om vejret udenfor bliver værre og værre."

We can add more rooms by specifying their relation to the first room.
Unless we say otherwise, the connection will automatically be bidirectional,
so "The Cloakroom is west of the Foyer" will also mean "The Foyer is east of the Cloakroom":

    The Cloakroom is west of the Foyer.
    "Væggene i dette lille rum var øjensynligt engang udstyret med
    rækker af knager, men nu er der blot en enkelt tilbage. Udgangen
    er en dør mod øst."

    In the Cloakroom is a supporter called the small brass hook.
    The hook is scenery. Understand "peg" as the hook.

Inform will automatically understand any words in the object definition
("small", "brass", and "hook", in this case), but we can add extra synonyms
with this sort of Understand command.

    The description of the hook is "It's just a small brass hook,
    [if something is on the hook]with [a list of things on the hook]
    hanging on it[otherwise]screwed to the wall[end if]."

This description is general enough that, if we were to add other hangable items
to the game, they would automatically be described correctly as well.

    The Bar is south of the Foyer. The printed name of the bar is "Foyer Bar".
    The Bar is dark.  "The bar, much rougher than you'd have guessed
    after the opulence of the foyer to the north, is completely empty.
    There seems to be some sort of message scrawled in the sawdust on the floor."

    The scrawled message is scenery in the Bar. Understand "floor" or "sawdust" as the message.

    Neatness is a kind of value. The neatnesses are neat, scuffed, and trampled.
    The message has a neatness. The message is neat.

We could if we wished use a number to indicate how many times
the player has stepped on the message, but Inform also makes it easy
to add descriptive properties of this sort, so that the code remains readable
even when the reader does not know what "the number of the message" might mean.

    Instead of examining the message:
        increase score by 1;
        say "The message, neatly marked in the sawdust, reads...";
        end the game in victory.

This second rule takes precedence over the first one whenever the message is trampled.
Inform automatically applies whichever rule is most specific:

    Instead of examining the trampled message:
        say "The message has been carelessly trampled, making it difficult to read.
        You can just distinguish the words...";
        end the game saying "You have lost".

This command advances the state of the message from neat to scuffed
and from scuffed to trampled. We can define any kinds of value we like
and advance or decrease them in this way:

    Instead of doing something other than going in the bar when in darkness:
        if the message is not trampled, change the neatness of the message
        to the neatness after the neatness of the message;
        say "In the dark? You could easily disturb something."

    Instead of going nowhere from the bar when in darkness:
        now the message is trampled;
        say "Blundering around in the dark isn't a good idea!"

This defines an object which is worn at the start of play.
Because we have said the player is wearing the item, Inform infers that it is clothing
and can be taken off and put on again at will.

    The player wears a velvet cloak. The cloak can be hung or unhung.
    Understand "dark" or "black" or "satin" as the cloak.
    The description of the cloak is "A handsome cloak,
    of velvet trimmed with satin, and slightly splattered with raindrops.
    Its blackness is so deep that it almost seems to suck light from the room."

    Carry out taking the cloak:
        now the bar is dark.

    Carry out putting the unhung cloak on something in the cloakroom:
        now the cloak is hung;
        increase score by 1.

    Carry out putting the cloak on something in the cloakroom:
        now the bar is lit.

    Carry out dropping the cloak in the cloakroom:
        now the bar is lit.

    Instead of dropping or putting the cloak on when the player is not in the cloakroom:
        say "This isn't the best place to leave a smart cloak lying around."

    When play begins:
        say "[paragraph break]Hurrying through the rainswept November night,
        you're glad to see the bright lights of the Opera House.
        It's surprising that there aren't more people about but, hey,
        what do you expect in a cheap demo game...?"

    Understand "hang [something preferably held] on [something]" as putting it on.

    Test me with "s / n / w / inventory / hang cloak on hook / e / s / read message".