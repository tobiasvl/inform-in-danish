This package allows you to write stories that use the Danish language as the "language of play" in Inform.

## Installation

### Inform 10.1.2

The directories in this repository should be placed in Inform's local "nest" folder.

To find it: In the Inform IDE, select File -> Show Installed Extensions Folder and then go up one directory in the hierarchy.

### Future Inform versions

In the current development version of Inform, which is not released yet, the file structure of language packs will likely be simplified (see [IE-0016](https://github.com/ganelson/inform-evolution/blob/main/proposals/0016-language-extensions-reform.md#as-changed-by-this-proposal)). This is not yet supported by this repository, but you can reorganize the directories yourself, and it might work.

## Usage

Add the string ` (in Danish)` after the title of your Inform story. For example:

```inform
"Test" by "Tobias V. I. Langhoff" (in Danish)

The lab is a room.
```
