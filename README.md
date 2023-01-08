# Cheat Sheet for Vim commands

### Vertical navigation

| Command  | Description                              |
| -------- | ---------------------------------------- |
| ctrl + u | Half page up                             |
| ctrl + d | Half page down                           |
| %        | Toggle between opening and closing ()/{} |

### Horizontal navigation

| Command  | Description                          |
| -------- | ------------------------------------ |
| f<char>  | go to next selection of <char>       |
| F<char>  | go to previous selection of <char>   |
| f<char>, | jump to next occurence of <char>     |
| f<char>; | jump to previous occurence of <char> |

### Text selection

| Command | Description                               |
| ------- | ----------------------------------------- |
| vi)     | Selects everything inside parantheses     |
| vib     | Selects everything inside parantheses (() |
| viB     | Selects everything inside parantheses (}) |
| vap     | Select current paragraph                  |

### Text manipulation

| Command                | Description                              |
| ---------------------- | ---------------------------------------- |
| C-v, <j/k>, I, --, Esc | Comment out block of code (here with --) |
| C-v, <j/k/h/l>, X      | Remove block comment                     |

### Window management

| Command        | Description                            |
| -------------- | -------------------------------------- |
| <leader>s<v/h> | New window <vertical/horizontal> split |
| ctrl + <hjkl>  | Navigate windows                       |
| <leader>sx     | Close current split window             |
| <leader>to     | Open new terminal window               |
| <leader>tx     | Close current terminal window          |
| <leader>tn     | Go to next terminal tab                |
| <leader>tp     | Go to previous terminal tab            |

### Searching

| Command                           | Description                                             |
| --------------------------------- | ------------------------------------------------------- |
| :vimgrep /Neovim/gj \*\*/\*       | Search for all occurences of Neovim and fill quicklist  |
| :cfdo %s/Neovim/Nvim/ge \| update | Replace all occurences of Neovim in quicklist with Nvim |
