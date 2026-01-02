# Inform in Danish

# Usage

This extension lays the foundations of making Danish stories in Inform
(by translating English Language by Graham Nelson, as well as certain parts of
Basic Inform by Graham Nelson), but its bedrock is the Danish language kit,
which is also needed.

These parts are collected in a language pack located at
https://github.com/tobiasvl/inform-in-danish - if you're missing something,
download it from there.

To use this language pack, don't simply "Include" this extension in your story
file. Instead, write " (in Danish)" after your story heading at the top of the
story file.

# Grammar

## Gender

Danish has two grammatical genders: common (fælleskøn/utrum) and neuter
(intetkøn/neutrum). In this extension, common gender is called masculine gender
for technical reasons.

Every person (which in Inform means any animate thing, including animals) is
either male or female. This is the semantic gender, also known as the sex.
In addition, a person can be either neuter or not neuter. This is the same way
it works in English Inform. In Danish, however, if the person is neuter, it has
no semantic gender, and we defer to its grammatical gender instead to decide
its pronouns.

If a person is male and not neuter, its pronoun will be "han", and if female
and not neuter, "hun".

Every object (both animate and inanimate) has a grammatical gender, which can
be either masculine gender or neuter gender (not to be confused with the neuter
property of people above!).

If the grammatical gender of an object is masculine, it will be addressed as
"den", and if it is neuter it will be addressed as "det" (unless, as stated
above, the object is a person who is not neuter).

The default grammatical gender is masculine gender (ie. common gender), as 75%
of Danish nouns are common-gendered.

You can define the grammatical gender of an object (which you probably only
need to excplicitly do if it should be neuter gender, since masculine is
default).

This will make it masculine gender, because it is the default:

	Krystal is a thing.

This will explicitly make it masculine gender:

	Krystal is a thing. The grammatical gender of krystal is masculine gender.

This will make it neuter gender, but is cumbersome to write:

	Krystal is a thing. The grammatical gender of krystal is neuter gender.

This is easier, and needs to be done the first time the object is defined:

	Krystal (n) is a thing.

This excplicitly sets it as masculine gender:

	Krystal (m) is a thing.
