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
    def is_numeric?
      Float self rescue false
    end

    def convert_to_date
      if /\d{2}.\d{2}.\d{4}|\d{4}.\d{2}.\d{2}/.match(self)
        return self.to_date
      elsif self.is_numeric? and (37892..56142).cover?(self.to_i)
        return Date.new(1900,1,1) + self.to_i - 2
      else
        raise "incorrect date format"
      end
    end
  end

  module FixnumExtension
    def convert_to_date
      if (37892..56142).cover?(self.to_i)
        Date.new(1900,1,1) + self.to_i - 2
      else
        raise "incorrect date format"
      end
    end
  end

  module DateExtension
    def convert_to_date
      self
    end
  end
end

String.send(:include, DateDojo::StringExtension)
Fixnum.send(:include, DateDojo::FixnumExtension)
Date.send(:include, DateDojo::DateExtension)