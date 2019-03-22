require "date_ninja/version"
require "date"

module DateDojo
  # if the date passed in meets the requriements it will be returned as a date. if not a string will be passed
  class DateSensei
    def self.date_format_validation(date)
      date.convert_to_date
    end
  end

  module StringExtension
    LOCAL_START_OF_TIME_IN_DAYS = 37_892
    LOCAL_END_OF_TIME_IN_DAYS   = 56_142
    DAY_OFFSET                  = 2

    def convert_to_date
      return convert_string_to_date!                  if string_date_ok?
      return Date.new(1900, 1, 1) + to_i - DAY_OFFSET if numeric_date_ok?

      raise "incorrect date format"
    end

    private

    def sanitize_date_separators
      gsub(/\D/, '-')
    end

    def numeric_date_ok?
      is_numeric? && (LOCAL_START_OF_TIME_IN_DAYS..LOCAL_END_OF_TIME_IN_DAYS).cover?(to_i)
    end

    def string_date_ok?
      self =~ /^\d{2}\D\d{2}\D\d{4}$|^\d{4}\D\d{2}\D\d{2}$/
    end

    def is_numeric?
      Float self
    rescue ArgumentError
      false
    end

    def convert_string_to_date!
      my_date_string = sanitize_date_separators

      my_date_string.to_date # This is an ActiveSupport 3.2 method...
    rescue TypeError
      raise "incorrect date format"
    end
  end

  module FixnumExtension
    LOCAL_START_OF_TIME_IN_DAYS = 37_892
    LOCAL_END_OF_TIME_IN_DAYS   = 56_142
    DAY_OFFSET                  = 2

    def convert_to_date
      raise "incorrect date format" unless numeric_date_ok?

      Date.new(1900, 1, 1) + to_i - DAY_OFFSET
    end

    private

    def numeric_date_ok?
      (LOCAL_START_OF_TIME_IN_DAYS..LOCAL_END_OF_TIME_IN_DAYS).cover?(to_i)
    end
  end

  module DateExtension
    def convert_to_date
      self
    end
  end

  module FloatExtension
    def convert_to_date
      raise "incorrect date format"
    end
  end
end

Float.send(:include,  DateDojo::FloatExtension)
String.send(:include, DateDojo::StringExtension)
Fixnum.send(:include, DateDojo::FixnumExtension)
Date.send(:include,   DateDojo::DateExtension)
