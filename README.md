# daniel
plugin for oh-my-zsh with random, oft-used commands

These are commands that I often use, which are sometimes too complicated to easily remember:

## glogs
glogs does a word search through the commit messages in the repository, and returns the relevant commits with the search term highlighted
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

## agv
agv searches files using the Silver Searcher `ag` and opens the results in vim as separate tabs
`vim -p $(ag -l <search_term>)`

*Usage:*
```
agv donuts
```

## gpto
gpto, also aliased to gepetto, takes the current branch and create pushes it to origin.
`local branch=$(git symbolic-ref --short HEAD)`
combined with
`git push --set-upstream origin $branch`
#### Deprecated- use gpsup in oh-my-zsh

*Usage:*
```
$ gpto

$ gepetto
```

# shell_plus
shell_plus is a convenience shortcut for `python manage.py shell_plus` in Django.
If it doesn't find the command in the current folder, then it moves one directory up, and 
attempts to execute it from that folder.

*Usage:*
```
$ shell_plus
```

# gcos
gcos searches through your existing branches and switches to the first branch that matches
the search string.

*Usage*
```
$ gcos pony
Switched to branch 'feature/31_add_pony_to_django'
Your branch is up to date with 'origin/feature/31_add_pony_to_django.'
```
