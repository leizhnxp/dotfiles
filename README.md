life in second half with zsh？
========

    .
    |-- LICENSE
    |-- README.md
    |-- files
    |   |-- bash_profile
    |   |-- bashrc.my.sh
    |   |-- dir_colors
    |   |-- gitignore
    |   |-- screenrc
    |   `-- vimrc
    |-- install.sh
    `-- provision
        `-- sshconfig.sh


#### step0. run sshconfig.sh first

+ with exist an account

```
# if blocked by GFW?

wget https://raw.fastgit.org/leizhnxp/dotfiles/provision/sshconfig.sh -O - | bash
```

+ with cloud provider?

*to be continue*

#### step1. install git and other tools ...


```bash
# if blocked by GFW?

sudo apt update && sudo apt upgrade && sudo apt install git vim tree curl screen tmux -y

```


