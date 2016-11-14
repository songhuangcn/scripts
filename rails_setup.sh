#####################
#  Installing Ruby  #
#####################
sudo apt-get install -y git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev && \

cd ~
git clone https://github.com/rbenv/rbenv.git ~/.rbenv && \
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build && \
git clone https://github.com/andorchen/rbenv-china-mirror.git ~/.rbenv/plugins/rbenv-china-mirror && \

cd ~/.rbenv && src/configure && make -C src && \

echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc && \
echo 'eval "$(rbenv init -)"' >> ~/.bashrc && \
exec $SHELL && \

rbenv install 2.3.1
rbenv global 2.3.1
ruby -v


################
#  Config Git  #
################
git config --global color.ui true && \
# git config --global user.name "pinewong"
# git config --global user.email "pinewong@163.com"


#################
#  Gem Sources  #
#################
gem sources --add https://gems.ruby-china.org/ --remove https://rubygems.org/ && \
gem sources -l
gem update --system
gem -v


########################
#  Installing Bundler  #
########################
gem install bundler && \
bundle config mirror.https://rubygems.org https://gems.ruby-china.org && \
bundler -v


#########################
#  Setting Up Database  #
#########################
# sudo apt-get install -y postgresql libpq-dev
# sudo apt-get install mysql-server mysql-client libmysqlclient-dev
sudo apt-get install mysql-server libmysqlclient-dev
