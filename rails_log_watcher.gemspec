Gem::Specification.new do |s|
  s.name = %q{rails_log_watcher}
  s.version = "0.0.1"

  s.authors = ["Wayne Deng"]
  s.date = %q{2012-09-28}
  s.platform    = Gem::Platform::RUBY
  s.summary     = "Watch and analyze rails log, mark long time requests and sqls."
  s.description = "Watch and analyze rails log, mark long time requests and sqls."
  s.email = %q{wayne.deng.cn@gmail.com}
  s.homepage = %q{http://blog.waynedeng.com}
  s.files = ["README.md", "lib/rails_log_watcher.rb", "log4r.yml", "rails_log_watcher.gemspec"]
  s.require_paths = ["lib"]
  s.requirements << 'log4r'
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "SqlLogic", "--main", "README"]

end