module MenusHelper
  def time_display(menu)
    menu.start && menu.stop ? "#{menu.start.strftime("%I:%M %p")} - #{menu.stop.strftime("%I:%M %p")}" : "no hours"
  end
end
