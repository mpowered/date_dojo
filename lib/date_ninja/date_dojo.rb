require "date_ninja/version"

module DateNinja
	class DateDojo
    def self.date_kung_fu(date)
      if date.class == String
        "string_date"
      else
        "numeric_date"
      end

    end
  end
end
