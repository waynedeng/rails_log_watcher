require 'logger'
require 'log4r'
require 'log4r/yamlconfigurator'
require 'log4r/outputter/datefileoutputter'

class RailsLogWatcher < Logger
  attr_accessor :warn_request_secs, :warn_secs

  alias ext_old_format_message format_message

  def format_message(severity, timestamp, progname, msg)
    analyze_log_message timestamp, msg
    ext_old_format_message severity, timestamp, progname, msg
  end

  protected

  def watcher_logger
    unless @watcher_log
      cfg = Log4r::YamlConfigurator
      cfg.load_yaml_file(RAILS_ROOT + '/config/log4r.yml')
      @watcher_log = Log4r::Logger['watch_log']

      self.warn_request_secs ||= 10
      self.warn_secs ||= 5
    end
    @watcher_log
  end

  def clean_str(str)
    str.gsub(/\n/, '').lstrip
  end

  def analyze_log_message(timestamp, msg)
    return if msg.blank?

    if msg =~ /Processing (\w+)\#(\w+)/
      watcher_logger.debug clean_str(msg)
    end

    if msg =~ /Completed in ([\d|.]+)ms/
      complete_time = $1.to_f
      if complete_time > self.warn_request_secs.to_f * 1000.0
        watcher_logger.warn clean_str(msg)
      else
        watcher_logger.debug clean_str(msg)
      end
    elsif msg =~ /\(([\d|.]+)ms\)/
      complete_time = $1.to_f
      if complete_time > self.warn_secs.to_f * 1000.0
        watcher_logger.warn clean_str(msg)
      end
    end
  end

end
