#################################
#  Configuring Mirrors on China #
#################################
gem sources --add https://gems.ruby-china.org/ --remove https://rubygems.org/ --remove http://rubygems.org/
bundle config mirror.https://rubygems.org https://gems.ruby-china.org


#####################
#  Configuring Git  #
#####################
git config --global color.ui true
git config --global user.name "NAME"
git config --global user.email "NAME@EMAIL.COM"
ssh-keygen -t rsa -b 4096 -C "NAME@EMAIL.COM"
