life in second half with zsh？
========

    .
    ├── files
    │   ├── bashrc.my.sh
    │   ├── gitignore
    │   ├── screenrc
    │   └── vimrc
    ├── install.sh
    ├── LICENSE
    ├── provision
    │   └── ssh
    │       ├── github-ssh-over-https.sh
    │       └── key460-to-authorized-keys.sh
    └── README.md


### step0. deploy ssh publickey first

+ with exist an account

```bash
# if blocked by GFW?

wget https://raw.fastgit.org/leizhnxp/dotfiles/master/provision/ssh/ssh/key460-to-authorized-keys.sh -O - | bash
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
  wget https://raw.fastgit.org/leizhnxp/dotfiles/master/provision/ssh/ssh/github-ssh-over-https.sh -O - | bash
  ```

### step2. install git and other tools ...


```bash
# if blocked by GFW?

sudo apt update && sudo apt upgrade && sudo apt install git vim tree curl screen tmux -y

```


