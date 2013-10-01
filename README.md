# DateNinja

Date ninja can validate the format of the date recived from excel sources. so if excel parses the data into either a string, fixnum or date it will return a date, or it will return an exception

## Installation

Add this line to your application's Gemfile:

    gem 'date_ninja'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install date_ninja

## Usage

where ever you need to get a date in the correct format just pass it to the DateNinja::DateDojo.date_format_validation(date) method. it will return a date object if the data from excel is in the correct format

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
