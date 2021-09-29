# frozen_string_literal: true

module DateHelper
  def format_date(date_or_time)
    date_or_time.strftime("%A %B %d, %Y")
  end
end
