[TOC]

# rails-setup.sh
## Use
Setup The Development Environment of Rails By A Script.
```
# System Version: Ubuntu 14.04.
curl -sSL http://urlis.cn/rails-setup | bash
```
## Dependence
```
Ruby: 2.3.1
Rails: 5.0.0
Lib: git-core, curl, zlib1g-dev, build-essential, libssl-dev, libreadline-dev, libyaml-dev, libsqlite3-dev, sqlite3, libxml2-dev, libxslt1-dev, libcurl4-openssl-dev, python-software-properties, libffi-dev
Else: Rbenv, Ruby-build(rbenv plugin), PostgreSQL
```

# rails-config-development.sh
## Use
Configuring The Development Environment of Rails By A Script.
```
# System Version: Ubuntu 14.04.
curl -sSL http://urlis.cn/rails-config-development | bash
```
## Mirrors Of China
```
gem sources --add https://gems.ruby-china.org/ --remove https://rubygems.org/ --remove http://rubygems.org/
bundle config mirror.https://rubygems.org https://gems.ruby-china.org
```
See more at [Ruby-China Gems](https://gems.ruby-china.org/)
