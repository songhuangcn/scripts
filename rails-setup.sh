#####################
#  Installing Ruby  #
#####################
sudo apt-get update
sudo apt-get install -y git git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev

cd
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exec $SHELL

git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
git clone https://github.com/andorchen/rbenv-china-mirror.git ~/.rbenv/plugins/rbenv-china-mirror

rbenv install 2.3.1
rbenv global 2.3.1
ruby -v

gem sources --add https://gems.ruby-china.org/ --remove https://rubygems.org/
gem source
gem update --system
gem -v


#####################
#  Configuring Git  #
#####################
git config --global color.ui true
git config --global user.name "PineWong"
git config --global user.email "pinewong@163.com"
ssh-keygen -t rsa -b 4096 -C "pinewong@163.com"
cat ~/.ssh/id_rsa.pub


######################
#  Installing Rails  #
######################
sudo apt-get install -y nodejs

gem install rails
rbenv rehash
rails -v


###########################
#  Setting Up PostgreSQL  #
###########################
sudo apt-get update
sudo apt-get install postgresql-common
sudo apt-get install postgresql libpq-dev
