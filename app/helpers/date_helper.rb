# frozen_string_literal: true

module DateHelper
  def format_date(date_or_time)
    date_or_time.strftime("%A, %B %d, %Y")
  end

  def format_month(date_or_time)
    date_or_time.strftime("%B %Y")
  end
end
