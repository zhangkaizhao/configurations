# Ruby

## Ruby gems

[Ruby gems](ruby-gems.txt): local set of installed Ruby gems as Ruby tools for development.

## RubyGems 和 Bundle 配置

https://gems.ruby-china.com/

1) 设置 RubyGems 的 sources ：

```shell
$ gem sources --add https://gems.ruby-china.com/ --remove https://rubygems.org/
$ gem sources -l
https://gems.ruby-china.com
```

确保 sources 中只有 gems.ruby-china.com 。

2) 使用 Bundler 的 Gem 源代码镜像命令：

```shell
$ bundle config mirror.https://rubygems.org https://gems.ruby-china.com
```

这样就不用改 Gemfile 的 source，比如：

```text
source 'https://rubygems.org/'
gem 'rails', '4.2.5'
```

官方文档： http://bundler.io/v1.16/man/bundle-config.1.html#MIRRORS-OF-GEM-SOURCES
