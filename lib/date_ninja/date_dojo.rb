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

    def is_numeric?
      Float self rescue false
    end

    def check_to_see_if_it_can_convert_to_date
      begin
        self.to_date
      rescue TypeError
        raise "incorrect date format"
      end
    end

    def convert_to_date
      if /^\d{2}\D\d{2}\D\d{4}$|^\d{4}\D\d{2}\D\d{2}$/.match(self)
        return self.check_to_see_if_it_can_convert_to_date
      elsif self.is_numeric? and (LOCAL_START_OF_TIME_IN_DAYS..LOCAL_END_OF_TIME_IN_DAYS).cover?(self.to_i)
        return Date.new(1900, 1, 1) + self.to_i - DAY_OFFSET
      else
        raise "incorrect date format"
      end
    end
  end

  module FixnumExtension
    LOCAL_START_OF_TIME_IN_DAYS = 37_892
    LOCAL_END_OF_TIME_IN_DAYS   = 56_142
    DAY_OFFSET                  = 2

    def convert_to_date
      raise "incorrect date format" unless (LOCAL_START_OF_TIME_IN_DAYS..LOCAL_END_OF_TIME_IN_DAYS).cover?(self.to_i)

      Date.new(1900, 1, 1) + self.to_i - DAY_OFFSET
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
