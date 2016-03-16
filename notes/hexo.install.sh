curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.29.0/install.sh | bash
nvm install 5.0.0
sudo npm install hexo-cli -g --registry=http://registry.npm.taobao.org
cd tmp
hexo init blog
cd blog/
npm install --registry=http://registry.npm.taobao.org
hexo new "firstPost" #万事开头未必难，有时在决心
npm install hexo-deployer-git --save --registry=http://registry.npm.taobao.org
hexo g
vim _config.yml 
hexo d
