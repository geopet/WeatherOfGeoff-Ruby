# Weather of Geoff - Ruby Style!

This is a new WoG that is being developed in Ruby. Good times!

## Setup

To run WoG-R you need a [Weather Underground API
key](http://www.wunderground.com/weather/api/). There isn't much to
that. Rename `config.rb.sample` to `config.rb` and enter your key into
the `config.rb.sample` file. Make sure that the `HOME` global is set to
your home zip code.

You will need to make sure that `current.rb` permissions are set to
execute. `$ chmod u+x current.rb` will likely be enough. 

Running WoG-R from the commandline is super simple after that. If you're
in the directory just run current.rb followed by any number of zip codes
separated by a space. For example `$ ./current.rb 80302 20005 94107` will
provide current weather output for Boulder CO, Washington DC and San
Francisco CA.

In the `config.rb` there are global variables for `HOME` and `WORK`. I
recommend filling in the `HOME` global so you can easily call
`current.rb` without any arguments, i.e., `$ ./current.rb`. If these
globals are set with zip codes then enter `$ ./current.rb work` or
`$ ./current.rb home` and you'll get the current weather for work or home
respectively.

## Pro Tip

Add the path to `current.rb` to your `.bash_profile` as an alias and
you can just call it like a common command. 

Example: `alias current_weather='/Users/username/Documents/WoGR/current.rb'`

Now the command is `$ current_weather` and you'll get the
weather for your home zip code. Hotness!


