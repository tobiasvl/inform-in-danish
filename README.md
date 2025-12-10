# Inform in Danish

This language package allows you to write Inform 10.2 story files in Danish.

## Documentation

This README file only covers technical information on how to use this repository.

The documentation for using the actual language package can be read online: https://tobiasvl.github.io/inform-in-danish/

That documentation is generated from the source code in this repository, which consists of an [Inweb](https://ganelson.github.io/inweb/inweb/) web (a literate program), and is hosted on GitHub Pages from the generated `docs/` directory (which should not be edited directly).

To rebuild the documentation from the source code, install [inweb](https://github.com/ganelson/inweb) and run this command in the root of this repository:

    inweb weave -colony colony.inweb

## Installation

The [Releases](https://github.com/tobiasvl/inform-danish/releases) contains prepared zip files for both Inform 10.1 and 10.2. The contents of the zip file should be placed in an Inform "nest".

Installing the language package from this GitHub repo depends on whether you're using Inform 10.2 (the beta version, currently not released officially) or Inform 10.1 (the most recent official release):

### Inform 10.2

The directory `Danish Language.i7dx` should be placed somewhere in an Inform "nest". If you don't know what that means, the easiest thing to do is to create the directory `Extensions/Tobias Langhoff` in your Inform project's Materials folder (usually `Projects/Your Project.materials`) and place the directory there.

Some day, when Inform 10.2 has been released and is available as a desktop app, and proposal [IE-0017](https://github.com/ganelson/inform-evolution/blob/main/proposals/0017-apps-and-extensions.md) has been implemented, you should be able to "Add Extension to Project" and select the directory in this repository; it will then be installed to your project and be ready to use.

### Inform 10.1

The extension should probably work in Inform 10.1 as well (the most recently released official version).

After copying `Danish Language.i7dx` to your Inform nest (see above), you will need to move (or copy, or symlink, or somehow make available) the directories `Danish Language.i7dx/Materials/Inter` and `Danish Language.i7dx/Materials/Languages` into the Inform nest (see above) for Inform 10.1 to find them.

Then you need to rename `Languages/Danish/language_metadata.json_inform_10.1` to `Languages/Danish/language_metadata.json` (overwriting the existing file).

## Including the extension

To use the language package in your story file, add the string ` (in Danish)` after your story title at the top:

    "My Project" by Tobias Langhoff (in Danish)

## Building your story file

Documenting how to use the beta version of Inform 10.2 is beyond the scope of this README, but this is how I build my project on the command line (Linux):

    inform/inform7/Tangled/inform7 -debug -release -no-index -no-progress -project "Projects/My Project.inform" &&
    inform/inform6/Tangled/inform6 -G -wE2 -SD "Projects/My Project.inform/Build/auto.inf "Projects/My Project.inform/Build/output.ulx" &&
    inform/inblorb/Tangled/inblorb "Projects/My Project.inform/Release.blurb" "Projects/My Project.materials/Release/My Project.gblorb

This assumes that [inform](https://github.com/ganelson/inform) has been installed in the directory `inform`, and that `Projects` contains your projects.

For more information on how to use the command line utilities of Inform, see [this discussion](https://intfiction.org/t/command-line-inform-7-how-to-use-ni-inform6-and-cblorb-by-cli-for-9-3-6m62/50108/3).
