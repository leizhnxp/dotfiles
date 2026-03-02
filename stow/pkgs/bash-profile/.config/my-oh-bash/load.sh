## ref from webi pathman

touch -a ~/.config/my-oh-bash/PATH.env
touch -a ~/.config/my-oh-bash/ENV.env
touch -a ~/.config/my-oh-bash/alias.env
touch -a ~/.config/my-oh-bash/function.sh

test -z "${MY_BASH_PROFILE_LOAD:-}" && . ~/.config/my-oh-bash/ENV.env
test -z "${MY_BASH_PROFILE_LOAD:-}" && . ~/.config/my-oh-bash/PATH.env

export MY_BASH_PROFILE_LOAD='loaded'

test -z "${g_my_bash_profile_load_sh:-}" && . ~/.config/my-oh-bash/function.sh
test -z "${g_my_bash_profile_load_sh:-}" && . ~/.config/my-oh-bash/alias.env

g_my_bash_profile_load_sh='loaded'

