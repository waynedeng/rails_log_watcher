rails_log_watcher
=================

== Watch and analyze rails log, mark long time requests and sqls.

== Require Log4R and tested in rails 2 only.

## Install
  
    $ sudo gem install log4r
    $ sudo gem install rails_log_watcher
  
## Usage    

    #config/environments/development.rb or production.rb
    require "rails_log_watcher"
    config.logger = RailsLogWatcher.new(config.log_path)
    config.logger.warn_request_secs = 5
    config.logger.warn_secs = 2
    config.log_level = :debug

    #copy log4r.yml to config/log4r.yml

Copyright (c) 2012  MIT-LICENSE

Author : Wayne Deng

Web    : http://blog.waynedeng.com

Email  : wayne.deng.cn(AT).com
