# daniel
plugin for oh-my-zsh with random, oft-used commands

These are commands that I often use, which are sometimes too complicated to easily remember:

## glogs
glogs does a word search through the commit messages in the repository
`git log --color=always --all --grep=<search_term>`

*Usage:*
```
$ glogs initial
```

## glh
glh executes a line history, much like `git log -p` but based on an individual line range.
It uses the built in autocomplete to pass in filenames, something that is not possible in the actual command.
This command does not work for single lines, though
`git log -u -L<line1>,<line2>:<file_name>`

*Usage:*
```
$ glh 42-57 memory_files.py
```

## vack
vack searches files through `ack` and opens the results in vim as separate tabs
`vim -p $(ack -l <search_term>)

*Usage:*
```
vack donuts
```
