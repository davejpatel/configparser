Config Parser
=============

Using the language of your choice, write some code that can parse a
configuration file following the specifications below. Follow your
own best practices and coding/design principles.

- Do not use existing "complete" configuration parsing
  libraries/functions, we want to see how you would write the code
  to do this.
- Use of core and stdlib functions/objects such as string
  manipulation, regular expressions, etc is ok.
- We should be able to get the values of the config parameters in
  code, via their name. How this is done specifically is up to you.
- Boolean-like config values (on/off, yes/no, true/false) should
  return real booleans: true/false.
- Numeric config values should return real numerics: integers,
  doubles, etc
- Ignore or error out on invalid config lines, your choice.
- Please include a short example usage of your code so we can see
  how you call it/etc.
- Push your work to a public github repository and send us the link.

### Valid config file ###
```
# This is what a comment looks like, ignore it
# All these config lines are valid
host = test.com
server_id=55331
server_load_alarm=2.5
user= user
# comment can appear here as well
verbose =true
test_mode = on
debug_mode = off
log_file_path = /tmp/logfile.log
send_notifications = yes
```

### Usage ###
```
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
```

### Test output ###
```
$ rspec --color config_parser_spec.rb -fd
test.com
55331
2.5
user
true
on
off
/tmp/logfile.log
yes

ConfigParser
  #boolean_like
    should return true if string contains boolean type
  #make_boolean
    should convert a 'true' string to true
    should convert a 'false' string to false
  #numeric_like
    should return true if string is numeric
    should return false if string is non numeric
  #make_numeric
    should convert an integer string to an integer
    should convert a float string to a float
  .format
    should ignore commented config lines

Finished in 0.00411 seconds (files took 0.11779 seconds to load)
8 examples, 0 failures
```
