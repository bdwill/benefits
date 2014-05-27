# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def format_date(date)
    date.strftime("%m/%d/%Y")
  end
  
  def format_datetime(date)
    date.strftime("%m/%d/%Y %H:%M:%S")
  end
end
