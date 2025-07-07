life in second half with zsh
========

## struct 

    .
    ├── files
    │   ├── bashrc.my.sh
    │   ├── gitignore
    │   ├── my-oh-bash.sh
    │   ├── my-oh-zsh.zsh
    │   ├── screenrc
    │   └── vimrc
    ├── install.sh
    ├── LICENSE
    ├── provision
    │   ├── optional
    │   │   ├── immortal
    │   │   │   ├── docker-on-debian.sh
    │   │   │   └── utils-on-debian.sh
    │   │   └── temporal
    │   │       └── sdkman.sh
    │   └── ssh
    │       ├── github-ssh-over-https.sh
    │       └── key460-to-authorized-keys.sh
    └── README.md


+ install script , bash style

```bash
./install.sh 

# or

bash install.sh
```

+ dir provision

*to be continue*

## provision

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

### step2. install git , zsh and other tools ...

+ if listed in sudoer

```bash
sudo apt update && sudo apt upgrade

sudo apt install git curl zsh -y
```

+ install on-my-zsh

```bash
# ref https://ohmyz.sh/#install

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# or

sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

```

### step3. provision custom

```bash
cd $HOME

git clone https://github.com/leizhnxp/dotfiles.git

bash dotfiles/install.sh

```

+ provision other in dotfiles/provision/optional/

