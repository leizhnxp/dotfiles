life in second half with zsh
========

## struct 

    .
    |-- LICENSE
    |-- README.md
    |-- files
    |   |-- bashrc.my.sh
    |   |-- gitignore
    |   |-- my-oh-bash.sh
    |   |-- my-oh-zsh.zsh
    |   |-- screenrc
    |   `-- vimrc
    |-- install.sh
    `-- provision
        `-- ssh
            |-- github-ssh-over-https.sh
            `-- key460-to-authorized-keys.sh

### provision

+ install script , bash style

```bash
./install.sh 

# or

bash install.sh
```

+ dir provision

*to be continue*


### step0. deploy ssh publickey first

+ with exist an account

```bash
# if blocked by GFW?

wget https://raw.fastgit.org/leizhnxp/dotfiles/master/provision/ssh/key460-to-authorized-keys.sh -O - | bash
```

+ with cloud provider?

*to be continue*

### step1. network configuration (optional)

+ if living in China mainland, and using router bypass
  - setting the default route

  ```bash
  
  sudo ip route replace default via xxx.xxx.xxx.xxx
  
  ```
  - provision the sshconfig for github to use the ssh protocol
  ```bash
  wget https://raw.fastgit.org/leizhnxp/dotfiles/master/provision/ssh/github-ssh-over-https.sh -O - | bash
  ```

### step2. install git and other tools ...


```bash

sudo apt update && sudo apt upgrade && sudo apt install git vim tree curl screen tmux zsh -y

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

```

### step3. provision custom

```bash
cd $HOME

git clone https://github.com/leizhnxp/dotfiles.git

bash dotfiles/install.sh

```


