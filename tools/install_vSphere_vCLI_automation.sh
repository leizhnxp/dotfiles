#!/usr/bin/env bash

wget https://raw.githubusercontent.com/leizhnxp/dotfiles/master/tools/install_vsphere_vCLI_prerequisite.sh 
sh install_vsphere_vCLI_prerequisite.sh << EOF
yes
sudo
yes
EOF

wget https://raw.githubusercontent.com/leizhnxp/dotfiles/master/tools/install_vSphere_CLI.sh

sh install_vSphere_CLI.sh << EOF
no
yes

EOF

