# dev-environment-files

Dev environment files for Neovim and tmux, zsh, ++.

## Setup

### Installations

Below are some project dependencies, as well as some handy command line tools:

Dependencies:

```sh
brew install autojump deno exa fzf neovim pure ripgrep ruff tmux
```

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/joshskidmore/zsh-fzf-history-search ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-fzf-history-search
```

Optional

```sh
brew install bat dive htop pre-commit
```

### Symlinks

Run the following in order to set up symlinks for development files:

```sh
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/ruff.toml ~/ruff.toml
ln -s ~/dotfiles/. ~/.config/nvim
```

## Cheat Sheet for (n)vim commands

### Vertical navigation

| Command  | Description                              |
| -------- | ---------------------------------------- |
| ctrl + u | Half page up                             |
| ctrl + d | Half page down                           |
| ctrl + e | Move viewport one down                   |
| ctrl + y | Move viewport one up                     |
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

| Command                | Description                                   |
| ---------------------- | --------------------------------------------- |
| C-v, <j/k>, I, --, Esc | Comment out block of code (here with --)      |
| C-v, <j/k/h/l>, X      | Remove block comment                          |
| :-10t.                 | Copy text on ten lines above and paste below  |
| :t10                   | Copy the current line and paste below line 10 |
| :10,20t.               | Copy lines 10 to 20 and paste below           |

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

### Searching and replacing

| Command                           | Description                                             |
| --------------------------------- | ------------------------------------------------------- |
| :vimgrep /Neovim/gj \*\*/\*       | Search for all occurences of Neovim and fill quicklist  |
| :cfdo %s/Neovim/Nvim/ge \| update | Replace all occurences of Neovim in quicklist with Nvim |
| /foo CR cgn bar Esc .             | Change occurnce of "foo" to "bar", press "." to repeat  |

## tmux

To use tmux, install it with homebrew first:

```sh
brew install tmux
```

Create a symlink pointing to the tmux config file in this repository:

```sh
ln -s ~/.config/nvim/.tmux.conf ~/.tmux.conf
```

Install tmux package manager:

```sh
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Install dependencies:

```sh
brew install fzf
```
