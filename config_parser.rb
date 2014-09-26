require 'bigdecimal'

class ConfigParser

  def self.parse(filename = "#{File.expand_path(File.dirname(__FILE__))}/config_file.txt")
    configparser = File.open(filename, "r").read

    format(configparser).each do |line|
      (key, value) = line.split("=")
      if key && value
        define_method(key) do
          make_boolean(value) if boolean_like(value)
          make_numeric(value) if numeric_like(value)
          value
        end
      end
    end
  end

  private

  def boolean_like(value)
    ["on", "off", "yes", "no", "true", "false"].include?(value)
  end

  def make_boolean(value)
    value = value.downcase
    if boolean_like(value)
      value = (value == "true" || value == "on" || value == "yes")
    else
      value
    end
  end

  def numeric_like(value)
    num = BigDecimal.new(value)
    num.nonzero? == nil ? false : true
  end

  def make_numeric(value)
    num = BigDecimal.new(value)
    if num.frac == 0
      num.to_i
    else
      num.to_f
    end
  end

  def self.format(configparser)
    configparser = configparser.gsub(/^#.*/, "").strip.split("\n")
    configparser.map {|line| line.gsub(" ", "")}
  end
  parse

  config_file = ConfigParser.new

  puts config_file.host
  puts config_file.server_id
  puts config_file.server_load_alarm
  puts config_file.user
  puts config_file.verbose
  puts config_file.test_mode
  puts config_file.debug_mode
  puts config_file.log_file_path
  puts config_file.send_notifications
end
